package com.enclothe.core.dispute.service;

import java.util.List;

import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.dispute.domain.DisputeState;

public interface DisputeService {

	Dispute createDispute();

	Dispute createDisputeFromId(Long disputeId);

	Dispute createNewDispute();

	Dispute readDisputeById(Long disputeId);

	Long findNextDisputeId();

	Dispute saveDispute(Dispute dispute);
	
	void DeleteDispute(Dispute dispute);
	
	void deleteDisputeById(Long disputeId);
	
	List<Dispute> readDisputesByChannelId(Long channelId);

	List<Dispute> readDisputesByPriorityId(Long priorityId);
	
	List<Dispute> readDisputesByStateId(Long stateId);
	
	List<Dispute> readDisputesByState(DisputeState disputeState);
}
