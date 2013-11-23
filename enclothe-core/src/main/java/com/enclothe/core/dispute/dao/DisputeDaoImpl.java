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
import com.enclothe.core.dispute.domain.DisputeImpl;
import com.enclothe.core.dispute.domain.DisputeState;

@Repository("blDisputeDao")
public class DisputeDaoImpl implements DisputeDao {

	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
	@Override
	public Dispute readDisputeById(Long DisputeId) {
		Dispute dispute = null;
		final Query query = em.createNamedQuery("BC_READ_DISPUTE_BY_ID",Dispute.class);
        query.setParameter("id", DisputeId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	dispute = (Dispute) temp.get(0);
        }
        return dispute;
	}		
	
	@Override
    public Dispute save(Dispute dispute) {
        return em.merge(dispute);
    }
	
	@Override
	public void delete(Dispute dispute){
		dispute.setEndDate(DateTime.now().toDate());
		em.merge(dispute);
	}

    @Override
    public Dispute create() {
    	return (Dispute) entityConfiguration.createEntityInstance("com.enclothe.core.dispute.domain.Dispute");
    }

	@Override
	public Dispute readDisputeByOrderItemId(Long orderItemId) {
		return em.find(DisputeImpl.class, orderItemId);
	}
	
	@Override
	public List<Dispute> readDisputesByChannelId(Long channelId) {
		Query query = em.createNamedQuery("BC_READ_DISPUTES_BY_CHANNEL_ID");
        query.setParameter("channelId", channelId);
        query.setHint(QueryHints.HINT_CACHEABLE, true);

        List<Dispute> resultList = query.getResultList();
		return resultList;
	}
	
	@Override
	public List<Dispute> readDisputesByPriorityId(Long priorityId) {
		Query query = em.createNamedQuery("BC_READ_DISPUTES_BY_PRIORITY_ID");
        query.setParameter("priorityId", priorityId);
        query.setHint(QueryHints.HINT_CACHEABLE, true);

        List<Dispute> resultList = query.getResultList();
		return resultList;
	}

	@Override
	public List<Dispute> readDisputesByStateId(Long stateId) {
		Query query = em.createNamedQuery("BC_READ_DISPUTES_BY_STATE_ID");
        query.setParameter("stateId", stateId);
        query.setHint(QueryHints.HINT_CACHEABLE, true);

        List<Dispute> resultList = query.getResultList();
		return resultList;
	}

	@Override
	public List<Dispute> readDisputesByState(DisputeState disputeState) {
		return readDisputesByStateId(disputeState.getId());
	}
}
