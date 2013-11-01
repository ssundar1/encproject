package com.enclothe.core.measurement.dao;


import  com.enclothe.core.measurement.domain.Measurement;

public interface MeasurementDao {

	Measurement save(Measurement measurement);

	void delete(Measurement measurement);

	Measurement create(Measurement measurement);

	Measurement readMeasurementById(Long measurementId);
	

}
