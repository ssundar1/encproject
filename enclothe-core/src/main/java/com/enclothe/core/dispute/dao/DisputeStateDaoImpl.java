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

@Repository("blDisputeStateDao")
public class DisputeStateDaoImpl implements DisputeStateDao {

	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
	@Override
	public DisputeState	readDisputeStateById(Long DisputeStateId) {
		DisputeState disputeState = null;
		final Query query = em.createNamedQuery("BC_READ_DISPUTESTATE_BY_ID",DisputeState.class);
        query.setParameter("id", DisputeStateId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	disputeState = (DisputeState) temp.get(0);
        }
        return disputeState;
	}		
	
	@Override
    public DisputeState save(DisputeState disputeState) {
        return em.merge(disputeState);
    }
	
	@Override
	public void delete(DisputeState disputeState){
		disputeState.setEndDate(DateTime.now().toDate());
		em.merge(disputeState);
	}

    @Override
    public DisputeState create() {
    	return (DisputeState) entityConfiguration.createEntityInstance("com.enclothe.core.dispute.domain.DisputeState");
    }
}
