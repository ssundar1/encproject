package com.enclothe.web.form;

import org.broadleafcommerce.profile.web.core.form.RegisterCustomerForm;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.measurement.domain.MeasurementImpl;

public class EncRegisterCustomerForm extends RegisterCustomerForm  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8622915807107388803L;
	protected Measurement measurement = new MeasurementImpl();
	
	public Measurement getMeasurement()
	{
		return this.measurement;
	}
	
	public void setMeasurement(Measurement m)
	{
		this.measurement = m;
	}
	
}
