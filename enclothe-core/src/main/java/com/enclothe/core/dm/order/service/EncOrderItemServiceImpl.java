package com.enclothe.core.dm.order.service;


import javax.annotation.Resource;













import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice;
import org.broadleafcommerce.core.order.service.OrderItemServiceImpl;
import org.broadleafcommerce.core.order.service.type.OrderItemType;
import org.broadleafcommerce.profile.core.service.IdGenerationService;

import com.enclothe.core.common.domain.UserCategory;
import com.enclothe.core.dm.order.dao.EncOrderItemDao;
import com.enclothe.core.dm.order.domain.EncOrderItem;
import com.enclothe.core.dm.order.domain.EncOrderItemStateDetail;
import com.enclothe.core.dm.order.domain.EncOrderItemStates;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;

import org.springframework.stereotype.Service;
@Service("encOrderItemService")
public class EncOrderItemServiceImpl extends OrderItemServiceImpl implements EncOrderItemService{
	
	public static final OrderItemType ENCORDERITEMTYPE = new OrderItemType("com.enclothe.core.dm.order.domain.EncOrderItem", "Enc Order Item");
	 @Resource(name="encOrderItemDao")
	    protected EncOrderItemDao orderItemDao;
	 @Resource(name="blIdGenerationService")
	    protected IdGenerationService idGenerationService;
	protected void populateDiscreteOrderItem(EncOrderItem item, EncOrderItemRequest itemRequest) {     				
		super.populateDiscreteOrderItem(item, itemRequest);
		item.setDesign(itemRequest.getDesign());
		item.setDesignSku(itemRequest.getDesignSku());
		item.setOrderItemState(itemRequest.getOrderItemState());
		 UserCategory userCategory = readUserCategoryById(new Long(2001));
         EncOrderItemStates orderItemState = readOrderItemStatesById(new Long(1001));
         EncOrderItemStateDetail orderItemStateDetail = createOrderItemStateDetailFromId(null);
         orderItemStateDetail.setCurrentOwner(new Long(700));
         orderItemStateDetail.setOrderItem(item);
         orderItemStateDetail.setOrderItemState(orderItemState);
         orderItemStateDetail.setUserCategory(userCategory);
         orderItemStateDetail= saveOrderItemStateDetail(orderItemStateDetail);
         item.setOrderItemState(orderItemState);
         item.setDesign((EncDesign) itemRequest.getDesign());
         item.setDesignSku(itemRequest.getDesignSku());
         
         item.setOrderItemStateDetail(orderItemStateDetail);
         item.setMeasurement(itemRequest.getMeasurement());
       
        
    }

	 public DiscreteOrderItem createDiscreteOrderItem(final EncOrderItemRequest itemRequest) {
	        final EncOrderItem item = (EncOrderItem) orderItemDao.create(ENCORDERITEMTYPE);
	        //final EncOrderItem item = (EncOrderItem) orderItemDao.create();
	       populateDiscreteOrderItem(item, itemRequest);
	        
	       Money matSalePrice = itemRequest.getSku().getSalePrice();
	       Money desSalePrice = itemRequest.getDesignSku().getSalePrice();
	       Money matRetailPrice = itemRequest.getSku().getRetailPrice();
	       Money desRetailPrice = itemRequest.getDesignSku().getRetailPrice();
	        
	       if(matSalePrice !=null)
	        item.setBaseSalePrice(itemRequest.getSalePriceOverride()==null?(matSalePrice.add(desSalePrice)):itemRequest.getSalePriceOverride());
	       
	       if(matRetailPrice != null)
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
	        
	        item.setMeasurement(itemRequest.getMeasurement());
	        item.setPersonalMessage(itemRequest.getPersonalMessage());

	        return item;
	    }

	@Override
	public EncOrderItemStates defaultOrderItemState(Long orderItemStateId) {
		
		return orderItemDao.defaultOrderItemState(orderItemStateId);
	}

	public Long findNextOrderItemStatesId() {
		return idGenerationService.findNextId("com.enclothe.core.dm.order.domain.EncOrderItemStates");
	}
	@Override
	public EncOrderItemStates createOrderItemStatesFromId(Long OrderItemStatesId) {
		EncOrderItemStates orderItemStates = OrderItemStatesId != null ? readOrderItemStatesById(OrderItemStatesId) : null;
        if (orderItemStates == null) {
        	orderItemStates = orderItemDao.create(orderItemStates);
            if (OrderItemStatesId != null) {
            	orderItemStates.setId(OrderItemStatesId);
            } else {
            	orderItemStates.setId(findNextOrderItemStatesId());
            }
        }
        return orderItemStates;
	}
	@Override
	public EncOrderItemStates readOrderItemStatesById(Long OrderItemStatesId) {
		return orderItemDao.readOrderItemStatesById(OrderItemStatesId);
	}
	
	/* orderitem state details */
	
	public Long findNextOrderItemStateDetailId() {
		return idGenerationService.findNextId("com.enclothe.core.dm.order.domain.EncOrderItemStateDetail");
	}
	@Override
	public EncOrderItemStateDetail createOrderItemStateDetailFromId(Long orderItemStateDetailId) {
		EncOrderItemStateDetail orderItemStateDetail = orderItemStateDetailId != null ? readOrderItemStateDetailById(orderItemStateDetailId) : null;
        if (orderItemStateDetail == null) {
        	orderItemStateDetail = orderItemDao.create(orderItemStateDetail);
            if (orderItemStateDetailId != null) {
            	orderItemStateDetail.setId(orderItemStateDetailId);
            } else {
            	orderItemStateDetail.setId(findNextOrderItemStateDetailId());
            }
        }
        return orderItemStateDetail;
	}
	@Override
	public EncOrderItemStateDetail readOrderItemStateDetailById(Long OrderItemStateDetailId) {
		return orderItemDao.readOrderItemStateDetailById(OrderItemStateDetailId);
	}
	
	@Override
	public EncOrderItemStateDetail saveOrderItemStateDetail(EncOrderItemStateDetail OrderItemStateDetail) {
		return orderItemDao.save(OrderItemStateDetail);
	}

	@Override
	public EncOrderItemStates saveOrderItemState(
			EncOrderItemStates OrderItemState) {
		// TODO Auto-generated method stub
		return orderItemDao.save(OrderItemState);
	}
    	
	@Override
	public UserCategory readUserCategoryById(Long userCategoryId) {
		return orderItemDao.readUserCategoryById(userCategoryId);
	}
}
