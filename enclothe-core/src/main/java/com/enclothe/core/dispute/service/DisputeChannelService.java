package com.enclothe.core.dispute.service;

import com.enclothe.core.dispute.domain.DisputeChannel;

public interface DisputeChannelService {

	DisputeChannel createDisputeChannel();

	DisputeChannel createDisputeChannelFromId(Long disputeChannelId);

	DisputeChannel createNewDisputeChannel();

	DisputeChannel readDisputeChannelById(Long disputeChannelId);

	Long findNextDisputeChannelId();

	DisputeChannel saveDisputeChannel(DisputeChannel disputeChannel);

}
