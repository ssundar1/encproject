package com.enclothe.core.dm.order.dto;

import java.util.List;
import java.util.Set;

import org.broadleafcommerce.core.web.order.model.AddToCartItem;

public class EncOrderItemRequestDTO extends AddToCartItem{

	    
    protected Long material;
    protected List<Long> designs;
    protected List<Long> designSkus;
    protected Long tailor;
    protected Long tailorSku;
    protected Long measurementId;

	public Long getMaterial() {
		return material;
	}

	public void setMaterial(Long material) {
		this.material = material;
	}


	public List<Long> getDesigns() {
		return designs;
	}


	public void setDesigns(List<Long> designs) {
		this.designs = designs;
	}


	public List<Long> getDesignSkus() {
		return designSkus;
	}


	public void setDesignSkus(List<Long> designSkus) {
		this.designSkus = designSkus;
	}


	public Long getTailor() {
		return tailor;
	}


	public void setTailor(Long tailor) {
		this.tailor = tailor;
	}


	public Long getTailorSku() {
		return tailorSku;
	}


	public void setTailorSku(Long tailorSku) {
		this.tailorSku = tailorSku;
	}


	public Long getMeasurementId() {
		return measurementId;
	}

	public void setMeasurementId(Long measurementId) {
		this.measurementId = measurementId;
	}

	
}
