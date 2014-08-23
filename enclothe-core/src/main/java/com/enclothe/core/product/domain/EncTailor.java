package com.enclothe.core.product.domain;

import org.broadleafcommerce.core.catalog.domain.Product;

import com.enclothe.core.serviceprovider.domain.ServiceProvider;

public interface EncTailor extends Product {

	public ServiceProvider getServiceProvider() ;
	

	public void setServiceProvider(ServiceProvider serviceProvider) ;
	

	
}
