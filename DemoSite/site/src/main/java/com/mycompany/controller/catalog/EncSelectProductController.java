package com.mycompany.controller.catalog;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncMaterial;
import com.enclothe.core.product.domain.EncTailor;
import com.enclothe.core.customer.domain.EncCustomer;
import com.enclothe.core.dm.order.domain.EncOrderItemDTO;
import com.enclothe.core.dm.order.dto.EncOrderItemRequestDTO;
import com.enclothe.core.dm.order.service.EncOrderItemDTOService;

/**
 * This class works in combination with the CategoryHandlerMapping which finds a category based upon
 * the passed in URL.
 */
@Controller("encSelectProductController")
public class EncSelectProductController{

	public static final String DESIGN_VIEW = "/design";
	public static final String BLOUSE_DESIGN_VIEW = "/bls-design";
	public static final String CHUDI_DESIGN_VIEW = "/chud-design";
	public static final String MEASUREMENT_VIEW = "catalog/measurement";
	public static final String ERROR_MATERIAL_VIEW = "catalog/materialerror";
	public static final String BLOUSE = "blouse";
	public static final String CHUD = "chud";
	public static final String ORDER_ITEM_REQUEST = "orderItemRequest";
	
    @Resource(name = "blCatalogService")
    protected CatalogService catalogService;
    
    @Resource(name = "encOrderItemDTOService")
    protected EncOrderItemDTOService encOrderItemDTOService;
    
    //This method redirects to design once the material is selected
    @RequestMapping("/selectmaterial")
    public String selectMaterial(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addToCartItem") EncOrderItemRequestDTO addToCartItem) {
    	
    	//Retrieve Customer Information
    	String sessionId = request.getSession().getId();
    	String ipAddress = request.getRemoteAddr();
       	EncCustomer customer = (EncCustomer) CustomerState.getCustomer(request);
    	
       	//Retrieve Material
    	EncMaterial material = (EncMaterial) catalogService.findProductById(addToCartItem.getProductId());
    	
    	//Store Material to DTO
    	EncOrderItemDTO itemDTO = encOrderItemDTOService.createEncOrderItemDTO();
    	itemDTO.setSessionId(sessionId);
    	itemDTO.setIpAddress(ipAddress);
    	itemDTO.setCustomerId(customer.getId());
    	itemDTO.setMaterial(material);
    	itemDTO.setCreationDate(Calendar.getInstance().getTime());
    	encOrderItemDTOService.save(itemDTO);
    	
    	String view = BLOUSE_DESIGN_VIEW; // by default
    	
    	if(material!= null && material.getType().equals(CHUD))
    		view = CHUDI_DESIGN_VIEW;
    	
        return "forward:" + view ;
    }
    
    //This method redirects to design once the material is selected
    @RequestMapping("/choosedesignwomaterial")
    public String chooseDesign(HttpServletRequest request, HttpServletResponse response, Model model) {    	
       return "forward:" + DESIGN_VIEW ;
    }    
    
