package com.enclothe.core.dispute.service;

import com.enclothe.core.dispute.domain.DisputePriority;

public interface DisputePriorityService {

	DisputePriority createDisputePriority();

	DisputePriority createDisputePriorityFromId(Long disputePriorityId);

	DisputePriority createNewDisputePriority();

	DisputePriority readDisputePriorityById(Long disputePriorityId);

	Long findNextDisputePriorityId();

	DisputePriority saveDisputePriority(DisputePriority disputePriority);

}
