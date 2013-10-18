package com.enclothe.core.dispute.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.broadleafcommerce.profile.core.service.IdGenerationService;

import com.enclothe.core.dispute.dao.DisputeChannelDao;
import com.enclothe.core.dispute.domain.DisputeChannel;

import javax.annotation.Resource;

@Service("blDisputeChannelService")
public class DisputeChannelServiceImpl implements DisputeChannelService {
	
private static final Log LOG = LogFactory.getLog(DisputeChannelServiceImpl.class);
    
    @Resource(name="blDisputeChannelDao")
    protected DisputeChannelDao disputeChannelDao;
    
    @Resource(name="blIdGenerationService")
    protected IdGenerationService idGenerationService;

    @Override
	public DisputeChannel createDisputeChannel() {
		return createDisputeChannelFromId(null);
	}

	@Override
	public DisputeChannel createDisputeChannelFromId(Long disputeChannelId) {
		DisputeChannel disputeChannel = disputeChannelId != null ? readDisputeChannelById(disputeChannelId) : null;
        if (disputeChannel == null) {
        	disputeChannel = disputeChannelDao.create(disputeChannel);
            if (disputeChannelId != null) {
            	disputeChannel.setId(disputeChannelId);
            } else {
            	disputeChannel.setId(findNextDisputeChannelId());
            }
        }
        return disputeChannel;
	}

	@Override
	public DisputeChannel createNewDisputeChannel() {
		return createDisputeChannelFromId(null);
	}
	
	@Override
	public Long findNextDisputeChannelId() {
		return idGenerationService.findNextId("com.enclothe.core.dispute.domain.DisputeChannel");
	}

	@Override
	public DisputeChannel readDisputeChannelById(Long disputeChannelId) {
		return disputeChannelDao.readDisputeChannelById(disputeChannelId);
	}
	
	@Override
	public DisputeChannel saveDisputeChannel(DisputeChannel disputeChannel) {
		return disputeChannelDao.save(disputeChannel);
	}
    	
}
