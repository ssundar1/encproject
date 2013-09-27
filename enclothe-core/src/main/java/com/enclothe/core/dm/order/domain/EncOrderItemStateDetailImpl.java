package com.enclothe.core.dm.order.domain;

import com.enclothe.core.common.domain.UserCategory;
import com.enclothe.core.common.domain.UserCategoryImpl;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
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

@Entity
@EntityListeners({AuditableListener.class})
@Inheritance(strategy=InheritanceType.JOINED)
@Table(name="ENC_ORDER_ITEM_STATE_DETAIL")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
@AdminPresentationClass(populateToOneFields=PopulateToOneFieldsEnum.TRUE, friendlyName="ServiceProviderImpl_base")
public class EncOrderItemStateDetailImpl  implements EncOrderItemStateDetail
{
  private static final long serialVersionUID = 6545097668293683751L;

  @Id
  @GeneratedValue(generator="ENC_ORDER_ITEM_STATE_DETAIL_ID")
  @GenericGenerator(name="ENC_ORDER_ITEM_STATE_DETAIL_ID", strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator", parameters={@org.hibernate.annotations.Parameter(name="segment_value", value="EncOrderItemStateDetailImpl"), @org.hibernate.annotations.Parameter(name="entity_name", value="com.enclothe.core.serviceprovider.domain.ServiceProviderImpl")})
  @AdminPresentation(friendlyName="EncOrderItemStateDetailImpl_Id", group="EncOrderItemStateDetailImpl_Primary_Key", visibility=VisibilityEnum.HIDDEN_ALL)
  @Column(name="ORDER_ITEM_STATE_DETAIL_ID", nullable=false)
  protected Long id;

  @Column(name="CURRENT_OWNER", nullable=true)
  @AdminPresentation(friendlyName="EncOrderItemStateDetailImpl_currentOwner", order=10, group="EncOrderItemStateDetailImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected Long currentOwner;

  @Column(name="ORDER_ITEM_ID", nullable=true)
  @AdminPresentation(friendlyName="EncOrderItemStateDetailImpl_orderItemId", order=30, group="EncOrderItemStateDetailImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected Long orderItemId;

  @OneToOne(cascade={javax.persistence.CascadeType.ALL}, targetEntity=EncOrderItemStates.class, optional=false)
  @JoinColumn(name="CURRENT_STATE_ID", referencedColumnName="ORDER_ITEM_STATE_ID")
  @AdminPresentation(friendlyName="EncOrderItemStateDetailImpl_currentStateId", order=30, group="EncOrderItemStateDetailImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected EncOrderItemStates orderItemState;

  @Embedded
  protected Auditable auditable = new Auditable();

  @Column(name="EXPECTED_DELIVERY_DATE")
  @AdminPresentation(friendlyName="EncOrderItemStateDetailImpl_expectedDeliverDate", order=200, group="EncOrderItemStateDetailImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected Date expectedDeliverDate;

  @OneToOne(cascade={javax.persistence.CascadeType.ALL}, targetEntity=UserCategoryImpl.class, optional=false)
  @JoinColumn(name="OWNER_CATEGORY_ID", referencedColumnName="USER_CATEGORY_ID")
  @AdminPresentation(friendlyName="EncOrderItemStateDetailImpl_userCategory", order=200, group="EncOrderItemStateDetailImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected UserCategory userCategory;

  public Long getId()
  {
    return this.id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Long getCurrentOwner() {
    return this.currentOwner;
  }

  public void setCurrentOwner(Long currentOwner) {
    this.currentOwner = currentOwner;
  }

  public Long getOrderItemId()
  {
    return this.orderItemId;
  }

  public void setOrderItemId(Long orderItemId) {
    this.orderItemId = orderItemId;
  }

  public Date getExpectedDeliverDate()
  {
    return this.expectedDeliverDate;
  }

  public void setExpectedDeliverDate(Date expectedDeliverDate) {
    this.expectedDeliverDate = expectedDeliverDate;
  }

  public UserCategory getUserCategory() {
    return this.userCategory;
  }

  public void setUserCategory(UserCategory userCategory) {
    this.userCategory = userCategory;
  }

  public EncOrderItemStates getOrderItemState() {
    return this.orderItemState;
  }

  public void setOrderItemState(EncOrderItemStates orderItemState) {
    this.orderItemState = orderItemState;
  }
}