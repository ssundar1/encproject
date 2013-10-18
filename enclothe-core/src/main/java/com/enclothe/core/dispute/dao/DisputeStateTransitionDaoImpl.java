package com.enclothe.core.dispute.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;

import com.enclothe.core.dispute.domain.DisputeState;
import com.enclothe.core.dispute.domain.DisputeStateTransition;

@Repository("blDisputeStateTransitionDao")
public class DisputeStateTransitionDaoImpl implements DisputeStateTransitionDao {

	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
	@Override
	public DisputeStateTransition readDisputeStateTransitionById(Long DisputeStateTransitionId) {
		DisputeStateTransition disputeStateTransition = null;
		final Query query = em.createNamedQuery("BC_READ_DISPUTESTATETransition_BY_ID",DisputeStateTransition.class);
        query.setParameter("id", DisputeStateTransitionId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	disputeStateTransition = (DisputeStateTransition) temp.get(0);
        }
        return disputeStateTransition;
	}		
	
	@Override
    public DisputeStateTransition save(DisputeStateTransition disputeStateTransition) {
        return em.merge(disputeStateTransition);
    }

    @Override
    public DisputeStateTransition create() {
    	return (DisputeStateTransition) entityConfiguration.createEntityInstance("com.enclothe.core.dispute.domain.DisputeStateTransition");
    }
}
