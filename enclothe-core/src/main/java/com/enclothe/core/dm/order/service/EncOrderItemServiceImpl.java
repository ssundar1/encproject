package com.enclothe.core.dm.order.service;


import javax.annotation.Resource;



import org.broadleafcommerce.common.money.Money;
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
	
	public static final OrderItemType ENCORDERITEMTYPE = new OrderItemType("com.enclothe.core.dm.order.domain.EncOrderItem", "Enc Order Item");
	 @Resource(name="encOrderItemDao")
	    protected EncOrderItemDao orderItemDao;
	    
	protected void populateDiscreteOrderItem(EncOrderItem item, EncOrderItemRequest itemRequest) {     				
		super.populateDiscreteOrderItem(item, itemRequest);
		item.setDesign(itemRequest.getDesign());
		item.setDesignSku(itemRequest.getDesignSku());
    }

	 public DiscreteOrderItem createDiscreteOrderItem(final EncOrderItemRequest itemRequest) {
	        final EncOrderItem item = (EncOrderItem) orderItemDao.create(ENCORDERITEMTYPE);
	        //final EncOrderItem item = (EncOrderItem) orderItemDao.create();
	       populateDiscreteOrderItem(item, itemRequest);
	        
	       Money matMoney = itemRequest.getSku().getSalePrice();
	       Money desMoney = itemRequest.getDesignSku().getSalePrice();
	       Money matRetailPrice = itemRequest.getSku().getRetailPrice();
	       Money desRetailPrice = itemRequest.getDesignSku().getRetailPrice();
	        
	        item.setBaseSalePrice(itemRequest.getSalePriceOverride()==null?(matMoney.add(desMoney)):itemRequest.getSalePriceOverride());
	        item.setBaseRetailPrice(matRetailPrice.add(desRetailPrice));
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


	
}
