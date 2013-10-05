package com.enclothe.core.dm.order.dao;

import org.broadleafcommerce.core.order.dao.OrderItemDao;
import org.broadleafcommerce.core.order.domain.OrderItem;

public interface EncOrderItemDao  extends OrderItemDao{
	OrderItem create();
}
