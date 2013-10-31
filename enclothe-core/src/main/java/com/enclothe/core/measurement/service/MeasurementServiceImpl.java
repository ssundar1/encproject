package com.enclothe.core.measurement.service;

//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.broadleafcommerce.profile.core.service.IdGenerationService;

import com.enclothe.core.measurement.dao.MeasurementDao;
import com.enclothe.core.measurement.domain.Measurement;

import javax.annotation.Resource;

@Service("encMeasurementService")
public class MeasurementServiceImpl implements MeasurementService {
	
    @Resource(name="encMeasurementDao")
    protected MeasurementDao measurementDao;
    
    @Resource(name="blIdGenerationService")
    protected IdGenerationService idGenerationService;

    @Override
	public Measurement createMeasurement() {
		return createMeasurementFromId(null);
	}

	@Override
	public Measurement createMeasurementFromId(Long measurementId) {
		Measurement measurement = measurementId != null ? readMeasurementById(measurementId) : null;
        if (measurement == null) {
        	measurement = measurementDao.create(measurement);
            if (measurementId != null) {
            	measurement.setId(measurementId);
            } else {
            	measurement.setId(findNextMeasurementId());
            }
        }
        return measurement;
	}

	@Override
	public Measurement createNewMeasurement() {
		return createMeasurementFromId(null);
	}
	
	@Override
	public Long findNextMeasurementId() {
		return idGenerationService.findNextId("com.enclothe.core.measurement.domain.Measurement");
	}

	@Override
	public Measurement readMeasurementById(Long measurementId) {
		return measurementDao.readMeasurementById(measurementId);
	}
	
	@Override
	public Measurement saveMeasurement(Measurement measurement) {
		return measurementDao.save(measurement);
	}
    	
}
