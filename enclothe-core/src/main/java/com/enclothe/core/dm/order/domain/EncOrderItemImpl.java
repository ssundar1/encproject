package com.enclothe.core.dm.order.domain;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.AdminPresentationCollection;
import org.broadleafcommerce.common.presentation.AdminPresentationToOneLookup;
import org.broadleafcommerce.common.presentation.client.AddMethodType;
import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.catalog.domain.SkuImpl;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItemImpl;
import org.broadleafcommerce.core.order.domain.OrderItemImpl;
import org.hibernate.annotations.Index;

import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.dispute.domain.DisputeImpl;
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

	@OneToOne(targetEntity = EncOrderItemStatesImpl.class)
	@JoinColumn(name = "ORDER_ITEM_STATE_ID")
	@AdminPresentationCollection(friendlyName = "EncOrderItemImpl_state", order = 10, addType = AddMethodType.PERSIST, tab = "EncOrderItemImpl_Advanced_Tab", tabOrder = 3000)
	protected EncOrderItemStates orderItemState;

	@OneToOne(targetEntity = EncOrderItemStateDetailImpl.class)
	@JoinColumn(name = "ORDER_ITEM_STATE_DETAIL_ID")
	@AdminPresentationCollection(friendlyName = "EncOrderItemImpl_state_detail", order = 20, addType = AddMethodType.PERSIST, tab = "EncOrderItemImpl_Advanced_Tab", tabOrder = 3000)
	protected EncOrderItemStateDetail orderItemStateDetail;

	@OneToOne(targetEntity = MeasurementImpl.class)
	@JoinColumn(name = "ORDER_ITEM_MEASUREMENT_ID")
	@AdminPresentationCollection(friendlyName = "EncOrderItemImpl_state_detail", order = 20, addType = AddMethodType.PERSIST, tab = "EncOrderItemImpl_Advanced_Tab", tabOrder = 3000)
	protected Measurement measurement;

	@OneToOne(targetEntity = EncDesignImpl.class)
	@JoinColumn(name = "ORDER_ITEM_DESIGN_ID")
	@AdminPresentationCollection(friendlyName = "EncOrderItemImpl_state_detail", order = 40, addType = AddMethodType.PERSIST, tab = "EncOrderItemImpl_Advanced_Tab", tabOrder = 3000)
	protected EncDesign design;

	/*@OneToOne(mappedBy = "orderItem", targetEntity = DisputeImpl.class)
	@AdminPresentationCollection(friendlyName = "EncOrderItemImpl_dispute_detail", order = 40, addType = AddMethodType.PERSIST, tab = "EncOrderItemImpl_Advanced_Tab", tabOrder = 3000)
	protected Dispute dispute;*/

	@ManyToOne(targetEntity = SkuImpl.class)
	@JoinColumn(name = "DESIGN_SKU_ID")
	@Index(name = "DISCRETE_SKU_INDEX", columnNames = { "SKU_ID" })
	@AdminPresentation(friendlyName = "DiscreteOrderItemImpl_Sku", order = 20, group = OrderItemImpl.Presentation.Group.Name.Catalog, groupOrder = OrderItemImpl.Presentation.Group.Order.Catalog)
	@AdminPresentationToOneLookup()
	protected Sku designSku;

	public Sku getDesignSku() {
		return designSku;
	}

	public void setDesignSku(Sku designSku) {
		this.designSku = designSku;

		if (designSku.getRetailPrice() != null) {
			this.baseRetailPrice = designSku.getRetailPrice().getAmount();

			if (sku.getRetailPrice() != null)
				this.baseRetailPrice = this.baseRetailPrice.add(sku
						.getRetailPrice().getAmount());
		}
		if (designSku.getSalePrice() != null) {
			this.baseSalePrice = designSku.getSalePrice().getAmount();

			if (sku.getSalePrice() != null)
				this.baseSalePrice = this.baseSalePrice.add(sku.getSalePrice()
						.getAmount());
		}
	}

	public EncDesign getDesign() {
		return design;
	}

	public void setDesign(EncDesign design) {
		this.design = design;
	}

	/*public Dispute getDispute() {
		return dispute;
	}

	public void setDispute(Dispute dispute) {
		this.dispute = dispute;
	}*/

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

	private boolean updateSalePrice() {
		if (isSalePriceOverride()) {
			return false;
		}

		Money skuSalePrice = (getSku().getSalePrice() == null ? null : getSku()
				.getSalePrice());

		if (getDesignSku() != null && getDesignSku().getSalePrice() != null)
			skuSalePrice = skuSalePrice.add(getDesignSku().getSalePrice());

		// Override retail/sale prices from skuBundle.
		if (skuBundleItem != null) {
			if (skuBundleItem.getSalePrice() != null) {
				skuSalePrice = skuBundleItem.getSalePrice();
			}
		}

		boolean updated = false;
		// use the sku prices - the retail and sale prices could be null
		if (skuSalePrice != null && !skuSalePrice.equals(salePrice)) {
			baseSalePrice = skuSalePrice.getAmount();
			salePrice = skuSalePrice.getAmount();
			updated = true;
		}

		// Adjust prices by adding in fees if they are attached.
		if (getDiscreteOrderItemFeePrices() != null) {
			for (DiscreteOrderItemFeePrice fee : getDiscreteOrderItemFeePrices()) {
				Money returnPrice = convertToMoney(salePrice);
				salePrice = returnPrice.add(fee.getAmount()).getAmount();
			}
		}
		return updated;
	}

	private boolean updateRetailPrice() {
		if (isRetailPriceOverride()) {
			return false;
		}
		Money skuRetailPrice = getSku().getRetailPrice();

		if (getDesignSku() != null && getDesignSku().getRetailPrice() != null)
			skuRetailPrice = skuRetailPrice
					.add(getDesignSku().getRetailPrice());

		// Override retail/sale prices from skuBundle.
		if (skuBundleItem != null) {
			if (skuBundleItem.getRetailPrice() != null) {
				skuRetailPrice = skuBundleItem.getRetailPrice();
			}
		}

		boolean updated = false;
		// use the sku prices - the retail and sale prices could be null
		if (!skuRetailPrice.equals(retailPrice)) {
			baseRetailPrice = skuRetailPrice.getAmount();
			retailPrice = skuRetailPrice.getAmount();
			updated = true;
		}

		// Adjust prices by adding in fees if they are attached.
		if (getDiscreteOrderItemFeePrices() != null) {
			for (DiscreteOrderItemFeePrice fee : getDiscreteOrderItemFeePrices()) {
				Money returnPrice = convertToMoney(retailPrice);
				retailPrice = returnPrice.add(fee.getAmount()).getAmount();
			}
		}
		return updated;
	}

	@Override
	public boolean updateSaleAndRetailPrices() {
        boolean salePriceUpdated = updateSalePrice();
        boolean retailPriceUpdated = updateRetailPrice();
        if (!isRetailPriceOverride() && !isSalePriceOverride()) {
            if (salePrice != null) {
                price = salePrice;
            } else {
                price = retailPrice;
            }
        }
        return salePriceUpdated || retailPriceUpdated;
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