package com.enclothe.core.dm.order.dao;

import org.broadleafcommerce.core.order.dao.OrderItemDaoImpl;
import org.broadleafcommerce.core.order.domain.OrderItem;
import org.broadleafcommerce.core.order.service.type.OrderItemType;
import org.springframework.stereotype.Repository;

import com.enclothe.core.dm.order.domain.EncOrderItem;

@Repository("encOrderItemDao")
public class EncOrderItemDaoImpl extends OrderItemDaoImpl implements EncOrderItemDao{

	
	public OrderItem create() {
		final EncOrderItem orderItem = ((EncOrderItem) entityConfiguration.createEntityInstance(" com.enclothe.core.dm.order.domain.EncOrderItem"));
        return orderItem;
	}
	
	public OrderItem create(final OrderItemType orderItemType) {		
        return super.create(orderItemType);
	}
}
