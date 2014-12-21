package com.enclothe.core.serviceprovider.domain;

import java.util.List;

public interface FeaturedServiceProvider extends PromotableServiceProvider {
 
    Long getId(); 

    void setId(Long id);

    ServiceProvider getServiceProvider();
    
    void setServiceProvider(ServiceProvider sp);
    
    void setSequence(Long sequence);
    
    Long getSequence();

    String getPromotionMessage();

    void setPromotionMessage(String promotionMessage);
    
    List<ServiceProvider> getRelatedServiceProviders();
}
