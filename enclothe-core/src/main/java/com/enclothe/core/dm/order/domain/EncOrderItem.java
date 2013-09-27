package com.enclothe.core.dm.order.domain;



import org.broadleafcommerce.core.order.domain.OrderItem;


import com.enclothe.core.measurement.domain.Measurement;



public interface EncOrderItem extends OrderItem{

	EncOrderItemStates getOrderItemState();

	void setOrderItemState(EncOrderItemStates orderItemState);

	EncOrderItemStateDetail getOrderItemStateDetail();

	void setOrderItemState(EncOrderItemStateDetail orderItemStateDetail);

	Measurement getMeasurement();

	void setMeasurement(Measurement measurement);

}
