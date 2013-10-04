package com.enclothe.core.serviceprovider.service;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.common.email.service.EmailService;
import org.broadleafcommerce.common.email.service.info.EmailInfo;
import org.broadleafcommerce.common.security.util.PasswordChange;
import org.broadleafcommerce.common.security.util.PasswordReset;
import org.broadleafcommerce.common.security.util.PasswordUtils;
import org.broadleafcommerce.common.service.GenericResponse;
import org.broadleafcommerce.common.time.SystemTime;
import org.broadleafcommerce.profile.core.dao.CustomerForgotPasswordSecurityTokenDao;
import org.broadleafcommerce.profile.core.dao.RoleDao;
import org.broadleafcommerce.profile.core.domain.CustomerForgotPasswordSecurityToken;
import org.broadleafcommerce.profile.core.domain.CustomerForgotPasswordSecurityTokenImpl;
import org.broadleafcommerce.profile.core.domain.CustomerRole;
import org.broadleafcommerce.profile.core.domain.CustomerRoleImpl;
import org.broadleafcommerce.profile.core.domain.Role;
import org.broadleafcommerce.profile.core.service.handler.PasswordUpdatedHandler;
import org.broadleafcommerce.profile.core.service.listener.PostRegistrationObserver;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.broadleafcommerce.profile.core.service.IdGenerationService;
import com.enclothe.core.serviceprovider.dao.ServiceProviderDao;
import org.broadleafcommerce.profile.core.domain.Customer;

import com.enclothe.core.serviceprovider.domain.ServiceProvider;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

@Service("blServiceProviderService")
public class ServiceProviderServiceImpl implements ServiceProviderService {
	
private static final Log LOG = LogFactory.getLog(ServiceProviderServiceImpl.class);
    
    @Resource(name="blServiceProviderDao")
    protected ServiceProviderDao serviceProviderDao;

    @Resource(name="blIdGenerationService")
    protected IdGenerationService idGenerationService;
    
    @Resource(name="blCustomerForgotPasswordSecurityTokenDao")
    protected CustomerForgotPasswordSecurityTokenDao customerForgotPasswordSecurityTokenDao;  

    @Resource(name="blPasswordEncoder")
    protected PasswordEncoder passwordEncoder;
    
    /**
     * Optional password salt to be used with the passwordEncoder
     */
    protected String salt;
    
    @Resource(name="blRoleDao")
    protected RoleDao roleDao;
    
    @Resource(name="blEmailService")
    protected EmailService emailService;
    
    @Resource(name="blForgotPasswordEmailInfo")
    protected EmailInfo forgotPasswordEmailInfo;

    @Resource(name="blForgotUsernameEmailInfo")
    protected EmailInfo forgotUsernameEmailInfo;    
    
    @Resource(name="blRegistrationEmailInfo")
    protected EmailInfo registrationEmailInfo;    
    
    @Resource(name="blChangePasswordEmailInfo")
    protected EmailInfo changePasswordEmailInfo;       
    
    protected int tokenExpiredMinutes = 30;
    protected int passwordTokenLength = 20;   
             
    protected final List<PostRegistrationObserver> postRegisterListeners = new ArrayList<PostRegistrationObserver>();
    protected List<PasswordUpdatedHandler> passwordResetHandlers = new ArrayList<PasswordUpdatedHandler>();
    protected List<PasswordUpdatedHandler> passwordChangedHandlers = new ArrayList<PasswordUpdatedHandler>();

	@Override
	public ServiceProvider saveServiceProvider(ServiceProvider serviceProvider) {
		return saveServiceProvider(serviceProvider, true);
	}

	@Override
	public ServiceProvider saveServiceProvider(ServiceProvider serviceProvider,
			boolean register) {
		if (register && !serviceProvider.isRegistered()) {
			serviceProvider.setRegistered(true);
        }
        if (serviceProvider.getUnencodedPassword() != null) {
        	serviceProvider.setPassword(passwordEncoder.encodePassword(serviceProvider.getUnencodedPassword(), getSalt(serviceProvider)));
        }

        // let's make sure they entered a new challenge answer (we will populate
        // the password field with hashed values so check that they have changed
        // id
        if (serviceProvider.getUnencodedChallengeAnswer() != null && !serviceProvider.getUnencodedChallengeAnswer().equals(serviceProvider.getChallengeAnswer())) {
        	serviceProvider.setChallengeAnswer(passwordEncoder.encodePassword(serviceProvider.getUnencodedChallengeAnswer(), getSalt(serviceProvider)));
        }
        return serviceProviderDao.save(serviceProvider);
	}

