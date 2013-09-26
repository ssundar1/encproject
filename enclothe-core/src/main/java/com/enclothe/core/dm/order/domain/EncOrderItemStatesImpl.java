package com.enclothe.core.dm.order.domain;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.Table;
import javax.persistence.InheritanceType;
import java.util.Map;
import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.common.audit.AuditableListener;
import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.AdminPresentationClass;
import org.broadleafcommerce.common.presentation.PopulateToOneFieldsEnum;
import org.broadleafcommerce.common.presentation.client.VisibilityEnum;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

 
@EntityListeners(value = { AuditableListener.class })
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_ORDER_ITEM_STATES")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
@AdminPresentationClass(populateToOneFields = PopulateToOneFieldsEnum.TRUE, friendlyName = "OrderItemStatesImpl_base")

public class EncOrderItemStatesImpl implements EncOrderItemStates {

    /**
	 * Domain class to hold the different states of an order or order item
	 * Author :Sundararajan Suriyaprakash
	 */
	private static final long serialVersionUID = -7172331591443319429L;

	@Id
    @GeneratedValue(generator= "OrderItemStatesId")
    @GenericGenerator(
        name="OrderItemStatesId",
        strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator",
        parameters = {
            @Parameter(name="segment_value", value="OrderItemStatesImpl"),
            @Parameter(name="entity_name", value="com.enclothe.core.order.domain.OrderItemStatesImpl")
        }
    )
    @AdminPresentation(friendlyName = "OrderItemStatesImpl_Id", group = "OrderItemStatesImpl_Primary_Key",
    visibility = VisibilityEnum.HIDDEN_ALL)
    @Column(name = "ORDER_ITEM_STATE_ID", nullable=false)
    protected Long id;
	
    @Column(name = "ORDER_ITEM_STATE_NAME")
    @AdminPresentation(friendlyName = "OrderItemStatesImpl_orderStateName", order = 20, group = "OrderItemStatesImpl_GRP",
    visibility = VisibilityEnum.HIDDEN_ALL)
    protected Long orderStateName;

    @Column(name = "ORDER_ITEM_STATE_SHORT_DESC")
    @AdminPresentation(friendlyName = "OrderItemStatesImpl_OrderItemStateshortDesc", order = 30, group = "OrderItemStatesImpl_GRP",
    visibility = VisibilityEnum.HIDDEN_ALL)
    protected String OrderItemStateshortDesc;
    
    
    @Column(name = "ORDER_ITEM_STATE_LONG_DESC")
    @AdminPresentation(friendlyName = "OrderItemStatesImpl_orderStateLongDesc", order = 40, group = "OrderItemStatesImpl_GRP",
	visibility = VisibilityEnum.HIDDEN_ALL)
    protected String orderItemStateLongDesc;
    
    @Column(name = "END_DATE")
    @AdminPresentation(friendlyName = "OrderItemStatesImpl_End_Date", order = 200, group = "OrderItemStatesImpl_GRP",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected Date endDate;
    
    @Override
	public Long getOrderStateName() {
		return orderStateName;
	}
    @Override
	public void setOrderStateName(Long orderStateName) {
		this.orderStateName = orderStateName;
	}
    @Override
	public String getOrderItemStateshortDesc() {
		return OrderItemStateshortDesc;
	}
    @Override
	public void setOrderItemStateshortDesc(String OrderItemStateshortDesc) {
		this.OrderItemStateshortDesc = OrderItemStateshortDesc;
	}
    @Override
	public String getOrderItemStateLongDesc() {
		return orderItemStateLongDesc;
	}
    @Override
	public void setOrderStateItemLongDesc(String orderItemStateLongDesc) {
		this.orderItemStateLongDesc = orderItemStateLongDesc;
	}
    @Embedded
    protected Auditable auditable = new Auditable();
    @Override
    public Date getEndDate() {
		return endDate;
	}
    @Override
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	@Override
	public Long getId() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public void setId(Long id) {
		this.id = id;
	}

	
	
}
