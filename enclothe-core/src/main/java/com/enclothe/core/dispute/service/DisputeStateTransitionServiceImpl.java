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
import com.enclothe.core.dispute.dao.DisputeStateTransitionDao;
import com.enclothe.core.dispute.domain.DisputeState;
import com.enclothe.core.dispute.domain.DisputeStateTransition;
import com.enclothe.core.serviceprovider.domain.ServiceProvider;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

@Service("blDisputeStateTransitionService")
public class DisputeStateTransitionServiceImpl implements DisputeStateTransitionService {
	
private static final Log LOG = LogFactory.getLog(DisputeStateTransitionServiceImpl.class);
    
    @Resource(name="blDisputeStateTransitionDao")
    protected DisputeStateTransitionDao disputeStateTransitionDao;
    
    @Resource(name="blIdGenerationService")
    protected IdGenerationService idGenerationService;

    @Override
	public DisputeStateTransition createDisputeStateTransition() {
		return createDisputeStateTransitionFromId(null);
	}

	@Override
	public DisputeStateTransition createDisputeStateTransitionFromId(Long disputeStateTransitionId) {
		DisputeStateTransition disputeStateTransition = disputeStateTransitionId != null ? readDisputeStateTransitionById(disputeStateTransitionId) : null;
        if (disputeStateTransition == null) {
        	disputeStateTransition = disputeStateTransitionDao.create();
            if (disputeStateTransitionId != null) {
            	disputeStateTransition.setId(disputeStateTransitionId);
            } else {
            	disputeStateTransition.setId(findNextDisputeStateTransitionId());
            }
        }
        return disputeStateTransition;
	}

	@Override
	public DisputeStateTransition createNewDisputeStateTransition() {
		return createDisputeStateTransitionFromId(null);
	}
	
	@Override
	public Long findNextDisputeStateTransitionId() {
		return idGenerationService.findNextId("com.enclothe.core.dispute.domain.DisputeStateTransition");
	}

	@Override
	public DisputeStateTransition readDisputeStateTransitionById(Long disputeStateTransitionId) {
		return disputeStateTransitionDao.readDisputeStateTransitionById(disputeStateTransitionId);
	}
	
	@Override
	public DisputeStateTransition saveDisputeStateTransition(DisputeStateTransition disputeStateTransition) {
		return disputeStateTransitionDao.save(disputeStateTransition);
	}
    	
}
