package com.enclothe.core.dispute.dao;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.broadleafcommerce.cms.structure.domain.StructuredContentImpl;
import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;

import com.enclothe.core.dispute.domain.DisputeState;
import com.enclothe.core.dispute.domain.DisputeStateImpl;

@Repository("blDisputeStateDao")
public class DisputeStateDaoImpl implements DisputeStateDao {

	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
	@Override
	public DisputeState	readDisputeStateById(Long DisputeStateId) {
		//return em.find(DisputeStateImpl.class, DisputeStateId);
		
		DisputeState disputeState = null;
		// Set up the criteria query that specifies we want to return DisputeState
        CriteriaBuilder builder = em.getCriteriaBuilder();
        
        CriteriaQuery<DisputeState> criteria = builder.createQuery(DisputeState.class);
        Root<DisputeStateImpl> disputeStateRoot = criteria.from(DisputeStateImpl.class);
        criteria.select(disputeStateRoot);
        Predicate endDatePredicate = builder.isNull(disputeStateRoot.<Date>get("endDate"));
        Predicate stateIdPredicate = builder.equal(disputeStateRoot.<Long>get("id"), DisputeStateId);
        
        criteria.where(builder.and(endDatePredicate, stateIdPredicate));
        
        TypedQuery<DisputeState> query = em.createQuery(criteria);
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
