package com.enclothe.core.dispute.dao;

import com.enclothe.core.dispute.domain.DisputeState;

public interface DisputeStateDao {
	public DisputeState	readDisputeStateById(Long DisputeStateId);

	DisputeState save(DisputeState disputeState);

	void delete(DisputeState disputeState);

	DisputeState create();
}
