package com.enclothe.web.form;

import java.io.Serializable;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.measurement.domain.MeasurementImpl;

public class CustomerMeasurementForm implements Serializable {

    private static final long serialVersionUID = 1L;

    protected Measurement measurement = new MeasurementImpl();
    protected Long customerMeasurementId;

    public CustomerMeasurementForm() {
        
    }
    public Measurement getMeasurement() {
        return measurement;
    }
    public void setMeasurement(Measurement measurement) {
        this.measurement = measurement;
    }
 
    public Long getCustomerMeasurementId() {
        return customerMeasurementId;
    }
    public void setCustomerMeasurementId(Long customerMeasurementId) {
        this.customerMeasurementId = customerMeasurementId;
    }
}
