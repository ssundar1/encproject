package com.enclothe.core.product.domain;

import org.broadleafcommerce.core.catalog.domain.Product;

public interface EncMaterial extends Product {
	
	// Type specifies if it is for blouse or chudidhar 
	public String getType() ;

	public void setType(String type);
}
