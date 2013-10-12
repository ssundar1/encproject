package com.enclothe.core.dispute.service;

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

import com.enclothe.core.dispute.dao.DisputeStateDao;
import com.enclothe.core.dispute.domain.DisputeState;
import com.enclothe.core.serviceprovider.domain.ServiceProvider;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

@Service("blDisputeStateService")
public class DisputeStateServiceImpl implements DisputeStateService {
	
private static final Log LOG = LogFactory.getLog(DisputeStateServiceImpl.class);
    
    @Resource(name="blDisputeStateDao")
    protected DisputeStateDao disputeStateDao;
    
    @Resource(name="blIdGenerationService")
    protected IdGenerationService idGenerationService;

    @Override
	public DisputeState createDisputeState() {
		return createDisputeStateFromId(null);
	}

	@Override
	public DisputeState createDisputeStateFromId(Long disputeStateId) {
		DisputeState disputeState = disputeStateId != null ? readDisputeStateById(disputeStateId) : null;
        if (disputeState == null) {
        	disputeState = disputeStateDao.create();
            if (disputeStateId != null) {
            	disputeState.setId(disputeStateId);
            } else {
            	disputeState.setId(findNextDisputeStateId());
            }
        }
        return disputeState;
	}

	@Override
	public DisputeState createNewDisputeState() {
		return createDisputeStateFromId(null);
	}
	
	@Override
	public Long findNextDisputeStateId() {
		return idGenerationService.findNextId("com.enclothe.core.dispute.domain.DisputeState");
	}

	@Override
	public DisputeState readDisputeStateById(Long disputeStateId) {
		return disputeStateDao.readDisputeStateById(disputeStateId);
	}
	
	@Override
	public DisputeState saveDisputeState(DisputeState disputeState) {
		return disputeStateDao.save(disputeState);
	}
    	
}
