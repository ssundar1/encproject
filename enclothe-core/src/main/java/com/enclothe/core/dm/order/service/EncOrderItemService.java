package com.enclothe.core.dm.order.service;

import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.service.OrderItemService;

import com.enclothe.core.common.domain.UserCategory;
import com.enclothe.core.dm.order.domain.EncOrderItemStateDetail;
import com.enclothe.core.dm.order.domain.EncOrderItemStates;
import com.enclothe.core.measurement.domain.Measurement;

public interface EncOrderItemService extends OrderItemService {

	
	 public DiscreteOrderItem createDiscreteOrderItem(final EncOrderItemRequest itemRequest);

	public EncOrderItemStates defaultOrderItemState(Long long1);

	public EncOrderItemStates createOrderItemStatesFromId(Long OrderItemStatesId);

	public EncOrderItemStates readOrderItemStatesById(Long OrderItemStatesId);

	

	public EncOrderItemStateDetail createOrderItemStateDetailFromId(
			Long orderItemStateDetailId);

	public EncOrderItemStateDetail readOrderItemStateDetailById(Long OrderItemStateDetailId);

	public EncOrderItemStateDetail saveOrderItemStateDetail(
			EncOrderItemStateDetail OrderItemStateDetail);
	public EncOrderItemStates saveOrderItemState(
			EncOrderItemStates OrderItemState);

	public UserCategory readUserCategoryById(Long UserCategoryID);
}
