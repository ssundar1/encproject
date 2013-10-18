package com.enclothe.core.dispute.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;

import com.enclothe.core.dispute.domain.DisputeChannel;

@Repository("blDisputeChannelDao")
public class DisputeChannelDaoImpl implements DisputeChannelDao {

	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
	@Override
	public DisputeChannel readDisputeChannelById(Long DisputeChannelId) {
		DisputeChannel disputeChannel = null;
		final Query query = em.createNamedQuery("BC_READ_DISPUTECHANNEL_BY_ID",DisputeChannel.class);
        query.setParameter("id", DisputeChannelId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	disputeChannel = (DisputeChannel) temp.get(0);
        }
        return disputeChannel;
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
    public DisputeChannel save(DisputeChannel disputeChannel) {
        return em.merge(disputeChannel);
    }
	
	@Override
	public void delete(DisputeChannel disputeChannel){
		disputeChannel.setEndDate(DateTime.now().toDate());
		em.merge(disputeChannel);
	}

    @Override
    public DisputeChannel create(DisputeChannel disputeChannel) {
    	System.out.println("entiteyconf"+entityConfiguration);
    	
    	return (DisputeChannel) entityConfiguration.createEntityInstance("com.enclothe.core.dispute.domain.DisputeChannel");
    }
}
