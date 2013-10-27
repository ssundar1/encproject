package com.mycompany.controller.catalog;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.broadleafcommerce.core.catalog.domain.Category;
import org.broadleafcommerce.core.web.catalog.CategoryHandlerMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.enclothe.core.product.domain.EncMaterial;
import com.enclothe.web.catalog.EncCategoryHandlerMapping;

/**
 * This class works in combination with the CategoryHandlerMapping which finds a category based upon
 * the passed in URL.
 */
@Controller("encCategoryController")
public class EncCategoryController extends CategoryController {

	public static final String MATERIAL_VIEW = "catalog/encmaterial";
	public static final String DESIGN_VIEW = "catalog/encdesign";
	public static final String MATERIAL = "Material";
	public static final String DESIGN = "Design";
	
	//Change the view to our new view     
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView m = super.handleRequest(request, response);
        
        Category category = (Category) request.getAttribute(EncCategoryHandlerMapping.CURRENT_CATEGORY_ATTRIBUTE_NAME);
        
        
        if(category.getName().contains(MATERIAL))
        	m.setViewName(MATERIAL_VIEW);
        
        else if(category.getName().contains(DESIGN))
        {
        	m.addObject("material", request.getAttribute("material"));
        	m.setViewName(DESIGN_VIEW);
        }       	
        
        return m;
    }
}
