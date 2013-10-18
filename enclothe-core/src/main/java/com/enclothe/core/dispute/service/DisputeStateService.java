package com.enclothe.core.dispute.service;

import com.enclothe.core.dispute.domain.DisputeState;

public interface DisputeStateService {

	DisputeState createDisputeState();

	DisputeState createDisputeStateFromId(Long disputeStateId);

	DisputeState createNewDisputeState();

	DisputeState readDisputeStateById(Long disputeStateId);

	Long findNextDisputeStateId();

	DisputeState saveDisputeState(DisputeState disputeState);
	
	void DeleteDisputeState(DisputeState disputeState);
	

}
