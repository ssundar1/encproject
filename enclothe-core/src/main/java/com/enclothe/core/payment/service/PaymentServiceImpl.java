package com.enclothe.core.payment.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.broadleafcommerce.profile.core.service.IdGenerationService;

import com.enclothe.core.dispute.dao.DisputeChannelDao;
import com.enclothe.core.dispute.domain.DisputeChannel;
import com.enclothe.core.payment.dao.PaymentDao;
import com.enclothe.core.payment.domain.Payment;

import javax.annotation.Resource;

@Service("blPaymentService")
public class PaymentServiceImpl implements PaymentService {
	
private static final Log LOG = LogFactory.getLog(PaymentServiceImpl.class);
    
    @Resource(name="blPaymentDao")
    protected PaymentDao paymentDao;

	@Override
	public Payment createPayment() {
		return paymentDao.create();
	}

	@Override
	public Payment savePayment(Payment payment) {
		return paymentDao.save(payment);
	}

	@Override
	public void deletePayment(Payment payment) {
		paymentDao.delete(payment);
	}

	@Override
	public Payment readPaymentById(Long paymentId) {
		return paymentDao.readPaymentById(paymentId);
	}

	@Override
	public List<Payment> getSucessfulTransactions() {
		return paymentDao.getSucessfulTransactions();
	}

	@Override
	public List<Payment> getFailedTransactions() {
		return paymentDao.getSucessfulTransactions();
	}


    	
}
