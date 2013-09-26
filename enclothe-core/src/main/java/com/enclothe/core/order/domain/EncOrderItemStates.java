package com.enclothe.core.order.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

public interface EncOrderItemStates extends  Serializable  {

	public Long getOrderStateName(); 
	public void setOrderStateName(Long orderItemStateName);
	public String getOrderItemStateshortDesc(); 
	public void setOrderItemStateshortDesc(String orderItemStateShortDesc) ;
	public String getOrderItemStateLongDesc(); 
	public void setOrderStateItemLongDesc(String orderStateItemLongDesc) ;
public Long getId() ;
public void setId(Long id) ;
public Date getEndDate();
public void setEndDate(Date endDate);
	

}
