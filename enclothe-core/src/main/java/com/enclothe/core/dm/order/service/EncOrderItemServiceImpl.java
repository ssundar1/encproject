package com.enclothe.core.dm.order.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;


import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice;
import org.broadleafcommerce.core.order.domain.OrderItemAttribute;
import org.broadleafcommerce.core.order.domain.OrderItemAttributeImpl;
import org.broadleafcommerce.core.order.service.OrderItemServiceImpl;
import org.broadleafcommerce.core.order.service.call.AbstractOrderItemRequest;

import org.broadleafcommerce.core.order.service.type.OrderItemType;

import com.enclothe.core.dm.order.dao.EncOrderItemDao;
import com.enclothe.core.dm.order.domain.EncOrderItem;
import org.springframework.stereotype.Service;
@Service("encOrderItemService")
public class EncOrderItemServiceImpl extends OrderItemServiceImpl implements EncOrderItemService{
	 @Resource(name="encOrderItemDao")
	    protected EncOrderItemDao orderItemDao;
	    
	protected void populateDiscreteOrderItem(EncOrderItem item, EncOrderItemRequest itemRequest) {
       // item.setSku(itemRequest.getSku());
        item.setQuantity(itemRequest.getQuantity());
        item.setCategory(itemRequest.getCategory());
        item.setDesign(itemRequest.getDesign());
        item.setMaterial(itemRequest.getMaterial());
        item.setOrder(itemRequest.getOrder());
        item.setMeasurement(itemRequest.getMeasurement());

        if (itemRequest.getItemAttributes() != null && itemRequest.getItemAttributes().size() > 0) {
            Map<String,OrderItemAttribute> orderItemAttributes = new HashMap<String,OrderItemAttribute>();
            item.setOrderItemAttributes(orderItemAttributes);
            
            for (String key : itemRequest.getItemAttributes().keySet()) {
                String value = itemRequest.getItemAttributes().get(key);
                OrderItemAttribute attribute = new OrderItemAttributeImpl();
                attribute.setName(key);
                attribute.setValue(value);
                attribute.setOrderItem(item);
                orderItemAttributes.put(key, attribute);
            }
        }
    }

	 public DiscreteOrderItem createDiscreteOrderItem(final EncOrderItemRequest itemRequest) {
	        //final EncOrderItem item = (EncOrderItem) orderItemDao.create(OrderItemType.DISCRETE);
	        final EncOrderItem item = (EncOrderItem) orderItemDao.create();
	        populateDiscreteOrderItem(item, itemRequest);
	        
	       
	        item.setBaseSalePrice(itemRequest.getSalePriceOverride()==null?itemRequest.getSku().getSalePrice():itemRequest.getSalePriceOverride());
	        item.setBaseRetailPrice(itemRequest.getSku().getRetailPrice());
	        item.setDiscreteOrderItemFeePrices(itemRequest.getDiscreteOrderItemFeePrices());

	        if (itemRequest.getSalePriceOverride() != null) {
	            item.setSalePriceOverride(Boolean.TRUE);
	            item.setSalePrice(itemRequest.getSalePriceOverride());
	            item.setBaseSalePrice(itemRequest.getSalePriceOverride());
	        }

	        if (itemRequest.getRetailPriceOverride() != null) {
	            item.setRetailPriceOverride(Boolean.TRUE);
	            item.setRetailPrice(itemRequest.getRetailPriceOverride());
	            item.setBaseRetailPrice(itemRequest.getRetailPriceOverride());
	        }

	        for (DiscreteOrderItemFeePrice feePrice : item.getDiscreteOrderItemFeePrices()) {
	            feePrice.setDiscreteOrderItem(item);
	        }
	        
	        item.setPersonalMessage(itemRequest.getPersonalMessage());

	        return item;
	    }

	    public DiscreteOrderItem createDiscreteOrderItem(final AbstractOrderItemRequest itemRequest) {
	        final DiscreteOrderItem item = (DiscreteOrderItem) orderItemDao.create(OrderItemType.DISCRETE);
	        populateDiscreteOrderItem(item, itemRequest);
	        item.setBaseSalePrice(itemRequest.getSku().getSalePrice());
	        item.setBaseRetailPrice(itemRequest.getSku().getRetailPrice());
	        
	        item.updateSaleAndRetailPrices();

	        item.assignFinalPrice();
	        item.setPersonalMessage(itemRequest.getPersonalMessage());

	        return item;
	    }
	
}
