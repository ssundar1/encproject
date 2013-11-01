package com.enclothe.core.dm.order.dao;

import org.broadleafcommerce.core.order.dao.OrderItemDao;
import org.broadleafcommerce.core.order.domain.OrderItem;

import com.enclothe.core.common.domain.UserCategory;
import com.enclothe.core.dm.order.domain.EncOrderItemStateDetail;
import com.enclothe.core.dm.order.domain.EncOrderItemStates;
import com.enclothe.core.measurement.domain.Measurement;

public interface EncOrderItemDao  extends OrderItemDao{
	public OrderItem create();
	public EncOrderItemStates save(EncOrderItemStates orderItemStates);

	public void delete(EncOrderItemStates orderItemStates);

	public EncOrderItemStates create(EncOrderItemStates orderItemStates);

	public EncOrderItemStateDetail create(EncOrderItemStateDetail orderItemStateDetail);	
	public EncOrderItemStates defaultOrderItemState(Long orderItemStateId);
	
	public EncOrderItemStates readOrderItemStatesById(Long orderItemStatesId);
	public EncOrderItemStateDetail readOrderItemStateDetailById(
			Long orderItemStateDetailId);
	public EncOrderItemStateDetail save(EncOrderItemStateDetail orderItemStateDetail);
	public UserCategory readUserCategoryById(Long userCategoryId);

}