	@Override
	public ServiceProvider registerServiceProvider(
			ServiceProvider serviceProvider, String password,
			String passwordConfirm) {
		serviceProvider.setRegistered(true);

        // When unencodedPassword is set the save() will encode it
        if (serviceProvider.getId() == null) {
        	serviceProvider.setId(findNextServiceProviderId());
        }
        serviceProvider.setUnencodedPassword(password);
        ServiceProvider retCustomer = saveServiceProvider(serviceProvider);
        createRegisteredServiceProviderRoles(retCustomer);
        
        HashMap<String, Object> vars = new HashMap<String, Object>();
        vars.put("serviceprovider", retCustomer);
        
        emailService.sendTemplateEmail(serviceProvider.getEmailAddress(), getRegistrationEmailInfo(), vars);        
        notifyPostRegisterListeners(retCustomer);
        return retCustomer;
	}
	
	protected void notifyPostRegisterListeners(ServiceProvider serviceProvider) {
        for (Iterator<PostRegistrationObserver> iter = postRegisterListeners.iterator(); iter.hasNext();) {
            PostRegistrationObserver listener = iter.next();
            listener.processRegistrationEvent((Customer)serviceProvider);
        }
    }
	
	public EmailInfo getRegistrationEmailInfo() {
        return registrationEmailInfo;
    }
	
	/**
     * Subclassed implementations can assign unique roles for various customer types 
     * 
     * @param customer
     */
    protected void createRegisteredServiceProviderRoles(ServiceProvider serviceProvider) {
        Role role = roleDao.readRoleByName("ROLE_SERVICEPROVIDER");
        CustomerRole customerRole = new CustomerRoleImpl();
        customerRole.setRole(role);
        customerRole.setCustomer((Customer)serviceProvider);
        roleDao.addRoleToCustomer(customerRole);
    }

	@Override
	public ServiceProvider readServiceProviderByUsername(
			String serviceProviderName) {
		return serviceProviderDao.readServiceProviderByFirstName(serviceProviderName);
	}

	@Override
	public ServiceProvider readServiceProviderByEmail(String emailAddress) {
		return serviceProviderDao.readServiceProviderByEmail(emailAddress);
	}

	@Override
	public ServiceProvider changePassword(PasswordChange passwordChange) {
		ServiceProvider serviceProvider = readServiceProviderByUsername(passwordChange.getUsername());
		serviceProvider.setUnencodedPassword(passwordChange.getNewPassword());
		serviceProvider.setPasswordChangeRequired(passwordChange.getPasswordChangeRequired());
		serviceProvider = saveServiceProvider(serviceProvider);
        
        for (PasswordUpdatedHandler handler : passwordChangedHandlers) {
            handler.passwordChanged(passwordChange, (Customer)serviceProvider, passwordChange.getNewPassword());
        }
        
        return serviceProvider;
	}

	@Override
	public ServiceProvider readServiceProviderById(Long userId) {
		return serviceProviderDao.readServiceProviderById(userId);
	}

	@Override
	public ServiceProvider createServiceProvider() {
		return createServiceProviderFromId(null);
	}

	@Override
	public ServiceProvider createServiceProviderFromId(Long serviceProviderId) {
		ServiceProvider serviceProvider = serviceProviderId != null ? readServiceProviderById(serviceProviderId) : null;
        if (serviceProvider == null) {
        	serviceProvider = serviceProviderDao.create();
            if (serviceProviderId != null) {
            	serviceProvider.setId(serviceProviderId);
            } else {
            	serviceProvider.setId(findNextServiceProviderId());
            }
        }
        return serviceProvider;
	}

	@Override
	public ServiceProvider createNewServiceProvider() {
		return createServiceProviderFromId(null);
	}

	@Override
	public void addPostRegisterListener(
			PostRegistrationObserver postRegisterListeners) {
		this.postRegisterListeners.add(postRegisterListeners);		
	}

