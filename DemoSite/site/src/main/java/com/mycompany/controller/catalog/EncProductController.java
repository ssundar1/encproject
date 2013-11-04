/*
 * Copyright 2008-2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.mycompany.controller.catalog;

import org.broadleafcommerce.core.catalog.domain.Category;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.web.catalog.ProductHandlerMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.enclothe.core.product.domain.EncMaterial;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * This class works in combination with the CategoryHandlerMapping which finds a category based upon
 * the passed in URL.
 */
@Controller("encProductController")
public class EncProductController extends ProductController {
    
	@Resource(name = "blCatalogService")
	protected CatalogService catalogService;
	  
    protected static final String MATERIAL_VIEW = "catalog/material";
    protected static final String DESIGN_VIEW = "catalog/design";
	public static final String MATERIAL = "Material";
	public static final String DESIGN = "Design";
	
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	ModelAndView m = super.handleRequest(request, response);
    	
    	Product product = (Product) request.getAttribute(ProductHandlerMapping.CURRENT_PRODUCT_ATTRIBUTE_NAME);
    	
    	Category category = product.getDefaultCategory();
        if(category.getName().contains(MATERIAL))
        	m.setViewName(MATERIAL_VIEW);
        
        else if(category.getName().contains(DESIGN))
        {
        	Long materialId = Long.parseLong(request.getParameter("materialId"));
        	EncMaterial material = (EncMaterial) catalogService.findProductById(materialId);
        	m.addObject("material", material);
        	m.setViewName(DESIGN_VIEW);
        }       	
    	    	
    	return m;
    }

}
