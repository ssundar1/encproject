package com.enclothe.core.dispute.dao;

import com.enclothe.core.dispute.domain.DisputeChannel;

public interface DisputeChannelDao {

	DisputeChannel save(DisputeChannel disputeChannel);

	void delete(DisputeChannel disputeChannel);

	DisputeChannel create(DisputeChannel disputeChannel);

	DisputeChannel readDisputeChannelById(Long DisputeChannelId);

}
