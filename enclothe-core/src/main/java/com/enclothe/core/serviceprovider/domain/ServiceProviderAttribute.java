package com.enclothe.core.serviceprovider.domain;

import org.broadleafcommerce.common.value.Searchable;

public interface ServiceProviderAttribute extends Searchable<String>{

	Long getId();
	
	void setId(Long id);
	
	ServiceProvider getServiceProvider();
	
	void setServiceProvider(ServiceProvider sp);
		
}
