package com.enclothe.core.dm.order.service;
//TODO to be Removed Not being used anywhere
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.broadleafcommerce.common.currency.util.BroadleafCurrencyUtils;
import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice;
import org.broadleafcommerce.core.order.service.call.AbstractOrderItemRequest;
import org.broadleafcommerce.core.order.service.call.DiscreteOrderItemRequest;

import com.enclothe.core.dm.order.domain.EncOrderItemStateDetail;
import com.enclothe.core.dm.order.domain.EncOrderItemStates;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncTailor;


	public class EncOrderItemRequest extends DiscreteOrderItemRequest {
  
	    protected List<EncDesign> designs;
	    protected List<Sku> designSkus;
	    protected EncTailor tailor;
	    protected Sku tailorSku;
	    protected Measurement measurement;
	    protected EncOrderItemStates orderItemState;
	    protected EncOrderItemStateDetail orderItemStateDetail;
	    
	    
	    public EncOrderItemStateDetail getOrderItemStateDetail() {
			return orderItemStateDetail;
		}

		public void setOrderItemStateDetail(EncOrderItemStateDetail orderItemStateDetail) {
			this.orderItemStateDetail = orderItemStateDetail;
		}

		public EncOrderItemStates getOrderItemState() {
			return orderItemState;
		}

		public void setOrderItemState(EncOrderItemStates orderItemState) {
			this.orderItemState = orderItemState;
		}

		public Measurement getMeasurement() {
			return measurement;
		}

		public void setMeasurement(Measurement measurement) {
			this.measurement = measurement;
		}

		protected List<DiscreteOrderItemFeePrice> discreteOrderItemFeePrices = new ArrayList<DiscreteOrderItemFeePrice>();

	    public EncOrderItemRequest() {
	        super();
	    }

	    public EncOrderItemRequest(AbstractOrderItemRequest request) {
	        super(request);
	    }


	    @Override
	    public EncOrderItemRequest clone() {
	    	EncOrderItemRequest returnRequest = new EncOrderItemRequest();
	        copyProperties(returnRequest);
	        returnRequest.setDiscreteOrderItemFeePrices(discreteOrderItemFeePrices);
	        return returnRequest;
	    }

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
		}
		
		public Money getRetailPrice()
		{
			Money retailPrice = this.sku.getRetailPrice();
			
			for(Sku sku: getDesignSkus())
			{
				if (sku.getRetailPrice() != null)
					retailPrice = retailPrice.add(sku.getRetailPrice());					
			}
			
			if (getTailorSku() != null && getTailorSku().getRetailPrice() != null)
				retailPrice = retailPrice.add(getTailorSku().getRetailPrice());
			
			return retailPrice;
		}
		
		public Money getSalePrice()
		{
			Money salePrice = this.sku.getRetailPrice();
			
			if(salePrice == null)
				return salePrice;
			
			for(Sku sku: getDesignSkus())
			{
				if (sku.getSalePrice() != null)
					salePrice = salePrice.add(sku.getSalePrice());
				else
					salePrice = salePrice.add(sku.getRetailPrice());
			}
			
			if (getTailorSku() != null)
				if(getTailorSku().getSalePrice() != null)
					salePrice = salePrice.add(getTailorSku().getSalePrice());
				else
					salePrice = salePrice.add(getTailorSku().getRetailPrice());
			
			return salePrice;
		}
		   
}