	@Override
	public void removePostRegisterListener(
			PostRegistrationObserver postRegisterListeners) {
		if (this.postRegisterListeners.contains(postRegisterListeners)) {
            this.postRegisterListeners.remove(postRegisterListeners);
        }
	}

	@Override
	public ServiceProvider resetPassword(PasswordReset passwordReset) {
		ServiceProvider serviceProvider = readServiceProviderByUsername(passwordReset.getUsername());
        String newPassword = PasswordUtils.generateTemporaryPassword(passwordReset.getPasswordLength());
        serviceProvider.setUnencodedPassword(newPassword);
        serviceProvider.setPasswordChangeRequired(passwordReset.getPasswordChangeRequired());
        serviceProvider = saveServiceProvider(serviceProvider);
        
        for (PasswordUpdatedHandler handler : passwordResetHandlers) {
            handler.passwordChanged(passwordReset, (Customer)serviceProvider, newPassword);
        }
        
        return serviceProvider;
	}

	@Override
	public List<PasswordUpdatedHandler> getPasswordResetHandlers() {
		return passwordResetHandlers;
	}

	@Override
	public void setPasswordResetHandlers(
			List<PasswordUpdatedHandler> passwordResetHandlers) {
		this.passwordResetHandlers = passwordResetHandlers;		
	}

	@Override
	public List<PasswordUpdatedHandler> getPasswordChangedHandlers() {
		return passwordChangedHandlers;
	}

	@Override
	public void setPasswordChangedHandlers(
			List<PasswordUpdatedHandler> passwordChangedHandlers) {
		this.passwordChangedHandlers = passwordChangedHandlers;		
	}

	@Override
	public GenericResponse sendForgotUsernameNotification(String emailAddress) {
		GenericResponse response = new GenericResponse();
        List<ServiceProvider> serviceProviders = null;
        if (emailAddress != null) {
        	serviceProviders = serviceProviderDao.readServiceProvidersByEmail(emailAddress);
        }

        if (serviceProviders == null || serviceProviders.isEmpty()) {
            response.addErrorCode("notFound");
        } else {
            List<String> activeUsernames = new ArrayList<String>();
            for (ServiceProvider serviceProvider : serviceProviders) {
                if (! serviceProvider.isDeactivated()) {
                    activeUsernames.add(serviceProvider.getUsername());
                }
            }

            if (activeUsernames.size() > 0) {
                HashMap<String, Object> vars = new HashMap<String, Object>();
                vars.put("userNames", activeUsernames);
                emailService.sendTemplateEmail(emailAddress, getForgotUsernameEmailInfo(), vars);
            } else {
                // send inactive username found email.
                response.addErrorCode("inactiveUser");
            }
        }
        return response;
	}
	
	public EmailInfo getForgotUsernameEmailInfo() {
        return forgotUsernameEmailInfo;
    }

	@Override
	public GenericResponse sendForgotPasswordNotification(String userName,
			String resetPasswordUrl) {
		GenericResponse response = new GenericResponse();
        ServiceProvider serviceProvider = null;

        if (userName != null) {
        	serviceProvider = serviceProviderDao.readServiceProviderByUserName(userName);
        }

        checkCustomer(serviceProvider,response);

        if (! response.getHasErrors()) {        
            String token = PasswordUtils.generateTemporaryPassword(getPasswordTokenLength());
            token = token.toLowerCase();

            CustomerForgotPasswordSecurityToken fpst = new CustomerForgotPasswordSecurityTokenImpl();
            fpst.setCustomerId(serviceProvider.getId());
            fpst.setToken(passwordEncoder.encodePassword(token, null));
            fpst.setCreateDate(SystemTime.asDate());
            customerForgotPasswordSecurityTokenDao.saveToken(fpst);

            HashMap<String, Object> vars = new HashMap<String, Object>();
            vars.put("token", token);
            if (!StringUtils.isEmpty(resetPasswordUrl)) {
                if (resetPasswordUrl.contains("?")) {
                    resetPasswordUrl=resetPasswordUrl+"&token="+token;
                } else {
                    resetPasswordUrl=resetPasswordUrl+"?token="+token;
                }
            }
            vars.put("resetPasswordUrl", resetPasswordUrl); 
            emailService.sendTemplateEmail(serviceProvider.getEmailAddress(), getForgotPasswordEmailInfo(), vars);
        }
        return response;
	}
	
