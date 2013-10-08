package com.enclothe.core.dm.order.domain;



import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.domain.OrderItem;





import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncMaterial;



public interface EncOrderItem extends DiscreteOrderItem{

	EncOrderItemStates getOrderItemState();

	void setOrderItemState(EncOrderItemStates orderItemState);

	EncOrderItemStateDetail getOrderItemStateDetail();

	void setOrderItemStateDetail(EncOrderItemStateDetail orderItemStateDetail);

	Measurement getMeasurement();

	void setMeasurement(Measurement measurement);

		public EncDesign getDesign() ;
		public void setDesign(EncDesign design);
		
		public Sku getDesignSku();
		public void setDesignSku(Sku designSku);
}
