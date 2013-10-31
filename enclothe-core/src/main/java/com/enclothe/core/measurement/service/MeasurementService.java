package com.enclothe.core.measurement.service;

import com.enclothe.core.measurement.domain.*;

public interface MeasurementService {

	Measurement createMeasurement();

	Measurement createMeasurementFromId(Long measurementId);

	Measurement createNewMeasurement();

	Measurement readMeasurementById(Long measurementId);

	Long findNextMeasurementId();

	Measurement saveMeasurement(Measurement measurement);

}
