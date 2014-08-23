package com.enclothe.core.product.domain;

import org.broadleafcommerce.core.catalog.domain.Product;

import com.enclothe.core.serviceprovider.domain.ServiceProvider;

public interface EncDesign extends Product {

	//Determine whether its for Chudidhar or Blouse
	public String getType() ;

	public void setType(String type);
	
	public ServiceProvider getServiceProvider() ;
	

	public void setServiceProvider(ServiceProvider serviceProvider) ;
	
	//Determine whether its for Front Neck or Back Neck or Sleevedesign
	public String getCategory() ;

	public void setCategory(String category) ;
	
}
