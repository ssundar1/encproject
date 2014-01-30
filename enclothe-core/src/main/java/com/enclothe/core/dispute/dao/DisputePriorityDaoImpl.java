package com.enclothe.core.dispute.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.broadleafcommerce.core.order.domain.OrderItemImpl;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;

import com.enclothe.core.dispute.domain.DisputePriority;
import com.enclothe.core.dispute.domain.DisputePriorityImpl;

@Repository("blDisputePriorityDao")
public class DisputePriorityDaoImpl implements DisputePriorityDao {

	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
	@Override
	public DisputePriority readDisputePriorityById(Long DisputePriorityId) {
		return em.find(DisputePriorityImpl.class, DisputePriorityId);
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
