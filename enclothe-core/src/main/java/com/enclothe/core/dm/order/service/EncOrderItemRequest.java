package com.enclothe.core.dm.order.service;

import java.util.ArrayList;
import java.util.List;

import org.broadleafcommerce.core.order.domain.BundleOrderItem;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice;
import org.broadleafcommerce.core.order.service.call.AbstractOrderItemRequest;
import org.broadleafcommerce.core.order.service.call.DiscreteOrderItemRequest;

import com.enclothe.core.dm.order.domain.EncOrderItem;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncMaterial;


	public class EncOrderItemRequest extends AbstractOrderItemRequest {

	    protected EncOrderItem encOrderItem;
	    protected EncMaterial material;
	    protected EncDesign design;
	    protected Measurement measurement;
	    
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
	        setCategory(request.getCategory());
	        setItemAttributes(request.getItemAttributes());
	        setPersonalMessage(request.getPersonalMessage());
	        setProduct(request.getProduct());
	        setQuantity(request.getQuantity());
	        setSku(request.getSku());
	        setOrder(request.getOrder());
	        setSalePriceOverride(request.getSalePriceOverride());
	        setRetailPriceOverride(request.getRetailPriceOverride());
	    }


	    @Override
	    public EncOrderItemRequest clone() {
	    	EncOrderItemRequest returnRequest = new EncOrderItemRequest();
	        copyProperties(returnRequest);
	        returnRequest.setDiscreteOrderItemFeePrices(discreteOrderItemFeePrices);
	        return returnRequest;
	    }
	    public EncMaterial getMaterial() {
			return material;
		}
		public void setMaterial(EncMaterial material) {
			this.material = material;
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

	    public List<DiscreteOrderItemFeePrice> getDiscreteOrderItemFeePrices() {
	        return discreteOrderItemFeePrices;
	    }

	    public void setDiscreteOrderItemFeePrices(
	            List<DiscreteOrderItemFeePrice> discreteOrderItemFeePrices) {
	        this.discreteOrderItemFeePrices = discreteOrderItemFeePrices;
	    }
}
