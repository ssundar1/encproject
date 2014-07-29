package com.enclothe.core.dm.order.domain;

import java.util.Date;

import org.broadleafcommerce.profile.core.domain.Customer;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncMaterial;

public interface EncOrderItemDTO {

	public Long getId();

	public void setId(Long id);

	public EncMaterial getMaterial();

	public void setMaterial(EncMaterial material);

	public Measurement getMeasurement();

	public void setMeasurement(Measurement measurement);

	public EncDesign getDesign();

	public void setDesign(EncDesign design);

	public String getSessionId();

	public void setSessionId(String sessionId);

	public String getIpAddress();

	public void setIpAddress(String ipAddress);

	Date getEndDate();

	void setCreationDate(Date creationDate);

	Date getCreationDate();

	void setEndDate(Date endDate);

	Long getCustomerId();

	void setCustomerId(Long customerId);
	
	
}
