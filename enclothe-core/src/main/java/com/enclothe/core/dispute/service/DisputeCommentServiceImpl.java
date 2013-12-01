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

import com.enclothe.core.dispute.dao.DisputeCommentDao;
import com.enclothe.core.dispute.dao.DisputeDao;
import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.dispute.domain.DisputeComment;
import com.enclothe.core.dispute.domain.DisputeState;
import com.enclothe.core.serviceprovider.domain.ServiceProvider;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

@Service("blDisputeCommentService")
public class DisputeCommentServiceImpl implements DisputeCommentService {
	
private static final Log LOG = LogFactory.getLog(DisputeCommentServiceImpl.class);
    
    @Resource(name="blDisputeCommentDao")
    protected DisputeCommentDao disputeCommentDao;
    
    @Resource(name="blIdGenerationService")
    protected IdGenerationService idGenerationService;

    @Override
	public DisputeComment readDisputeCommentById(Long disputeCommentId) {
		return disputeCommentDao.readDisputeCommentById(disputeCommentId);
	}
	
	@Override
	public DisputeComment saveDisputeComment(DisputeComment disputeComment) {
		return disputeCommentDao.save(disputeComment);
	}

	@Override
	public List<DisputeComment> readDisputeCommentsByChannelId(Long channelId) {
		return disputeCommentDao.readDisputeCommentsByChannelId(channelId);
	}

	@Override
	public List<DisputeComment> readDisputeCommentsByDisputeId(Long disputeId) {
		return disputeCommentDao.readDisputeCommentsByDisputeId(disputeId);
	}
}
