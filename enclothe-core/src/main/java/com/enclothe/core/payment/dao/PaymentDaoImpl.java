package com.enclothe.core.payment.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.springframework.stereotype.Repository;

import com.enclothe.core.payment.domain.Payment;
import com.enclothe.core.payment.domain.PaymentImpl;

@Repository("blPaymentDao")
public class PaymentDaoImpl implements PaymentDao {

	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
		
	
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
	public Payment readPaymentById(Long paymentId) {
		return em. find(PaymentImpl.class, paymentId);
	}

	@Override
    public Payment save(Payment payment) {
        return em.merge(payment);
    }
	
	@Override
	public void delete(Payment payment){
		/*payment.setEndDate(DateTime.now().toDate());
		em.merge(payment);*/
	}

    @Override
    public Payment create() {
    	System.out.println("entiteyconf"+entityConfiguration);
    	
    	return (Payment) entityConfiguration.createEntityInstance("com.enclothe.core.payment.domain.Payment");
    }
    
    @Override
    public List<Payment> getSucessfulTransactions() {
    	List<Payment> resultList = em.createQuery("SELECT p FROM Payment p WHERE p.ResponseCode = :ResponseCode",Payment.class)
    			.setParameter("ResponseCode", 0)
    			.getResultList();
		return resultList;
    }
    
    @Override
    public List<Payment> getFailedTransactions() {
    	List<Payment> resultList = em.createQuery("SELECT p FROM Payment p WHERE p.ResponseCode != :ResponseCode",Payment.class)
    			.setParameter("ResponseCode", 0)
    			.getResultList();
		return resultList;
    }
}
