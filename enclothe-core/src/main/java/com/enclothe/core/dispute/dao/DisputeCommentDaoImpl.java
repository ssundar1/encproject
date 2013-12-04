package com.enclothe.core.dispute.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.hibernate.ejb.QueryHints;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;

import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.dispute.domain.DisputeComment;
import com.enclothe.core.dispute.domain.DisputeImpl;
import com.enclothe.core.dispute.domain.DisputeState;

@Repository("blDisputeCommentDao")
public class DisputeCommentDaoImpl implements DisputeCommentDao {

	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;	
	
	@Override
    public DisputeComment save(DisputeComment disputeComment) {
        return em.merge(disputeComment);
    }

    @Override
    public DisputeComment create() {
    	return (DisputeComment) entityConfiguration.createEntityInstance("com.enclothe.core.dispute.domain.DisputeComment");
    }

	@Override
	public DisputeComment readDisputeCommentById(Long Id) {
		return (DisputeComment) em.find(DisputeCommentDaoImpl.class, Id);
	}
	
	@Override
	public List<DisputeComment> readDisputeCommentsByChannelId(Long channelId) {
		Query query = em.createNamedQuery("BC_READ_DISPUTECOMMENTS_BY_CHANNEL_ID");
        query.setParameter("channelId", channelId);
        query.setHint(QueryHints.HINT_CACHEABLE, true);

        List<DisputeComment> resultList = query.getResultList();
		return resultList;
	}

	@Override
	public List<DisputeComment> readDisputeCommentsByDisputeId(Long disputeId) {
		Query query = em.createNamedQuery("BC_READ_DISPUTECOMMENTS_BY_DISPUTE_ID");
        query.setParameter("channelId", disputeId);
        query.setHint(QueryHints.HINT_CACHEABLE, true);

        List<DisputeComment> resultList = query.getResultList();
		return resultList;
	}
	
	
}
