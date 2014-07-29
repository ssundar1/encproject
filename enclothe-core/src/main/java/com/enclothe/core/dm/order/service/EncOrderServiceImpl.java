package com.enclothe.core.dm.order.service;

import java.util.Map;

import javax.annotation.Resource;

import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.order.domain.BundleOrderItem;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderItem;
import org.broadleafcommerce.core.order.domain.OrderItemAttribute;
import org.broadleafcommerce.core.order.service.OrderItemService;
import org.broadleafcommerce.core.order.service.OrderServiceImpl;
import org.broadleafcommerce.core.order.service.call.OrderItemRequestDTO;

import com.enclothe.core.dm.order.domain.EncOrderItemImpl;
import com.enclothe.core.dm.order.dto.EncOrderItemRequestDTO;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncMaterial;

public class EncOrderServiceImpl extends OrderServiceImpl{
   
    @Resource(name = "encOrderItemService")
    protected OrderItemService orderItemService;
    
    protected OrderItem findMatchingItem(Order order, OrderItemRequestDTO itemToFind) {
        if (order == null) {
            return null;
        }
        for (OrderItem currentItem : order.getOrderItems()) {
            if (currentItem instanceof DiscreteOrderItem) {
            	EncOrderItemImpl discreteItem = (EncOrderItemImpl) currentItem;
                EncMaterial material = (EncMaterial) discreteItem.getProduct();
            	if(material.getIsDummy())
            		return null;
                            	
                if (itemMatches(discreteItem.getSku(), discreteItem.getProduct(),
                		discreteItem.getDesignSku(), discreteItem.getDesign(),
                		discreteItem.getMeasurement(),
                		discreteItem.getOrderItemAttributes(),
                        (EncOrderItemRequestDTO)itemToFind)) {

                		return discreteItem;
                }
            } else if (currentItem instanceof BundleOrderItem) {
                BundleOrderItem bundleItem = (BundleOrderItem) currentItem;
                if (itemMatches(bundleItem.getSku(), bundleItem.getProduct(), null, itemToFind)) {
                    return bundleItem;
                }
            }
        }
        return null;
    }
       
    protected boolean itemMatches(Sku item1Sku, Product item1Product, Sku item1DesignSku, Product item1Design,
    		Measurement item1Measurement, Map<String, OrderItemAttribute> item1Attributes,
    		EncOrderItemRequestDTO item2) {
        // Must match on SKU and options
        if (item1Sku != null && item2.getSkuId() != null) {
            if (item1Sku.getId().equals(item2.getSkuId())) {
            	
            	if(item1Design.getId().equals(item2.getDesignId()) && item1Measurement.getId().equals(item2.getMeasurementId()))
            		return true;
            	else
            		return false;
            }
        } else {
            if (item1Product != null && item2.getProductId() != null) {
                if (item1Product.getId().equals(item2.getProductId())) {
                	if(item1Design.getId().equals(item2.getDesignId()) && item1Measurement.getId().equals(item2.getMeasurementId()))
                		return compareAttributes(item1Attributes, item2);
                }
            }
        }
        return false;
    }
    
}
