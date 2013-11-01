package com.enclothe.core.dm.order.service;

import java.util.ArrayList;
import java.util.List;

import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.order.domain.BundleOrderItem;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice;
import org.broadleafcommerce.core.order.service.call.AbstractOrderItemRequest;
import org.broadleafcommerce.core.order.service.call.DiscreteOrderItemRequest;

import com.enclothe.core.dm.order.domain.EncOrderItem;
import com.enclothe.core.dm.order.domain.EncOrderItemStateDetail;
import com.enclothe.core.dm.order.domain.EncOrderItemStates;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncMaterial;


	public class EncOrderItemRequest extends DiscreteOrderItemRequest {

	    protected EncOrderItem encOrderItem;	    
	    protected EncDesign design;
	    protected Measurement measurement;
	    protected Sku designSku;
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

		public Sku getDesignSku() {
			return designSku;
		}

		public void setDesignSku(Sku designSku) {
			this.designSku = designSku;
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

		
		 public EncDesign getDesign() {
				return design;
			}

			public void setDesign(EncDesign design) {
				this.design = design;
			}
	    public EncOrderItem getEncOrderItem() {
	        return encOrderItem;
	    }
	    
	    public void setEncOrderItem(EncOrderItem bundleOrderItem) {
	        this.encOrderItem = bundleOrderItem;
	    }

	   
}
