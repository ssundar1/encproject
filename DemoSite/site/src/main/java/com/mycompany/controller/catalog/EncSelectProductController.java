package com.mycompany.controller.catalog;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.stereotype.Controller;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.springframework.web.bind.annotation.RequestMapping;
import com.enclothe.core.product.domain.EncMaterial;
import com.enclothe.core.dm.order.dto.EncOrderItemRequestDTO;

/**
 * This class works in combination with the CategoryHandlerMapping which finds a category based upon
 * the passed in URL.
 */
@Controller("encSelectProductController")
public class EncSelectProductController{

	public static final String BLOUSE_DESIGN_VIEW = "/bls-design";
	public static final String CHUDI_DESIGN_VIEW = "/chud-design";
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
}
