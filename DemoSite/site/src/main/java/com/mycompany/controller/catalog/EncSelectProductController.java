package com.mycompany.controller.catalog;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.stereotype.Controller;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncMaterial;
import com.enclothe.core.customer.domain.EncCustomer;
import com.enclothe.core.dm.order.dto.EncOrderItemRequestDTO;

/**
 * This class works in combination with the CategoryHandlerMapping which finds a category based upon
 * the passed in URL.
 */
@Controller("encSelectProductController")
public class EncSelectProductController{

	public static final String BLOUSE_DESIGN_VIEW = "/bls-design";
	public static final String CHUDI_DESIGN_VIEW = "/chud-design";
	public static final String MEASUREMENT_VIEW = "catalog/measurement";
	public static final String BLOUSE = "blouse";
	public static final String CHUD = "chud";
	public static final String ORDER_ITEM_REQUEST = "orderItemRequest";
	
    @Resource(name = "blCatalogService")
    protected CatalogService catalogService;
    
    //This method redirects to design once the material is selected
    @RequestMapping("/selectmaterial")
    public String selectMaterial(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addToCartItem") EncOrderItemRequestDTO addToCartItem) {
    	
    	
    	EncMaterial material = (EncMaterial) catalogService.findProductById(addToCartItem.getProductId());
    	String view = BLOUSE_DESIGN_VIEW; // by default
    	
    	if(material!= null && material.getType().equals(CHUD))
    		view = CHUDI_DESIGN_VIEW;
    	
    	request.setAttribute("material", material);
    	
        return "forward:" + view ;
    }
    
    //This method redirects to design once the material is selected
    @RequestMapping("/choosedesignwomaterial")
    public String chooseDesign(HttpServletRequest request, HttpServletResponse response, Model model) {
    	
    	
    	EncMaterial material = (EncMaterial) catalogService.findProductById((long) 10);
    	String view = BLOUSE_DESIGN_VIEW; // by default
    	
    	if(material!= null && material.getType().equals(CHUD))
    		view = CHUDI_DESIGN_VIEW;
    	
    	request.setAttribute("material", material);
    	
        return "forward:" + view ;
    }    
    
    @RequestMapping("/selectdesign")
    public ModelAndView selectDesign(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addToCartItem") EncOrderItemRequestDTO addToCartItem) {
    	
    	ModelAndView m = new ModelAndView();
    	EncMaterial material = (EncMaterial) catalogService.findProductById(addToCartItem.getProductId());
    	EncDesign design = (EncDesign) catalogService.findProductById(addToCartItem.getDesignId());
    	EncCustomer customer = (EncCustomer) CustomerState.getCustomer(request);
    	
    	Collection<Measurement> customerMeasurements = customer.getCustomerMeasurements().values();
    	m.addObject("material", material);
    	m.addObject("design", design);
    	m.addObject("custMeasurements", customerMeasurements);
    	
    	
    	m.setViewName(MEASUREMENT_VIEW);
        return m;
    }    
}
