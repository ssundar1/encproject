package com.enclothe.core.dm.order.domain;

import com.enclothe.core.common.domain.UserCategory;
import java.io.Serializable;
import java.util.Date;

public abstract interface EncOrderItemStateDetail extends Serializable
{
  public abstract Long getId();

  public abstract void setId(Long paramLong);

  public abstract Long getCurrentOwner();

  public abstract void setCurrentOwner(Long paramLong);

  public abstract void setOrderItemId(Long paramLong);

  public abstract Date getExpectedDeliverDate();

  public abstract void setExpectedDeliverDate(Date paramDate);

  public abstract UserCategory getUserCategory();

  public abstract void setUserCategory(UserCategory paramUserCategory);

  public abstract EncOrderItemStates getOrderItemState();

  public abstract void setOrderItemState(EncOrderItemStates paramEncOrderItemStates);
}