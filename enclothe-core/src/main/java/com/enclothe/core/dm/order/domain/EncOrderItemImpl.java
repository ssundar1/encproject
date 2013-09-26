package com.enclothe.core.dm.order.domain;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.MapKey;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.InheritanceType;

import org.broadleafcommerce.common.presentation.AdminPresentationCollection;
import org.broadleafcommerce.common.presentation.AdminPresentationMap;
import org.broadleafcommerce.common.presentation.client.AddMethodType;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.broadleafcommerce.core.order.domain.OrderItemImpl;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_ORDER_ITEM")
public class EncOrderItemImpl extends OrderItemImpl implements EncOrderItem {

	private static final long serialVersionUID = 6545097668293683751L;
	
	
	@OneToOne( targetEntity = EncOrderItemStates.class, optional=false)
    @JoinColumn(name = "ORDER_ITEM_STATE_ID")
    @AdminPresentationCollection(friendlyName = "EncOrderItemImpl_state", order = 10,
    addType = AddMethodType.PERSIST,
    tab = Presentation.Tab.Name.Advanced, tabOrder = Presentation.Tab.Order.Advanced)    
   
   protected EncOrderItemStates orderItemState ;
	
	@OneToOne( mappedBy = "orderItem",targetEntity = EncOrderItemStateDetailImpl.class, optional=false)
    @AdminPresentationCollection(friendlyName = "EncOrderItemImpl_state_detail", order = 20,
    addType = AddMethodType.PERSIST,
    tab = Presentation.Tab.Name.Advanced, tabOrder = Presentation.Tab.Order.Advanced)  
	protected EncOrderItemStateDetail orderItemStateDetail ;
	 public static class Presentation {

	        public static class Tab {

	            public static class Name {

	                public static final String Contact = "EncOrderItemImpl_Contact_Tab";
	                public static final String Advanced = "EncOrderItemImpl_Advanced_Tab";
	            }

	            public static class Order {

	                public static final int Contact = 2000;
	                public static final int Advanced = 3000;
	            }
	        }
	    }    
		
	 
}
