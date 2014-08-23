package com.enclothe.core.dm.order.domain;



import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;

import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncTailor;

public interface EncOrderItem extends DiscreteOrderItem{

	EncOrderItemStates getOrderItemState();

	void setOrderItemState(EncOrderItemStates orderItemState);

	EncOrderItemStateDetail getOrderItemStateDetail();

	void setOrderItemStateDetail(EncOrderItemStateDetail orderItemStateDetail);

	Measurement getMeasurement();

	void setMeasurement(Measurement measurement);

	public List<EncDesign> getDesigns();

	public void setDesigns(List<EncDesign> designs);

	public List<Sku> getDesignSkus();

	public void setDesignSkus(List<Sku> designSkus);

	public EncTailor getTailor();

	public void setTailor(EncTailor tailor);

	public Sku getTailorSku();

	public void setTailorSku(Sku tailorSku);
		
	/*Dispute getDispute();
	
	void setDispute(Dispute dispute);*/

}
