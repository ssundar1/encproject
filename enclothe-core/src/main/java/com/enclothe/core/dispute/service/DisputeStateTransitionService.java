package com.enclothe.core.dispute.service;

import com.enclothe.core.dispute.domain.DisputeStateTransition;

public interface DisputeStateTransitionService {

	DisputeStateTransition createDisputeStateTransition();

	DisputeStateTransition createDisputeStateTransitionFromId(Long disputeStateTransitionId);

	DisputeStateTransition createNewDisputeStateTransition();

	DisputeStateTransition readDisputeStateTransitionById(Long disputeStateTransitionId);

	Long findNextDisputeStateTransitionId();

	DisputeStateTransition saveDisputeStateTransition(DisputeStateTransition disputeStateTransition);

}
