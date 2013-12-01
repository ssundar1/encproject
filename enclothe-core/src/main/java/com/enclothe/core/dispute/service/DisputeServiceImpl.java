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

import com.enclothe.core.dispute.dao.DisputeDao;
import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.dispute.domain.DisputeState;
import com.enclothe.core.serviceprovider.domain.ServiceProvider;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

@Service("blDisputeService")
public class DisputeServiceImpl implements DisputeService {
	
private static final Log LOG = LogFactory.getLog(DisputeServiceImpl.class);
    
    @Resource(name="blDisputeDao")
    protected DisputeDao disputeDao;
    
    @Resource(name="blIdGenerationService")
    protected IdGenerationService idGenerationService;

    @Override
	public Dispute createDispute() {
		return createDisputeFromId(null);
	}

	@Override
	public Dispute createDisputeFromId(Long disputeId) {
		Dispute dispute = disputeId != null ? readDisputeById(disputeId) : null;
        if (dispute == null) {
        	dispute = disputeDao.create();
            if (disputeId != null) {
            	dispute.setId(disputeId);
            } else {
            	dispute.setId(findNextDisputeId());
            }
        }
        return dispute;
	}

	@Override
	public Dispute createNewDispute() {
		return createDisputeFromId(null);
	}
	
	@Override
	public Long findNextDisputeId() {
		return idGenerationService.findNextId("com.enclothe.core.dispute.domain.Dispute");
	}

	@Override
	public Dispute readDisputeById(Long disputeId) {
		return disputeDao.readDisputeById(disputeId);
	}
	
	@Override
	public Dispute saveDispute(Dispute dispute) {
		return disputeDao.save(dispute);
	}

	@Override
	public void DeleteDispute(Dispute dispute) {
		disputeDao.delete(dispute);
		
	}

	@Override
	public void deleteDisputeById(Long disputeId) {
		//disputeDao.deleteById(disputeId);
	}

	@Override
	public List<Dispute> readDisputesByChannelId(Long channelId) {
		return disputeDao.readDisputesByChannelId(channelId);
	}

	@Override
	public List<Dispute> readDisputesByPriorityId(Long priorityId) {
		return disputeDao.readDisputesByPriorityId(priorityId);
	}

	@Override
	public List<Dispute> readDisputesByStateId(Long stateId) {
		return disputeDao.readDisputesByStateId(stateId);
	}

	@Override
	public List<Dispute> readDisputesByState(DisputeState disputeState) {
		return disputeDao.readDisputesByState(disputeState);
	}
    	
}
