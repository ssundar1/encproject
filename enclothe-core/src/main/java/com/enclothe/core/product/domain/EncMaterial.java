package com.enclothe.core.product.domain;

import org.broadleafcommerce.core.catalog.domain.Product;

import com.enclothe.core.serviceprovider.domain.ServiceProvider;

public interface EncMaterial extends Product {
	
	// Type specifies if it is for blouse or chudidhar 
	public String getType() ;

	public void setType(String type);
	
	public Boolean getIsDummy();
	
	public void setIsDummy(Boolean isDummy);
	
	public ServiceProvider getServiceProvider() ;

	public void setServiceProvider(ServiceProvider serviceProvider);
	
    
	
}
