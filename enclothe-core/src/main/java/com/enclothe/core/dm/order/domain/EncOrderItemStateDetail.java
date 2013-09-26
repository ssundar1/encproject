package com.enclothe.core.dm.order.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;


import com.enclothe.core.common.domain.UserCategory;
import com.enclothe.core.measurement.domain.Measurement;

public interface EncOrderItemStateDetail extends Serializable{

	public Long getId();
	public void setId(Long id);
	public Long getCurrentOwner();
	public void setCurrentOwner(Long currentOwner);
	public Long getOwnerCategoryId();
	public void setOwnerCategoryId(Long ownerCategoryId);
	public Long getOrderItemId();
	public void setOrderItemId(Long orderItemId);
	public Long getCurrentStateId();
	public void setCurrentStateId(Long currentStateId);
	public Date getExpectedDeliverDate();
	public void setExpectedDeliverDate(Date expectedDeliverDate);
	public UserCategory getUserCategory();
	public void setUserCategory(UserCategory userCategory);
	public EncOrderItemStates getOrderItemState();
	public void setOrderItemState(EncOrderItemStates orderItemState);
	
}
