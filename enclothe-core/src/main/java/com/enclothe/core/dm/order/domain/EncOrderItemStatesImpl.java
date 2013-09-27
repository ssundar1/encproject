package com.enclothe.core.dm.order.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.common.audit.AuditableListener;
import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.AdminPresentationClass;
import org.broadleafcommerce.common.presentation.PopulateToOneFieldsEnum;
import org.broadleafcommerce.common.presentation.client.VisibilityEnum;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@EntityListeners({AuditableListener.class})
@Inheritance(strategy=InheritanceType.JOINED)
@Table(name="ENC_ORDER_ITEM_STATES")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
@AdminPresentationClass(populateToOneFields=PopulateToOneFieldsEnum.TRUE, friendlyName="OrderItemStatesImpl_base")
public class EncOrderItemStatesImpl  implements EncOrderItemStates{
  private static final long serialVersionUID = -7172331591443319429L;

  @Id
  @GeneratedValue(generator="OrderItemStatesId")
  @GenericGenerator(name="OrderItemStatesId", strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator", parameters={@org.hibernate.annotations.Parameter(name="segment_value", value="OrderItemStatesImpl"), @org.hibernate.annotations.Parameter(name="entity_name", value="com.enclothe.core.dm.order.domain.OrderItemStatesImpl")})
  @AdminPresentation(friendlyName="OrderItemStatesImpl_Id", group="OrderItemStatesImpl_Primary_Key", visibility=VisibilityEnum.HIDDEN_ALL)
  @Column(name="ORDER_ITEM_STATE_ID", nullable=false)
  protected Long id;

  @Column(name="ORDER_ITEM_STATE_NAME")
  @AdminPresentation(friendlyName="OrderItemStatesImpl_orderStateName", order=20, group="OrderItemStatesImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected String orderStateName;

  @Column(name="ORDER_ITEM_STATE_SHORT_DESC")
  @AdminPresentation(friendlyName="OrderItemStatesImpl_OrderItemStateshortDesc", order=30, group="OrderItemStatesImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected String OrderItemStateshortDesc;

  @Column(name="ORDER_ITEM_STATE_LONG_DESC")
  @AdminPresentation(friendlyName="OrderItemStatesImpl_orderStateLongDesc", order=40, group="OrderItemStatesImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected String orderItemStateLongDesc;

  @Column(name="END_DATE")
  @AdminPresentation(friendlyName="OrderItemStatesImpl_End_Date", order=50, group="OrderItemStatesImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected Date endDate;

  @Embedded
  protected Auditable auditable = new Auditable();

  public String getOrderStateName()
  {
    return this.orderStateName;
  }

  public void setOrderStateName(String orderStateName) {
    this.orderStateName = orderStateName;
  }

  public String getOrderItemStateshortDesc() {
    return this.OrderItemStateshortDesc;
  }

  public void setOrderItemStateshortDesc(String OrderItemStateshortDesc) {
    this.OrderItemStateshortDesc = OrderItemStateshortDesc;
  }

  public String getOrderItemStateLongDesc() {
    return this.orderItemStateLongDesc;
  }

  public void setOrderStateItemLongDesc(String orderItemStateLongDesc) {
    this.orderItemStateLongDesc = orderItemStateLongDesc;
  }

  public Date getEndDate()
  {
    return this.endDate;
  }

  public void setEndDate(Date endDate) {
    this.endDate = endDate;
  }

  public Long getId()
  {
    return this.id;
  }

  public void setId(Long id)
  {
    this.id = id;
  }

  public static class Presentation
  {
    public static class Tab
    {
      public static class Name
      {
        public static final String Contact = "OrderItemStatesImpl_Contact_Tab";
        public static final String Advanced = "OrderItemStatesImpl_Advanced_Tab";
      }

      public static class Order
      {
        public static final int Contact = 2000;
        public static final int Advanced = 3000;
      }
    }
  }
}