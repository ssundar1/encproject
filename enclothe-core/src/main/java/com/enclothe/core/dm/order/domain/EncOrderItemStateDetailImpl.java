package com.enclothe.core.dm.order.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.MapKey;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.InheritanceType;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.common.audit.AuditableListener;
import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.AdminPresentationClass;
import org.broadleafcommerce.common.presentation.AdminPresentationCollection;
import org.broadleafcommerce.common.presentation.AdminPresentationMap;
import org.broadleafcommerce.common.presentation.PopulateToOneFieldsEnum;
import org.broadleafcommerce.common.presentation.client.AddMethodType;
import org.broadleafcommerce.common.presentation.client.VisibilityEnum;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.broadleafcommerce.core.order.domain.OrderItemImpl;
import org.broadleafcommerce.core.order.domain.OrderItemImpl.Presentation;

import com.enclothe.core.common.domain.UserCategory;
import com.enclothe.core.common.domain.UserCategoryImpl;

@Entity
@EntityListeners(value = { AuditableListener.class })
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_ORDER_ITEM_STATE_DETAIL")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "blStandardElements")
@AdminPresentationClass(populateToOneFields = PopulateToOneFieldsEnum.TRUE, friendlyName = "ServiceProviderImpl_base")
public class EncOrderItemStateDetailImpl implements EncOrderItemStateDetail {

	private static final long serialVersionUID = 6545097668293683751L;

	@Id
	@GeneratedValue(generator = "ENC_ORDER_ITEM_STATE_DETAIL_ID")
	@GenericGenerator(name = "ENC_ORDER_ITEM_STATE_DETAIL_ID", strategy = "org.broadleafcommerce.common.persistence.IdOverrideTableGenerator", parameters = {
			@Parameter(name = "segment_value", value = "EncOrderItemStateDetailImpl"),
			@Parameter(name = "entity_name", value = "com.enclothe.core.serviceprovider.domain.ServiceProviderImpl") })
	@AdminPresentation(friendlyName = "EncOrderItemStateDetailImpl_Id", group = "EncOrderItemStateDetailImpl_Primary_Key", visibility = VisibilityEnum.HIDDEN_ALL)
	@Column(name = "ORDER_ITEM_STATE_DETAIL_ID", nullable = false)
	protected Long id;

	@Column(name = "CURRENT_OWNER", nullable = true)
	@AdminPresentation(friendlyName = "EncOrderItemStateDetailImpl_currentOwner", order = 10, group = "EncOrderItemStateDetailImpl_GRP", visibility = VisibilityEnum.HIDDEN_ALL)
	protected Long currentOwner;

	@Column(name = "OWNER_CATEGORY_ID", nullable = true)
	@AdminPresentation(friendlyName = "EncOrderItemStateDetailImpl_ownerCategoryId", order = 20, group = "EncOrderItemStateDetailImpl_GRP", visibility = VisibilityEnum.HIDDEN_ALL)
	protected Long ownerCategoryId;
 
	@Column(name = "ORDER_ITEM_ID", nullable = true)
	@AdminPresentation(friendlyName = "EncOrderItemStateDetailImpl_orderItemId", order = 30, group = "EncOrderItemStateDetailImpl_GRP", visibility = VisibilityEnum.HIDDEN_ALL)
	protected Long orderItemId;

	@Column(name = "CURRENT_STATE_ID", nullable = true)
	@AdminPresentation(friendlyName = "EncOrderItemStateDetailImpl_currentStateId", order = 30, group = "EncOrderItemStateDetailImpl_GRP", visibility = VisibilityEnum.HIDDEN_ALL)
	protected Long currentStateId;

	@Embedded
	protected Auditable auditable = new Auditable();

	@Column(name = "EXPECTED_DELIVERY_DATE")
	@AdminPresentation(friendlyName = "EncOrderItemStateDetailImpl_expectedDeliverDate", order = 200, group = "EncOrderItemStateDetailImpl_GRP", visibility = VisibilityEnum.HIDDEN_ALL)
	protected Date expectedDeliverDate;

	@OneToOne(cascade = CascadeType.ALL, targetEntity = UserCategoryImpl.class, optional = false)
	@JoinColumn(name = "USER_CATEGORY_ID")
	@AdminPresentation(friendlyName = "EncOrderItemStateDetailImpl_userCategory", order = 200, group = "EncOrderItemStateDetailImpl_GRP", visibility = VisibilityEnum.HIDDEN_ALL)
	protected UserCategory userCategory;

	@OneToOne(targetEntity = EncOrderItemStates.class, optional = false)
	@JoinColumn(name = "ORDER_ITEM_STATE_ID")
	@AdminPresentationCollection(friendlyName = "EncOrderItemStateDetailImpl_state", order = 10, addType = AddMethodType.PERSIST, tab = Presentation.Tab.Name.Advanced, tabOrder = Presentation.Tab.Order.Advanced)
	protected EncOrderItemStates orderItemState;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCurrentOwner() {
		return currentOwner;
	}

	public void setCurrentOwner(Long currentOwner) {
		this.currentOwner = currentOwner;
	}

	public Long getOwnerCategoryId() {
		return userCategory.getId();
	}

	public void setOwnerCategoryId(Long ownerCategoryId) {
		this.ownerCategoryId = ownerCategoryId;
	}

	public Long getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(Long orderItemId) {
		this.orderItemId = orderItemId;
	}

	public Long getCurrentStateId() {
		return orderItemState.getId();
	}

	public void setCurrentStateId(Long currentStateId) {
		this.currentStateId = currentStateId;
	}

	public Date getExpectedDeliverDate() {
		return expectedDeliverDate;
	}

	public void setExpectedDeliverDate(Date expectedDeliverDate) {
		this.expectedDeliverDate = expectedDeliverDate;
	}

	public UserCategory getUserCategory() {
		return userCategory;
	}

	public void setUserCategory(UserCategory userCategory) {
		this.userCategory = userCategory;
	}

	public EncOrderItemStates getOrderItemState() {
		return orderItemState;
	}

	public void setOrderItemState(EncOrderItemStates orderItemState) {
		this.orderItemState = orderItemState;
	}
	
	

}
