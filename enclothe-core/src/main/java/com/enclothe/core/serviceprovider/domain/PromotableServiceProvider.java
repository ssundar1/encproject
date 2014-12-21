package com.enclothe.core.serviceprovider.domain;

import java.util.List;

public interface PromotableServiceProvider {

	List<ServiceProvider> getRelatedServiceProviders();
	
	String getPromotionMessage();
}
