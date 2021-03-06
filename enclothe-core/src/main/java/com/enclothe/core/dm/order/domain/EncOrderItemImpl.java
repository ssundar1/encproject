package com.enclothe.core.dm.order.domain;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.AdminPresentationCollection;
import org.broadleafcommerce.common.presentation.AdminPresentationToOneLookup;
import org.broadleafcommerce.common.presentation.client.AddMethodType;
import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.catalog.domain.SkuImpl;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItemImpl;
import org.broadleafcommerce.core.order.domain.OrderItemImpl;
import org.hibernate.annotations.Index;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.measurement.domain.MeasurementImpl;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncDesignImpl;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_ORDER_ITEM")
public class EncOrderItemImpl extends DiscreteOrderItemImpl implements
		EncOrderItem {
	private static final long serialVersionUID = 6545097668293683751L;

	@OneToOne(targetEntity = EncOrderItemStatesImpl.class, optional = false)
	@JoinColumn(name = "ORDER_ITEM_STATE_ID")
	@AdminPresentationCollection(friendlyName = "EncOrderItemImpl_state", order = 10, addType = AddMethodType.PERSIST, tab = "EncOrderItemImpl_Advanced_Tab", tabOrder = 3000)
	protected EncOrderItemStates orderItemState;

	@OneToOne(targetEntity = EncOrderItemStateDetailImpl.class, optional = false)
	@JoinColumn(name = "ORDER_ITEM_STATE_DETAIL_ID")
	@AdminPresentationCollection(friendlyName = "EncOrderItemImpl_state_detail", order = 20, addType = AddMethodType.PERSIST, tab = "EncOrderItemImpl_Advanced_Tab", tabOrder = 3000)
	protected EncOrderItemStateDetail orderItemStateDetail;

	@OneToOne(targetEntity = MeasurementImpl.class, optional = false)
	@JoinColumn(name = "ORDER_ITEM_MEASUREMENT_ID")
	@AdminPresentationCollection(friendlyName = "EncOrderItemImpl_state_detail", order = 20, addType = AddMethodType.PERSIST, tab = "EncOrderItemImpl_Advanced_Tab", tabOrder = 3000)
	protected Measurement measurement;

	@OneToOne(targetEntity = EncDesignImpl.class, optional = false)
	@JoinColumn(name = "ORDER_ITEM_DESIGN_ID")
	@AdminPresentationCollection(friendlyName = "EncOrderItemImpl_state_detail", order = 40, addType = AddMethodType.PERSIST, tab = "EncOrderItemImpl_Advanced_Tab", tabOrder = 3000)
	protected EncDesign design;

	@ManyToOne(targetEntity = SkuImpl.class, optional = false)
	@JoinColumn(name = "DESIGN_SKU_ID", nullable = false)
	@Index(name = "DISCRETE_SKU_INDEX", columnNames = { "SKU_ID" })
	@AdminPresentation(friendlyName = "DiscreteOrderItemImpl_Sku", order = 20, group = OrderItemImpl.Presentation.Group.Name.Catalog, groupOrder = OrderItemImpl.Presentation.Group.Order.Catalog)
	@AdminPresentationToOneLookup()
	protected Sku designSku;

	public Sku getDesignSku() {
		return designSku;
	}

	public void setDesignSku(Sku designSku) {
		this.designSku = designSku;
	}

	public EncDesign getDesign() {
		return design;
	}

	public void setDesign(EncDesign design) {
		this.design = design;
	}

	public void setOrderItemStateDetail(
			EncOrderItemStateDetail orderItemStateDetail) {
		this.orderItemStateDetail = orderItemStateDetail;
	}

	@Override
	public Measurement getMeasurement() {
		return measurement;
	}

	@Override
	public void setMeasurement(Measurement measurement) {
		this.measurement = measurement;
	}

	@Override
	public EncOrderItemStates getOrderItemState() {
		return this.orderItemState;
	}

	@Override
	public void setOrderItemState(EncOrderItemStates orderItemState) {
		this.orderItemState = orderItemState;
	}

	@Override
	public EncOrderItemStateDetail getOrderItemStateDetail() {
		return this.orderItemStateDetail;
	}

	public static class Presentation {
		public static class Tab {
			public static class Name {
				public static final String Contact = "EncOrderItemImpl_Contact_Tab";
				public static final String Advanced = "EncOrderItemImpl_Advanced_Tab";
			}

			public static class Order {
				public static final int Contact = 2000;
				public static final int Advanced = 3000;
			}
		}
	}
}