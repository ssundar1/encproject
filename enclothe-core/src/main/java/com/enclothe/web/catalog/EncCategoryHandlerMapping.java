package com.enclothe.web.catalog;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.broadleafcommerce.common.web.BroadleafRequestContext;
import org.broadleafcommerce.core.catalog.domain.Category;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.web.catalog.CategoryHandlerMapping;

public class EncCategoryHandlerMapping extends CategoryHandlerMapping {

	private String newControllerName="encCategoryController";
	   @Resource(name = "blCatalogService")
	    private CatalogService catalogService;
	    
	   public static final String MATERIAL = "material";
	    public static final String CURRENT_CATEGORY_ATTRIBUTE_NAME = "category";

	    @Override
	    protected Object getHandlerInternal(HttpServletRequest request)
	            throws Exception {      
	        BroadleafRequestContext context = BroadleafRequestContext.getBroadleafRequestContext();
	        if (context != null && context.getRequestURIWithoutContext() != null
	        		&& context.getRequestURIWithoutContext().contains(MATERIAL) ) {
	            Category category = catalogService.findCategoryByURI(context.getRequestURIWithoutContext());

	            if (category != null) {
	                context.getRequest().setAttribute(CURRENT_CATEGORY_ATTRIBUTE_NAME, category);
	                return newControllerName;
	            }
	        }
	        else
	        	return super.getHandlerInternal(request);
	        return null;
	    }	
	
}
