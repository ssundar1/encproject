package com.enclothe.core.dm.order.domain;

import java.io.Serializable;
import java.util.Date;

public abstract interface EncOrderItemStates extends Serializable
{
  public abstract Long getOrderStateName();

  public abstract void setOrderStateName(Long paramLong);

  public abstract String getOrderItemStateshortDesc();

  public abstract void setOrderItemStateshortDesc(String paramString);

  public abstract String getOrderItemStateLongDesc();

  public abstract void setOrderStateItemLongDesc(String paramString);

  public abstract Long getId();

  public abstract void setId(Long paramLong);

  public abstract Date getEndDate();

  public abstract void setEndDate(Date paramDate);
}