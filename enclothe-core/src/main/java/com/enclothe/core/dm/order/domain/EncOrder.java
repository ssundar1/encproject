package com.enclothe.core.dm.order.domain;

import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.profile.core.domain.Address;


public interface EncOrder extends Order {

    public Address getAddress();

    public void setAddress(Address address);

    public String getRawResponse();
    
    public void setRawResponse(String resp);
}
