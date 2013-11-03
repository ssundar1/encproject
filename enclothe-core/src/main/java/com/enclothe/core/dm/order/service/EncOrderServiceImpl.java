package com.enclothe.core.dm.order.service;

import javax.annotation.Resource;

import org.broadleafcommerce.core.order.domain.BundleOrderItem;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderItem;
import org.broadleafcommerce.core.order.service.OrderItemService;
import org.broadleafcommerce.core.order.service.OrderServiceImpl;
import org.broadleafcommerce.core.order.service.call.OrderItemRequestDTO;
import org.springframework.stereotype.Service;

import com.enclothe.core.dm.order.domain.EncOrderItemImpl;
import com.enclothe.core.product.domain.EncMaterial;

@Service("encOrderService")
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
                
                if (itemMatches(discreteItem.getSku(), discreteItem.getProduct(), discreteItem.getOrderItemAttributes(),
                        itemToFind)) {
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
}
