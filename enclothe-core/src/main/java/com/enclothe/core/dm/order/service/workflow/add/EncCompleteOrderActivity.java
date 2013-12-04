package com.enclothe.core.dm.order.service.workflow.add;

import java.util.List;

import javax.annotation.Resource;

import org.broadleafcommerce.core.checkout.service.workflow.CheckoutContext;
import org.broadleafcommerce.core.checkout.service.workflow.CheckoutSeed;
import org.broadleafcommerce.core.checkout.service.workflow.CompleteOrderActivity;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderItem;
import com.enclothe.core.dm.order.domain.EncOrderItem;
import com.enclothe.core.dm.order.domain.EncOrderItemStateDetail;
import com.enclothe.core.dm.order.domain.EncOrderItemStates;
import com.enclothe.core.dm.order.service.EncOrderItemService;

public class EncCompleteOrderActivity extends CompleteOrderActivity{
    
    @Resource(name = "blEncOrderItemService")
    protected EncOrderItemService orderItemService;
    
    @Override
    public CheckoutContext execute(CheckoutContext context) throws Exception {
    	super.execute(context);
        CheckoutSeed seed = context.getSeedData();

        Order encOrder = seed.getOrder();
        List<OrderItem> encOrderItems = encOrder.getOrderItems();
        
        //For each Order Item add a state detail
        for (OrderItem orderItem: encOrderItems)
        {
        	//Retrieve Submitted State
        	EncOrderItemStates state = 
        			orderItemService.readOrderItemStatesById(EncOrderItemStates.SUBMITTED);
        	
        	//create order item state detail and save
        	EncOrderItem encOrderItem = (EncOrderItem) orderItem;
        	EncOrderItemStateDetail orderItemStateDetail = 
        			orderItemService.createOrderItemStateDetailFromId(null);
        	orderItemStateDetail.setOrderItem(encOrderItem);
        	orderItemStateDetail.setOrderItemState(state);
        	//stateDetail.setCurrentOwner(paramLong);
        	
        	orderItemService.saveOrderItemStateDetail(orderItemStateDetail);       	        
        }
        return context;
    }
}
