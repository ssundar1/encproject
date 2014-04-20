package com.enclothe.core.dm.order.domain;



import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;

public interface EncOrderItem extends DiscreteOrderItem{

	EncOrderItemStates getOrderItemState();

	void setOrderItemState(EncOrderItemStates orderItemState);

	EncOrderItemStateDetail getOrderItemStateDetail();

	void setOrderItemStateDetail(EncOrderItemStateDetail orderItemStateDetail);

	Measurement getMeasurement();

	void setMeasurement(Measurement measurement);

	EncDesign getDesign() ;
	
	void setDesign(EncDesign design);
		
	Sku getDesignSku();
	
	void setDesignSku(Sku designSku);
		
	/*Dispute getDispute();
	
	void setDispute(Dispute dispute);*/

}
