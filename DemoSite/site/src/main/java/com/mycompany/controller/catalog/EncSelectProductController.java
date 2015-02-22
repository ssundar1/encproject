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
import org.broadleafcommerce.core.catalog.domain.Category;
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
import com.enclothe.web.catalog.EncCategoryHandlerMapping;

/**
 * This class works in combination with the CategoryHandlerMapping which finds a category based upon
 * the passed in URL.
 */
@Controller("encSelectProductController")
public class EncSelectProductController{

	public static final String DESIGN_VIEW = "/design";
	public static final String BLOUSE_DESIGN_VIEW = "/bls-design/bls-fn-design";
	public static final String CHUDI_DESIGN_VIEW = "/chud-design/chud-fn-design";
	public static final String MEASUREMENT_VIEW = "catalog/encmeasurement";
	public static final String ERROR_MATERIAL_VIEW = "catalog/materialerror";
	public static final String BLOUSE = "blouse";
	public static final String CHUD = "chud";
	public static final String ORDER_ITEM_REQUEST = "orderItemRequest";
	
    @Resource(name = "blCatalogService")
    protected CatalogService catalogService;
    
    @Resource(name = "encOrderItemDTOService")
    protected EncOrderItemDTOService encOrderItemDTOService;

    @RequestMapping(value = "/selectmaterialbck", produces = "application/json")
    public @ResponseBody Map<String, Object> selectMaterialBackselectMaterial(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addToCartItem") EncOrderItemRequestDTO addToCartItem)
    		{
    	
    			Map m = selectMaterial(request,response,model,addToCartItem);
    			m.put("back", "true");
    			
    			return m;
    		}

    //This method redirects to design once the material is selected
    @RequestMapping(value = "/selectmaterial", produces = "application/json")
    public @ResponseBody Map<String, Object> selectMaterial(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addToCartItem") EncOrderItemRequestDTO addToCartItem) {
    	
    	EncMaterial material = (EncMaterial) catalogService.findProductById(addToCartItem.getProductId());
    	
    	Map<String, Object> responseMap = new HashMap<String, Object>();
    	responseMap.put("productId", material.getId());
    	responseMap.put("productName", material.getName());

    	//Store Material to DTO    	
    	EncOrderItemDTO itemDTO = null;
    	
    	itemDTO = encOrderItemDTOService.retrieveItemDTO(request);
    	
    	if(itemDTO == null || itemDTO.getStatus() == 5)	
    	{	itemDTO = encOrderItemDTOService.createEncOrderItemDTO();    	
    		itemDTO.setSessionId(request.getSession().getId());
    		itemDTO.setIpAddress(request.getRemoteAddr());
    	}
    	else
    	{
    		itemDTO.setStatus(0);
    		itemDTO.setFnSelectedId(null);
    		itemDTO.setBnSelectedId(null);
    		itemDTO.setSlSelectedId(null);
    		itemDTO.setTlSelectedId(null);
    		itemDTO.setMaterial(null);
    		itemDTO.setDesigns(null);
    		itemDTO.setTailor(null);
    	}
    	
    	EncCustomer customer = (EncCustomer) CustomerState.getCustomer(request);
    	itemDTO.setCustomerId(customer.getId());
    	itemDTO.setCreationDate(Calendar.getInstance().getTime());
    	
    	if(!(itemDTO != null &&  itemDTO.getMaterial()!=null && itemDTO.getMaterial().getId().equals(addToCartItem.getProductId())))
    	{
    		itemDTO.setMaterial(material);   
    		itemDTO.setStatus(1);
    		itemDTO.setMatSelectedId(material.getId());
    		//encOrderItemDTOService.save(itemDTO);
    	}
    	encOrderItemDTOService.save(itemDTO);
        return responseMap;
    }
    
    //This method redirects to design once the material is selected
    @RequestMapping("/choosedesignwomaterial")
    public String chooseDesign(HttpServletRequest request, HttpServletResponse response, Model model) {    	
       return "forward:" + DESIGN_VIEW ;
    }    

    
    @RequestMapping("/measurement")
    public ModelAndView addMeasurement(HttpServletRequest request, HttpServletResponse response) {    	
    	ModelAndView model = new ModelAndView();
    	//EncOrderItemDTO itemDTO = encOrderItemDTOService.retrieveItemDTO(request);

    	model.addObject("status", 5);
    	
    	/*EncCustomer newCustomer = (EncCustomer) CustomerState.getCustomer();
    	if(newCustomer.getPreferredMeasurement() != null){
    		System.out.println(newCustomer.getPreferredMeasurement());
    	}*/
    	model.setViewName(MEASUREMENT_VIEW);
       return model ;
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
    	List<String> itemId = new ArrayList<String>();
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
    	//responseMap.put("itemDTO", itemDTO);
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

    	String category = design.getCategory();
		if(category.contains("Front_Neck_Design")){
			itemDTO.setStatus(2);
			itemDTO.setFnSelectedId(designId);
		}else if ( category.contains("Back_Neck_Design")){
			itemDTO.setStatus(3);
			itemDTO.setBnSelectedId(designId);
		}else if(category.contains("Sleeve_Design")){
			itemDTO.setStatus(4);
			itemDTO.setSlSelectedId(designId);
		}

		
    	//responseMap.put("itemDTO", itemDTO);
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
    	itemDTO.setStatus(5);
    	itemDTO.setTlSelectedId(tailorId);
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
