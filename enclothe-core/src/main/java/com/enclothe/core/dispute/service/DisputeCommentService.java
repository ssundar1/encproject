package com.enclothe.core.dispute.service;

import java.util.List;

import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.dispute.domain.DisputeComment;
import com.enclothe.core.dispute.domain.DisputeState;

public interface DisputeCommentService {
	
	DisputeComment readDisputeCommentById(Long disputeCommentId);

	List<DisputeComment> readDisputeCommentsByDisputeId(Long disputeId);

	DisputeComment saveDisputeComment(DisputeComment disputeComment);
	
	List<DisputeComment> readDisputeCommentsByChannelId(Long channelId);
}
