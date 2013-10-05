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

import com.enclothe.core.dm.order.domain.EncOrderItem;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncMaterial;

public class EncOrderItemRequestDTO extends OrderItemRequestDTO{

	    
    protected EncMaterial material;
    protected EncDesign design;
    protected Measurement measurement;
//    protected EncOrderItem encOrderItem;
//    
//
//	public EncOrderItem getEncOrderItem() {
//		return encOrderItem;
//	}
//
//	public void setEncOrderItem(EncOrderItem encOrderItem) {
//		this.encOrderItem = encOrderItem;
//	}

	public Measurement getMeasurement() {
		return measurement;
	}

	public void setMeasurement(Measurement measurement) {
		this.measurement = measurement;
	}

	EncOrderItemRequestDTO()
    {
    	super();
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
    
    
    
}
