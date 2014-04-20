package com.enclothe.core.dm.order.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.broadleafcommerce.core.order.dao.OrderItemDaoImpl;
import org.broadleafcommerce.core.order.domain.OrderItem;
import org.broadleafcommerce.core.order.service.type.OrderItemType;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;

import com.enclothe.core.common.domain.UserCategory;
import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.dm.order.domain.EncOrderItem;
import com.enclothe.core.dm.order.domain.EncOrderItemStateDetail;
import com.enclothe.core.dm.order.domain.EncOrderItemStates;
import com.enclothe.core.measurement.domain.Measurement;

@Repository("encOrderItemDao")
public class EncOrderItemDaoImpl extends OrderItemDaoImpl implements EncOrderItemDao{
	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
	public OrderItem create() {
		final EncOrderItem orderItem = ((EncOrderItem) entityConfiguration.createEntityInstance(" com.enclothe.core.dm.order.domain.EncOrderItem"));
        return orderItem;
	}
	
	public OrderItem create(final OrderItemType orderItemType) {		
        return super.create(orderItemType);
	}
	
	public EncOrderItemStates defaultOrderItemState(Long orderItemStateId) {
		EncOrderItemStates orderItemState = null;
		final Query query = em.createNamedQuery("BC_DEFAULT_ORDERITEM_ID",EncOrderItemStates.class);
        query.setParameter("orderItemStateId", orderItemStateId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	orderItemState = (EncOrderItemStates) temp.get(0);
        }
        return orderItemState;
	}
	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}

	public EntityConfiguration getEntityConfiguration() {
		return entityConfiguration;
	}

	public void setEntityConfiguration(EntityConfiguration entityConfiguration) {
		this.entityConfiguration = entityConfiguration;
	}

	@Override
    public EncOrderItemStates save(EncOrderItemStates orderItemState) {
        return em.merge(orderItemState);
    }
	@Override
    public EncOrderItemStateDetail save(EncOrderItemStateDetail orderItemStateDetail) {
        return em.merge(orderItemStateDetail);
    }
	@Override
	public void delete(EncOrderItemStates orderItemState){
		orderItemState.setEndDate(DateTime.now().toDate());
		em.merge(orderItemState);
	}

    @Override
    public EncOrderItemStates create(EncOrderItemStates orderItemState) {
    	System.out.println("entiteyconf"+entityConfiguration);
    	
    	return (EncOrderItemStates) entityConfiguration.createEntityInstance("com.enclothe.core.dm.order.domain.EncOrderItemStates");
    }
    @Override
    public EncOrderItemStateDetail create(EncOrderItemStateDetail orderItemStateDetail) {
    	System.out.println("entiteyconf"+entityConfiguration);
    	
    	return (EncOrderItemStateDetail) entityConfiguration.createEntityInstance("com.enclothe.core.dm.order.domain.EncOrderItemStateDetail");
    }

	@Override
	public EncOrderItemStates readOrderItemStatesById(Long orderItemStatesId) {
		EncOrderItemStates orderItemState = null;
		final Query query = em.createNamedQuery("BC_DEFAULT_ORDERITEM_ID",EncOrderItemStates.class);
        query.setParameter("orderItemStateId", orderItemStatesId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	orderItemState = (EncOrderItemStates) temp.get(0);
        }
        return orderItemState;
	}

	@Override
	public EncOrderItemStateDetail readOrderItemStateDetailById(
			Long orderItemStateDetailId) {
		EncOrderItemStateDetail OrderItemStateDetail = null;
		final Query query = em.createNamedQuery("BC_DEFAULT_ORDERITEM_STATE_DETAIL_ID",EncOrderItemStateDetail.class);
        query.setParameter("orderItemStateDetailId", orderItemStateDetailId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	OrderItemStateDetail = (EncOrderItemStateDetail) temp.get(0);
        }
        return OrderItemStateDetail;
	}
	@Override
	public UserCategory readUserCategoryById(Long userCategoryId) {
		UserCategory userCategory = null;
		final Query query = em.createNamedQuery("BC_DEFAULT_USER_CATEGORY_ID",UserCategory.class);
        query.setParameter("userCategoryId", userCategoryId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	userCategory = (UserCategory) temp.get(0);
        }
        return userCategory;
	}

	@Override
	public Dispute getDisputeIdByOrderItemId(Long encOrderItemId) {
		Dispute dispute = null;
		final Query query = em.createNamedQuery("BC_READ_ORDERITEM_DISPUTE_ID",Dispute.class);
        query.setParameter("encOrderItemId", encOrderItemId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	dispute = (Dispute) temp.get(0);
        }
        return dispute;
	}
}
