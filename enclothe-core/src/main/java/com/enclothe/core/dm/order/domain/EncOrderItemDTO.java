package com.enclothe.core.dm.order.domain;

import java.util.Date;
import java.util.List;
import java.util.Set;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncMaterial;
import com.enclothe.core.product.domain.EncTailor;

public interface EncOrderItemDTO {

	public Long getId();

	public void setId(Long id);

	public EncMaterial getMaterial();

	public void setMaterial(EncMaterial material);

	public Measurement getMeasurement();

	public void setMeasurement(Measurement measurement);

	public List<EncDesign> getDesigns();

	public void setDesigns(List<EncDesign> designs);

	public EncTailor getTailor();

	public void setTailor(EncTailor tailor);

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
	
	int getStatus();

	void setStatus(int status);
	
	Long getMatSelectedId();

	void setMatSelectedId(Long matSelectedId);
	
	Long getFnSelectedId();

	void setFnSelectedId(Long fnSelectedId);
	
	Long getBnSelectedId();

	void setBnSelectedId(Long bnSelectedId);
	
	Long getSlSelectedId();

	void setSlSelectedId(Long slSelectedId);
	
	Long getTlSelectedId();

	void setTlSelectedId(Long tlSelectedId);

}
