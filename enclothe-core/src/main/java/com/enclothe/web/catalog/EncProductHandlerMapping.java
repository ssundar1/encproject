package com.enclothe.web.catalog;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.broadleafcommerce.common.web.BroadleafRequestContext;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.web.catalog.ProductHandlerMapping;

public class EncProductHandlerMapping extends ProductHandlerMapping {

	   private String newControllerName="encProductController";
	    
	    @Resource(name = "blCatalogService")
	    private CatalogService catalogService;
	    	   

	    @Override
	    protected Object getHandlerInternal(HttpServletRequest request) throws Exception {
	        BroadleafRequestContext context = BroadleafRequestContext.getBroadleafRequestContext();
	        if (context != null && context.getRequestURIWithoutContext() != null) {
	            Product product = catalogService.findProductByURI(context.getRequestURIWithoutContext());
	            if (product != null) {
	                context.getRequest().setAttribute(CURRENT_PRODUCT_ATTRIBUTE_NAME, product);
	                return newControllerName;
	            }
	        }
	        return null;
	    }
	
}
