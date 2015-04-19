package com.enclothe.core.dm.order.domain;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
import com.enclothe.core.product.domain.EncTailor;
import com.enclothe.core.product.domain.EncTailorImpl;

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

	@ManyToMany(targetEntity = EncDesignImpl.class, cascade = CascadeType.ALL)
    @JoinTable(name = "ENC_ORDER_ITEM_DESIGN_MAP", joinColumns = @JoinColumn(name = "ORDER_ITEM_ID"),
    inverseJoinColumns = @JoinColumn(name = "DESIGN_ID"))
	protected List<EncDesign> designs;

	@ManyToMany(targetEntity = SkuImpl.class, cascade = CascadeType.ALL)
    @JoinTable(name = "ENC_ORDER_ITEM_DESIGN_SKU_MAP", joinColumns = @JoinColumn(name = "ORDER_ITEM_ID"),
    inverseJoinColumns = @JoinColumn(name = "SKU_ID"))
	protected List<Sku> designSkus;

	@ManyToOne(targetEntity = EncTailorImpl.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "TAILOR_ID")
	protected EncTailor tailor;
	
	@ManyToOne(targetEntity = EncTailorImpl.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "TAILOR_SKU_ID")
	protected Sku tailorSku;
	
	public List<EncDesign> getDesigns() {
		return designs;
	}

	public void setDesigns(List<EncDesign> designs) {
		this.designs = designs;
	}

	public List<Sku> getDesignSkus() {
		return designSkus;
	}

	public void setDesignSkus(List<Sku> designSkus) {
		this.designSkus = designSkus;
		
		//Once the Design Sku are set recalculate base retail and sale price
		if (designSkus != null )
			reCalculateBaseRetailAndSalePrice(designSkus);
	}

	public EncTailor getTailor() {
		return tailor;
	}

	public void setTailor(EncTailor tailor) {
		this.tailor = tailor;
	}

	public Sku getTailorSku() {
		return tailorSku;
	}

	public void setTailorSku(Sku tailorSku) {
		this.tailorSku = tailorSku;
		
		List<Sku> skuList = new ArrayList<Sku>();
		skuList.add(tailorSku);
		
		//Once the tailor is set recalculate base retail and sale price
		reCalculateBaseRetailAndSalePrice(skuList);
	}

	private void reCalculateBaseRetailAndSalePrice(Collection<Sku> skus)
	{
		if(skus == null)
			return;
		
		for(Sku sku: skus)
		{
			if(this.baseRetailPrice == null)
				this.baseRetailPrice = new BigDecimal(0.0);
			
			if (sku.getRetailPrice() != null)
				this.baseRetailPrice = this.baseRetailPrice.add(sku
						.getRetailPrice().getAmount());
			
			if (this.baseSalePrice!= null)
			{
				if(sku.getSalePrice() != null)
					this.baseSalePrice = this.baseSalePrice.add(sku
						.getSalePrice().getAmount());
				else
					this.baseSalePrice = this.baseSalePrice.add(sku.getRetailPrice().getAmount());
			}		
		}
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

	private boolean updateSalePrice() {
		if (isSalePriceOverride()) {
			return false;
		}

		Money skuSalePrice = (getSku().getSalePrice() == null ? null : getSku()
				.getSalePrice());

		List<Sku> designSkus = getDesignSkus();
		if(designSkus != null)
		{
			for(Sku sku: designSkus)
			{
				if (skuSalePrice != null)
					if(sku.getSalePrice() != null)
						skuSalePrice = skuSalePrice.add(sku.getSalePrice());
					else
						skuSalePrice = skuSalePrice.add(sku.getRetailPrice());
			}

		}
		
		
		if (skuSalePrice != null )
			if(getTailorSku() != null)
				if(getTailorSku().getSalePrice() != null)
					skuSalePrice = skuSalePrice.add(getTailorSku().getSalePrice());
				else 
					skuSalePrice = skuSalePrice.add(getTailorSku().getRetailPrice());
		
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

		List<Sku> designSkus = getDesignSkus();
		if(designSkus != null)
		{
			for(Sku sku: designSkus)
			{
				if (sku.getRetailPrice() != null)
					skuRetailPrice = skuRetailPrice.add(sku.getRetailPrice());					
			}
			
		}		
		
		if (getTailorSku() != null && getTailorSku().getRetailPrice() != null)
			skuRetailPrice = skuRetailPrice.add(getTailorSku().getRetailPrice());

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