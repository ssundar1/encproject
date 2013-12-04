package com.enclothe.core.dm.order.domain;

import java.io.Serializable;
import java.util.Date;

public abstract interface EncOrderItemStates extends Serializable
{
  public static final long SUBMITTED=100;
  public static final long MATERIAL_SHIPPED=101;
  public static final long STITCHING_IN_PROGRESS=102;
  public static final long SHIPPED=103;
  public static final long COMPLETED=104;
  
  public abstract String getOrderStateName();

  public abstract void setOrderStateName(String paramLong);

  public abstract String getOrderItemStateshortDesc();

  public abstract void setOrderItemStateshortDesc(String paramString);

  public abstract String getOrderItemStateLongDesc();

  public abstract void setOrderStateItemLongDesc(String paramString);

  public abstract Long getId();

  public abstract void setId(Long paramLong);

  public abstract Date getEndDate();

  public abstract void setEndDate(Date paramDate);
}