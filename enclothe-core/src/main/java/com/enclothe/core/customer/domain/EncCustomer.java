package com.enclothe.core.customer.domain;

import java.util.Map;

import org.broadleafcommerce.profile.core.domain.Customer;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncTailor;

public interface EncCustomer extends Customer{

	public Map<String, Measurement> getCustomerMeasurements();
	
	public void setCustomerMeasurements ( Map<String, Measurement> measurements);
	
	public void addMeasurement (Measurement measurement);
	
   	public Measurement getPreferredMeasurement();

	public void setPreferredMeasurement(Measurement preferredMeasurement);

	public EncTailor getPreferredTailor();

	public void setPreferredTailor(EncTailor preferredTailor);
	
}
