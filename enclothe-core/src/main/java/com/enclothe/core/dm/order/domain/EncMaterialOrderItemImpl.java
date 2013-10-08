package com.enclothe.core.dm.order.domain;

import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.common.presentation.AdminPresentationCollection;
import org.broadleafcommerce.common.presentation.client.AddMethodType;
import org.broadleafcommerce.core.order.domain.OrderItemImpl;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.measurement.domain.MeasurementImpl;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncDesignImpl;


@Entity
@Inheritance(strategy=InheritanceType.JOINED)
@Table(name="ENC_MATERIAL_ORDER_ITEM")
public class EncMaterialOrderItemImpl extends EncOrderItemImpl{
  private static final long serialVersionUID = 6545097668293683751L;

  @OneToOne(targetEntity=EncDesignImpl.class, optional=true)
  @JoinColumn(name="DESIGN_ID")
  @AdminPresentationCollection(friendlyName="EncOrderItemImpl_state", order=10, addType=AddMethodType.PERSIST, tab="EncOrderItemImpl_Advanced_Tab", tabOrder=3000)
  protected EncDesign encDesign;

 
  public Money getRetailPrice(){ return super.getRetailPrice();}
  public Money getSalePrice(){return super.getSalePrice();}
  
  
  public EncDesign getEncDesign() {
	return encDesign;
}
public void setEncDesign(EncDesign encDesign) {
	this.encDesign = encDesign;
}


public static class Presentation
  {
    public static class Tab
    {
      public static class Name
      {
        public static final String Contact = "EncOrderItemImpl_Contact_Tab";
        public static final String Advanced = "EncOrderItemImpl_Advanced_Tab";
      }

      public static class Order
      {
        public static final int Contact = 2000;
        public static final int Advanced = 3000;
      }
    }
  }
}