	public EmailInfo getForgotPasswordEmailInfo() {
        return forgotPasswordEmailInfo;
    }
	
	public int getPasswordTokenLength() {
        return passwordTokenLength;
    }

	@Override
	public GenericResponse resetPasswordUsingToken(String username,
			String token, String password, String confirmPassword) {
		GenericResponse response = new GenericResponse();
        ServiceProvider serviceProvider = null;
        if (username != null) {
        	serviceProvider = serviceProviderDao.readServiceProviderByUserName(username);
        }
        checkCustomer(serviceProvider, response);
        checkPassword(password, confirmPassword, response);
        CustomerForgotPasswordSecurityToken fpst = checkPasswordResetToken(token, response);
        
        if (! response.getHasErrors()) {
            if (! serviceProvider.getId().equals(fpst.getCustomerId())) {
                if (LOG.isWarnEnabled()) {
                    LOG.warn("Password reset attempt tried with mismatched customer and token " + serviceProvider.getId() + ", " + token);
                }
                response.addErrorCode("invalidToken");
            }
        }

        if (! response.getHasErrors()) {
        	serviceProvider.setUnencodedPassword(password);
            saveServiceProvider(serviceProvider);
            fpst.setTokenUsedFlag(true);
            customerForgotPasswordSecurityTokenDao.saveToken(fpst);
        }

        return response;        
	}
	
	protected void checkCustomer(ServiceProvider serviceProvider, GenericResponse response) {       
        if (serviceProvider == null) {         
            response.addErrorCode("invalidCustomer");
        } else if (serviceProvider.getEmailAddress() == null || "".equals(serviceProvider.getEmailAddress())) {
            response.addErrorCode("emailNotFound");
        } else if (serviceProvider.isDeactivated()) {
            response.addErrorCode("inactiveUser");
        }
    }
    
    protected void checkPassword(String password, String confirmPassword, GenericResponse response) {
        if (password == null || confirmPassword == null || "".equals(password) || "".equals(confirmPassword)) {
            response.addErrorCode("invalidPassword");
        } else if (! password.equals(confirmPassword)) {
            response.addErrorCode("passwordMismatch");
        }
    }

	@Override
	public GenericResponse checkPasswordResetToken(String token) {
		GenericResponse response = new GenericResponse();
        checkPasswordResetToken(token, response);               
        return response;
	}
	
	private CustomerForgotPasswordSecurityToken checkPasswordResetToken(String token, GenericResponse response) {
        if (token == null || "".equals(token)) {
            response.addErrorCode("invalidToken");
        }
        
        CustomerForgotPasswordSecurityToken fpst = null;
        if (! response.getHasErrors()) {
            token = token.toLowerCase();
            fpst = customerForgotPasswordSecurityTokenDao.readToken(passwordEncoder.encodePassword(token, null));
            if (fpst == null) {
                response.addErrorCode("invalidToken");
            } else if (fpst.isTokenUsedFlag()) {
                response.addErrorCode("tokenUsed");
            } else if (isTokenExpired(fpst)) {
                response.addErrorCode("tokenExpired");
            }
        }       
        return fpst;
    }
	
	protected boolean isTokenExpired(CustomerForgotPasswordSecurityToken fpst) {
        Date now = SystemTime.asDate();
        long currentTimeInMillis = now.getTime();
        long tokenSaveTimeInMillis = fpst.getCreateDate().getTime();
        long minutesSinceSave = (currentTimeInMillis - tokenSaveTimeInMillis)/60000;
        return minutesSinceSave > tokenExpiredMinutes;
    }

	@Override
	public Long findNextServiceProviderId() {
		return idGenerationService.findNextId("com.enclothe.core.serviceprovider.domain.ServiceProvider");
	}
	
	/**
     * Optionally provide a salt based on a customer.  By default, this returns
     * the salt property
     * 
     * @param customer
     * @return
     * @see {@link CustomerServiceImpl#getSalt()}
     */
    public String getSalt(ServiceProvider serviceProvider) {
        return getSalt();
    }
    
    public String getSalt() {
        return salt;
    }
    
    public void setSalt(String salt) {
        this.salt = salt;
    }
	
}
