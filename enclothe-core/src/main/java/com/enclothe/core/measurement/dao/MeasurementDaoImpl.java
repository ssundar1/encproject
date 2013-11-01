package com.enclothe.core.measurement.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.dm.order.domain.EncOrderItemStates;

@Repository("encMeasurementDao")
public class MeasurementDaoImpl implements MeasurementDao {

	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
	@Override
	public Measurement readMeasurementById(Long measurementId) {
		Measurement measurement = null;
		final Query query = em.createNamedQuery("BC_READ_MEASUREMENT_BY_ID",Measurement.class);
        query.setParameter("measurementId", measurementId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	measurement = (Measurement) temp.get(0);
        }
        return measurement;
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
    public Measurement save(Measurement measurement) {
        return em.merge(measurement);
    }
	
	@Override
	public void delete(Measurement measurement){
		measurement.setEndDate(DateTime.now().toDate());
		em.merge(measurement);
	}

    @Override
    public Measurement create(Measurement measurement) {
    	System.out.println("entiteyconf"+entityConfiguration);
    	
    	return (Measurement) entityConfiguration.createEntityInstance("com.enclothe.core.measurement.domain.Measurement");
    }
}
