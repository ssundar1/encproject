package com.enclothe.core.dispute.service;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.broadleafcommerce.profile.core.service.IdGenerationService;

import com.enclothe.core.dispute.dao.DisputePriorityDao;
import com.enclothe.core.dispute.domain.DisputePriority;
import com.enclothe.core.serviceprovider.domain.ServiceProvider;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

@Service("blDisputePriorityService")
public class DisputePriorityServiceImpl implements DisputePriorityService {
	
private static final Log LOG = LogFactory.getLog(DisputePriorityServiceImpl.class);
    
    @Resource(name="blDisputePriorityDao")
    protected DisputePriorityDao disputePriorityDao;
    
    @Resource(name="blIdGenerationService")
    protected IdGenerationService idGenerationService;

    @Override
	public DisputePriority createDisputePriority() {
		return createDisputePriorityFromId(null);
	}

	@Override
	public DisputePriority createDisputePriorityFromId(Long disputePriorityId) {
		DisputePriority disputePriority = disputePriorityId != null ? readDisputePriorityById(disputePriorityId) : null;
        if (disputePriority == null) {
        	disputePriority = disputePriorityDao.create(disputePriority);
            if (disputePriorityId != null) {
            	disputePriority.setId(disputePriorityId);
            } else {
            	disputePriority.setId(findNextDisputePriorityId());
            }
        }
        return disputePriority;
	}

	@Override
	public DisputePriority createNewDisputePriority() {
		return createDisputePriorityFromId(null);
	}
	
	@Override
	public Long findNextDisputePriorityId() {
		return idGenerationService.findNextId("com.enclothe.core.dispute.domain.DisputePriority");
	}

	@Override
	public DisputePriority readDisputePriorityById(Long disputePriorityId) {
		return disputePriorityDao.readDisputePriorityById(disputePriorityId);
	}
	
	@Override
	public DisputePriority saveDisputePriority(DisputePriority disputePriority) {
		return disputePriorityDao.save(disputePriority);
	}
    	
}
