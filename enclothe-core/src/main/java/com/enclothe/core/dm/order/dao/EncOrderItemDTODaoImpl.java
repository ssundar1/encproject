package com.enclothe.core.dm.order.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;

import com.enclothe.core.dm.order.domain.EncOrderItemDTO;

@Repository("encOrderItemDTODao")
public class EncOrderItemDTODaoImpl implements EncOrderItemDTODao {

	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
    @Override
    public EncOrderItemDTO readActiveOrderItemDTOByCustomerId(Long customerId) {
    	EncOrderItemDTO encOrderItemDTO = null;
  /*  	Query query = em.createNamedQuery(
        		"BC_READ_ACTIVE_CUSTOMER_ORDER_ITEM_DTO_BY_CUSTOMER_ID");
        query.setParameter("customerId", customerId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	encOrderItemDTO = (EncOrderItemDTO) temp.get(0);
        }
  */      return encOrderItemDTO;
    }
    
	@Override
	public EncOrderItemDTO readOrderItemDTOById(Long id) {
		EncOrderItemDTO encOrderItemDTO = null;
		final Query query = em.createNamedQuery("BC_READ_ENC_ORDER_ITEM_DTO_BY_ID",EncOrderItemDTO.class);
        query.setParameter("id", id);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	encOrderItemDTO = (EncOrderItemDTO) temp.get(0);
        }
        return encOrderItemDTO;
	}		

	@Override
	public EncOrderItemDTO readActiveOrderItemDTOBySessionId(String sessionId) {
		EncOrderItemDTO encOrderItemDTO = null;
		Query query = em.createNamedQuery(
        		"BC_READ_ACTIVE_CUSTOMER_ORDER_ITEM_DTO_BY_SESSION_ID");
        query.setParameter("sessionId", sessionId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	encOrderItemDTO = (EncOrderItemDTO) temp.get(0);
        }
        return encOrderItemDTO;
	}		

	@Override
	public EncOrderItemDTO readActiveOrderItemDTOByIP(String ipAddress) {
		EncOrderItemDTO encOrderItemDTO = null;
		Query query = em.createNamedQuery(
        		"BC_READ_ACTIVE_CUSTOMER_ORDER_ITEM_DTO_BY_IP");
        query.setParameter("ipAddress", ipAddress);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	encOrderItemDTO = (EncOrderItemDTO) temp.get(0);
        }
        return encOrderItemDTO;
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
    public EncOrderItemDTO save(EncOrderItemDTO encOrderItemDTO) {
        return em.merge(encOrderItemDTO);
    }
	
	@Override
	public void delete(EncOrderItemDTO encOrderItemDTO){
		encOrderItemDTO.setEndDate(DateTime.now().toDate());
		em.merge(encOrderItemDTO);
	}

    @Override
    public EncOrderItemDTO create(EncOrderItemDTO encOrderItemDTO) {
    	return (EncOrderItemDTO) entityConfiguration.createEntityInstance("com.enclothe.core.dm.order.domain.EncOrderItemDTO");
    }

}
