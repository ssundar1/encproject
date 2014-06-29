package com.enclothe.core.payment.service;

import java.util.List;

import com.enclothe.core.dispute.domain.DisputeChannel;
import com.enclothe.core.payment.domain.Payment;

public interface PaymentService {

	Payment createPayment();

	Payment savePayment(Payment payment);

	void deletePayment(Payment payment);

	Payment readPaymentById(Long paymentId);

	List<Payment> getSucessfulTransactions();

	List<Payment> getFailedTransactions();

}
