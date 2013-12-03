package com.enclothe.core.product.domain;

import org.broadleafcommerce.core.catalog.domain.Product;

import com.enclothe.core.serviceprovider.domain.ServiceProvider;

public interface EncDesign extends Product {

	public String getType() ;

	public void setType(String type);
	
	public ServiceProvider getServiceProvider() ;
	

	public void setServiceProvider(ServiceProvider serviceProvider) ;
	

	
}