    @RequestMapping(value = "/adddesignbck", produces = "application/json")
    public @ResponseBody Map<String, Object> addDesignAndBack(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addToCartItem") EncOrderItemRequestDTO addToCartItem, Long designId)
    		{
    	
    			Map m = addDesignOptions(request,response,model,addToCartItem,designId);
    			m.put("back", "true");
    			
    			return m;
    		}
    
    @RequestMapping(value = "/adddesign", produces = "application/json")
    public @ResponseBody Map<String, Object> addDesignOptions(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addToCartItem") EncOrderItemRequestDTO addToCartItem, Long designId)
    {
    	Map<String, Object> responseMap = new HashMap<String, Object>();
    	//
    	//Retrieve Item DTO Selected
    	EncOrderItemDTO itemDTO = encOrderItemDTOService.retrieveItemDTO(request);

        String view = BLOUSE_DESIGN_VIEW; // by default
    	
    	//if(material!= null && material.getType().equals(CHUD))
    		//view = CHUDI_DESIGN_VIEW;
        
    	if(itemDTO == null)
    	{
    		//return "false";
    		return responseMap;
    	}
    	
    	//Add design to DTO. Retrieve designs already in DTO
    	List<EncDesign> designs = itemDTO.getDesigns();
    	if(designs == null)
    		designs = new ArrayList<EncDesign>();
    	
    	EncDesign design = (EncDesign) catalogService.findProductById(designId);
    	responseMap.put("productId", designId);
    	responseMap.put("productName", design.getName());
    	for(int i=0; i < designs.size(); i++)
    	{
    		EncDesign e = designs.get(i);
    		
    		//if design already exists, then just return success
    		if(e.getId().equals(designId))
    			return responseMap;
    			//return "true";
    		
    		//retrieve category, if same category exists replace category
    		String category = e.getCategory();
    		
    		if(category.equals(design.getCategory()))
    		{
    			designs.set(i, design);
    			encOrderItemDTOService.save(itemDTO);
    			return responseMap;
    			//return "true";
    		}    		    			
    	}
    	designs.add(design);
    	
    	encOrderItemDTOService.save(itemDTO);    	
    	
    	//return "true";
        //return "forward:" + view ;
    	return responseMap;
    }
        
    @RequestMapping(value = "/addtailor", produces = "application/json")
    public @ResponseBody Map<String, Object> addTailor(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addToCartItem") EncOrderItemRequestDTO addToCartItem, Long tailorId) {
    	
    	Map<String, Object> responseMap = new HashMap<String, Object>();
    	
    	//Retrieve Item DTO Selected
    	EncOrderItemDTO itemDTO = encOrderItemDTOService.retrieveItemDTO(request);
    	
    	if(itemDTO == null)
    	{
    		return responseMap;
    	}
    	
    	//Add design to DTO. Retrieve designs already in DTO
    	EncTailor tailor = (EncTailor) catalogService.findProductById(tailorId);    	
    	itemDTO.setTailor(tailor);
    	
    	responseMap.put("productId", tailorId);
    	responseMap.put("productName", tailor.getName());
    	
    	encOrderItemDTOService.save(itemDTO);
    	//EncCustomer customer = (EncCustomer) CustomerState.getCustomer(request);
    	
/*    	//Retrieve Measurements
    	Collection<Measurement> customerMeasurements = customer.getCustomerMeasurements().values();
    	m.addObject("material", itemDTO.getMaterial());
    	m.addObject("custMeasurements", customerMeasurements);
    	m.setViewName(MEASUREMENT_VIEW);*/
    	return responseMap;
    }    
    
   /* @RequestMapping("/selectdesign")
    public ModelAndView selectDesign(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addToCartItem") EncOrderItemRequestDTO addToCartItem) {
    	
    	ModelAndView m = new ModelAndView();
    	
    	//Retrieve Item DTO Selected
    	EncOrderItemDTO itemDTO = encOrderItemDTOService.retrieveItemDTO(request);
    	
    	if(itemDTO == null)
    	{
    		m.setViewName(ERROR_MATERIAL_VIEW);
    	}
    	
    	//Add design to DTO
    	EncDesign design = (EncDesign) catalogService.findProductById(addToCartItem.getDesignId());
    	itemDTO.setDesign(design);
    	encOrderItemDTOService.save(itemDTO);
    	EncCustomer customer = (EncCustomer) CustomerState.getCustomer(request);
    	
    	//Retrieve Measurements
    	Collection<Measurement> customerMeasurements = customer.getCustomerMeasurements().values();
    	m.addObject("material", itemDTO.getMaterial());
    	m.addObject("design", itemDTO.getDesign());
    	m.addObject("custMeasurements", customerMeasurements);
    	m.setViewName(MEASUREMENT_VIEW);
        return m;
    }    */
}
