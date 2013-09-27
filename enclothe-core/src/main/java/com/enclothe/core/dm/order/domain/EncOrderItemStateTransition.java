package com.enclothe.core.dm.order.domain;

import com.enclothe.core.common.domain.UserCategory;
import java.io.Serializable;

public abstract interface EncOrderItemStateTransition extends Serializable
{
  public abstract Long getId();

  public abstract void setId(Long paramLong);

  public abstract Long getNewOwner();

  public abstract void setNewOwner(Long paramLong);

  public abstract UserCategory getNewOwnerCategory();

  public abstract void setNewOwnerCategory(UserCategory paramUserCategory);

  public abstract Long getPrevOwner();

  public abstract void setPrevOwner(Long paramLong);

  public abstract UserCategory getPrevOwnerCategory();

  public abstract void setPrevOwnerCategory(UserCategory paramUserCategory);

  public abstract Long getOrderItemId();

  public abstract void setOrderItemId(Long paramLong);

  public abstract EncOrderItemStates getOrderItemState();

  public abstract void setOrderItemState(EncOrderItemStates paramEncOrderItemStates);

  public abstract String getComments();

  public abstract void setComments(String paramString);
}