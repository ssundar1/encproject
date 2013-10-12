package com.enclothe.core.dispute.dao;

import com.enclothe.core.dispute.domain.DisputePriority;

public interface DisputePriorityDao {

	DisputePriority readDisputeStateById(Long DisputePriorityId);

	DisputePriority save(DisputePriority disputePriority);

	void delete(DisputePriority disputePriority);

	DisputePriority create(DisputePriority disputePriority);

}
