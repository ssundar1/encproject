package com.enclothe.core.measurement.dao;


import java.util.List;

import  com.enclothe.core.measurement.domain.Measurement;

public interface MeasurementDao {

	Measurement save(Measurement measurement);

	void delete(Measurement measurement);

	Measurement create(Measurement measurement);

	Measurement readMeasurementById(Long measurementId);
	
	List<Measurement> readActiveCustomerMeasurementsByCustomerId(Long customerId);
}
