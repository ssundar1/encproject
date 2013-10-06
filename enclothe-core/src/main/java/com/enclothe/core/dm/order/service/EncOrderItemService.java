package com.enclothe.core.dm.order.service;

import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.service.OrderItemService;

public interface EncOrderItemService extends OrderItemService {

	
	 public DiscreteOrderItem createDiscreteOrderItem(final EncOrderItemRequest itemRequest);
}
