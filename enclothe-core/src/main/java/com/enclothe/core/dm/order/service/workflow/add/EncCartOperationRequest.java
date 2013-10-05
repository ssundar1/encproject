package com.enclothe.core.dm.order.service.workflow.add;

import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.workflow.CartOperationRequest;

import com.enclothe.core.dm.order.dto.EncOrderItemRequestDTO;


public class EncCartOperationRequest extends CartOperationRequest{
	 protected EncOrderItemRequestDTO itemRequest;
	    
	    
	public EncCartOperationRequest(Order order,
			EncOrderItemRequestDTO itemRequest, boolean priceOrder) {
		super(order, itemRequest, priceOrder);
		// TODO Auto-generated constructor stub
	}

	
	 public EncOrderItemRequestDTO getItemRequest() {
		 if(this.itemRequest==null)
			 return (EncOrderItemRequestDTO) super.itemRequest;
	        return itemRequest;
	    }

	    public void setItemRequest(EncOrderItemRequestDTO itemRequest) {
	    	 super.itemRequest=itemRequest;
	    	this.itemRequest = itemRequest;
	       
	    }

	
}
