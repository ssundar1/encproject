package com.enclothe.core.dispute.dao;

import com.enclothe.core.dispute.domain.DisputeStateTransition;

public interface DisputeStateTransitionDao {
	public DisputeStateTransition readDisputeStateTransitionById(Long DisputeStateId);

	DisputeStateTransition save(DisputeStateTransition disputeState);

	DisputeStateTransition create();
}
