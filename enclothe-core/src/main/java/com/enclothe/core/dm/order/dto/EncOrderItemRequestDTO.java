package com.enclothe.core.dm.order.dto;

//import java.util.HashMap;
//import java.util.Map;
//
//import org.broadleafcommerce.common.money.Money;
//import org.broadleafcommerce.core.catalog.domain.Category;
//import org.broadleafcommerce.core.catalog.domain.ProductBundle;
//import org.broadleafcommerce.core.catalog.domain.Sku;
//import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.call.OrderItemRequestDTO;
import org.broadleafcommerce.core.order.service.call.ProductBundleOrderItemRequest;
import org.broadleafcommerce.core.web.order.model.AddToCartItem;

import com.enclothe.core.dm.order.domain.EncOrderItem;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncMaterial;

public class EncOrderItemRequestDTO extends AddToCartItem{

	    
   // protected EncMaterial material;
    protected Long designId;
    protected Long measurementId;
    protected Long designSkuId;

	public Long getDesignSkuId() {
		return designSkuId;
	}

	public void setDesignSkuId(Long designSkuId) {
		this.designSkuId = designSkuId;
	}

	EncOrderItemRequestDTO()
    {
    	super();
    }

	public Long getDesignId() {
		return designId;
	}

	public void setDesignId(Long designId) {
		this.designId = designId;
	}

	public Long getMeasurementId() {
		return measurementId;
	}

	public void setMeasurementId(Long measurementId) {
		this.measurementId = measurementId;
	}

	@Override
	public String toString() {
		return "EncOrderItemRequestDTO [designId=" + designId
				+ ", measurementId=" + measurementId + ", getSkuId()="
				+ getSkuId() + ", getCategoryId()=" + getCategoryId()
				+ ", getProductId()=" + getProductId() + ", getQuantity()="
				+ getQuantity() + ", getItemAttributes()="
				+ getItemAttributes() + ", getOrderItemId()="
				+ getOrderItemId() + ", getOverrideSalePrice()="
				+ getOverrideSalePrice() + ", getOverrideRetailPrice()="
				+ getOverrideRetailPrice() + "]";
	}
    
//    public EncMaterial getMaterial() {
//		return material;
//	}
//	public void setMaterial(EncMaterial material) {
//		this.material = material;
//	}
	
	
    
    
}
