package com.enclothe.core.dispute.dao;

import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.dispute.domain.DisputeComment;
import com.enclothe.core.dispute.domain.DisputeState;

import java.util.List;

public interface DisputeCommentDao {
	DisputeComment	readDisputeCommentById(Long disputeCommentId);
	
	List<DisputeComment> readDisputeCommentsByDisputeId(Long disputeId);	

	DisputeComment save(DisputeComment disputeComment);

	DisputeComment create();

	List<DisputeComment> readDisputeCommentsByChannelId(Long channelId);
}
