package com.enclothe.core.dispute.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;

import com.enclothe.core.dispute.domain.DisputePriority;

@Repository("blDisputePriorityDao")
public class DisputePriorityDaoImpl implements DisputePriorityDao {

	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
	@Override
	public DisputePriority readDisputePriorityById(Long DisputePriorityId) {
		DisputePriority disputePriority = null;
		final Query query = em.createNamedQuery("BC_READ_DISPUTEPRIORITY_BY_ID",DisputePriority.class);
        query.setParameter("id", DisputePriorityId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	disputePriority = (DisputePriority) temp.get(0);
        }
        return disputePriority;
	}		
	
	@Override
    public DisputePriority save(DisputePriority disputePriority) {
        return em.merge(disputePriority);
    }
	
	@Override
	public void delete(DisputePriority disputePriority){
		disputePriority.setEndDate(DateTime.now().toDate());
		em.merge(disputePriority);
	}

    @Override
    public DisputePriority create(DisputePriority disputePriority) {
    	return (DisputePriority) entityConfiguration.createEntityInstance("com.enclothe.core.dispute.domain.DisputePriority");
    }
}
