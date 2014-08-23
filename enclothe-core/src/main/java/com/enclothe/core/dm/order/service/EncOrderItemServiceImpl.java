package com.enclothe.core.dm.order.service;


import javax.annotation.Resource;















import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice;
import org.broadleafcommerce.core.order.service.OrderItemServiceImpl;
import org.broadleafcommerce.core.order.service.type.OrderItemType;
import org.broadleafcommerce.profile.core.service.IdGenerationService;

import com.enclothe.core.common.domain.UserCategory;
import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.dm.order.dao.EncOrderItemDao;
import com.enclothe.core.dm.order.domain.EncOrderItem;
import com.enclothe.core.dm.order.domain.EncOrderItemStateDetail;
import com.enclothe.core.dm.order.domain.EncOrderItemStates;
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
        item.setDesigns(itemRequest.getDesigns());
        item.setDesignSkus(itemRequest.getDesignSkus());
        item.setTailor(itemRequest.getTailor());
        item.setMeasurement(itemRequest.getMeasurement());        
    }

	 public DiscreteOrderItem createDiscreteOrderItem(final EncOrderItemRequest itemRequest) {
	        final EncOrderItem item = (EncOrderItem) orderItemDao.create(ENCORDERITEMTYPE);
	        //final EncOrderItem item = (EncOrderItem) orderItemDao.create();
	       populateDiscreteOrderItem(item, itemRequest);
	        
           item.setBundleOrderItem(itemRequest.getBundleOrderItem());
	       item.setBaseSalePrice(itemRequest.getSalePriceOverride()==null?
	        		itemRequest.getSalePrice():itemRequest.getSalePriceOverride());
	       item.setBaseRetailPrice(itemRequest.getRetailPrice());
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
	
	@Override
	public Dispute getDisputeIdByOrderItemId(Long encOrderItemId) {
		return orderItemDao.getDisputeIdByOrderItemId(encOrderItemId);
	}
}
