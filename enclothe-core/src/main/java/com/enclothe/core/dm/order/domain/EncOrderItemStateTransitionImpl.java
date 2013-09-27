package com.enclothe.core.dm.order.domain;

import com.enclothe.core.common.domain.UserCategory;
import com.enclothe.core.common.domain.UserCategoryImpl;
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
@Table(name="ENC_ORDER_ITEM_STATE_TRANSITION")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
@AdminPresentationClass(populateToOneFields=PopulateToOneFieldsEnum.TRUE, friendlyName="ServiceProviderImpl_base")
public class EncOrderItemStateTransitionImpl
  implements EncOrderItemStateTransition
{
  private static final long serialVersionUID = 6545097668293683751L;

  @Id
  @GeneratedValue(generator="ENC_ORDER_ITEM_STATE_TRANSITION_ID")
  @GenericGenerator(name="ENC_ORDER_ITEM_STATE_TRANSITION_ID", strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator", parameters={@org.hibernate.annotations.Parameter(name="segment_value", value="EncOrderItemStateDetailImpl"), @org.hibernate.annotations.Parameter(name="entity_name", value="com.enclothe.core.dm.order.domain.EncOrderItemStateTransitionImpl")})
  @AdminPresentation(friendlyName="EncOrderItemStateTransitionImpl_Id", group="EncOrderItemStateTransitionImpl_Primary_Key", visibility=VisibilityEnum.HIDDEN_ALL)
  @Column(name="ORDER_ITEM_STATE_TRANSITION_ID", nullable=false)
  protected Long id;

  @Column(name="NEW_OWNER", nullable=true)
  @AdminPresentation(friendlyName="EncOrderItemStateTransitionImpl_newOwner", order=10, group="EncOrderItemStateTransitionImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected Long newOwner;

  @OneToOne(cascade={javax.persistence.CascadeType.ALL}, targetEntity=UserCategoryImpl.class, optional=false)
  @JoinColumn(name="NEW_OWNER_CATEGORY_ID", referencedColumnName="USER_CATEGORY_ID")
  @AdminPresentation(friendlyName="EncOrderItemStateTransitionImpl_newOwnerCategory", order=200, group="EncOrderItemStateTransitionImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected UserCategory newOwnerCategory;

  @Column(name="PREV_OWNER", nullable=true)
  @AdminPresentation(friendlyName="EncOrderItemStateTransitionImpl_prevOwner", order=10, group="EncOrderItemStateTransitionImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected Long prevOwner;

  @OneToOne(cascade={javax.persistence.CascadeType.ALL}, targetEntity=UserCategoryImpl.class, optional=false)
  @JoinColumn(name="PREV_OWNER_CATEGORY_ID", referencedColumnName="USER_CATEGORY_ID")
  @AdminPresentation(friendlyName="EncOrderItemStateTransitionImpl_prevOwnerCategory", order=200, group="EncOrderItemStateTransitionImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected UserCategory prevOwnerCategory;

  @OneToOne(cascade={javax.persistence.CascadeType.ALL}, targetEntity=EncOrderItemImpl.class, optional=false)
  @JoinColumn(name="ORDER_ITEM_ID")
  @AdminPresentation(friendlyName="EncOrderItemStateTransitionImpl_orderItemId", order=20, group="EncOrderItemStateDetailImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected EncOrderItem orderItem;

  @OneToOne(cascade={javax.persistence.CascadeType.ALL}, targetEntity=EncOrderItemStatesImpl.class, optional=false)
  @JoinColumn(name="ORDER_ITEM_STATE_ID")
  @AdminPresentation(friendlyName="EncOrderItemStateTransitionImpl_orderItemState", order=30, group="EncOrderItemStateTransitionImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected EncOrderItemStates orderItemState;

  @Column(name="COMMENTS", nullable=true)
  @AdminPresentation(friendlyName="EncOrderItemStateTransitionImpl_comments", order=30, group="EncOrderItemStateTransitionImpl_GRP", visibility=VisibilityEnum.HIDDEN_ALL)
  protected String comments;

  @Embedded
  protected Auditable auditable = new Auditable();

  public String getComments()
  {
    return this.comments;
  }

  public void setComments(String comments) {
    this.comments = comments;
  }

  public Long getId() {
    return this.id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Long getNewOwner()
  {
    return this.newOwner;
  }

  public void setNewOwner(Long newOwner) {
    this.newOwner = newOwner;
  }

  public UserCategory getNewOwnerCategory() {
    return this.newOwnerCategory;
  }

  public void setNewOwnerCategory(UserCategory newOwnerCategory) {
    this.newOwnerCategory = newOwnerCategory;
  }

  public Long getPrevOwner() {
    return this.prevOwner;
  }

  public void setPrevOwner(Long prevOwner) {
    this.prevOwner = prevOwner;
  }

  public UserCategory getPrevOwnerCategory() {
    return this.prevOwnerCategory;
  }

  public void setPrevOwnerCategory(UserCategory prevOwnerCategory) {
    this.prevOwnerCategory = prevOwnerCategory;
  }

  public EncOrderItem getOrderItem() {
	    return this.orderItem;
	  }

	  public void setOrderItem(EncOrderItem orderItem) {
	    this.orderItem = orderItem;
	  }

  public EncOrderItemStates getOrderItemState()
  {
    return this.orderItemState;
  }

  public void setOrderItemState(EncOrderItemStates orderItemState) {
    this.orderItemState = orderItemState;
  }
}