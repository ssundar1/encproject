package com.enclothe.core.dispute.dao;

import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.dispute.domain.DisputeState;

import java.util.List;

public interface DisputeDao {
	Dispute	readDisputeById(Long disputeId);
	
	Dispute	readDisputeByOrderItemId(Long orderItemId);
	
	List<Dispute> readDisputesByStateId(Long stateId);
	
	List<Dispute> readDisputesByState(DisputeState disputeState);

	Dispute save(Dispute dispute);

	void delete(Dispute dispute);

	Dispute create();

	List<Dispute> readDisputesByChannelId(Long channelId);

	List<Dispute> readDisputesByPriorityId(Long priorityId);
}
