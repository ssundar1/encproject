package com.enclothe.core.payment.dao;

import java.util.List;

import com.enclothe.core.payment.domain.Payment;

public interface PaymentDao {
	
	Payment create();

	Payment save(Payment payment);

	void delete(Payment payment);

	Payment readPaymentById(Long paymentId);

	List<Payment> getSucessfulTransactions();

	List<Payment> getFailedTransactions();

}
