package com.mycompany.controller.catalog;

import java.io.Console;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.apache.commons.lang.StringUtils;
import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.core.catalog.domain.Category;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.search.domain.ProductSearchCriteria;
import org.broadleafcommerce.core.search.domain.ProductSearchResult;
import org.broadleafcommerce.core.search.domain.SearchFacetDTO;
import org.broadleafcommerce.core.web.catalog.CategoryHandlerMapping;
import org.broadleafcommerce.core.web.util.ProcessorUtils;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.enclothe.core.customer.domain.EncCustomer;
import com.enclothe.core.dm.order.domain.EncOrderItemDTO;
import com.enclothe.core.dm.order.service.EncOrderItemDTOService;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncMaterial;
import com.enclothe.web.catalog.EncCategoryHandlerMapping;

/**
 * This class works in combination with the CategoryHandlerMapping which finds a category based upon
 * the passed in URL.
 */
@Controller("encCategoryController")
public class EncCategoryController extends CategoryController {

	private static final String MATERIAL_VIEW = "catalog/encmaterial";
	private static final String FN_DESIGN_VIEW = "catalog/encdesignfn";
	private static final String BN_DESIGN_VIEW = "catalog/encdesignbn";
	private static final String SL_DESIGN_VIEW = "catalog/encdesignsl";
	private static final String TAILOR_VIEW = "catalog/enctailor";
	private static final String MATERIAL = "material";
	private static final String DESIGN = "design";
	private static final String TAILOR = "tailor";
	private static final String BLOUSE = "blouse";
	private static final String CHUD = "chud";
	private static final String FRONT_NECK_DESIGN_CAT_NAME = "Front_Neck_Design";
	private static final String BACK_NECK_DESIGN_CAT_NAME = "Back_Neck_Design";
	private static final String SLEEVE_DESIGN_CAT_NAME = "Sleeve_Design";
//	private static final String TAILOR_CAT_NAME = "Tailor";
	private static final Long PICKUP_MATERIAL = 10l;
	
    @Resource(name="blCatalogService")
    protected CatalogService catalogService;
    
    @Resource(name = "encOrderItemDTOService")
    protected EncOrderItemDTOService encOrderItemDTOService;
	
	//Change the view to our new view     
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView m = handleRequestBase(request, response);
        
        Category category = (Category) request.getAttribute(EncCategoryHandlerMapping.CURRENT_CATEGORY_ATTRIBUTE_NAME);
        if(category.getName().toLowerCase().contains(MATERIAL))
        {
        	if(category.getName().toLowerCase().contains(BLOUSE))        		
        		m.addObject("type", BLOUSE);
        	else
        		m.addObject("type", CHUD);
        	
        	//Store Material to DTO    	
        	EncOrderItemDTO itemDTO = null;
        	
        	itemDTO = encOrderItemDTOService.retrieveItemDTO(request);
        	if(!(itemDTO == null || itemDTO.getStatus() > 1)){
        		m.addObject("status", itemDTO.getStatus());
        		m.addObject("prodselid", itemDTO.getMatSelectedId());
        	}else{
        		m.addObject("status", 0);
        	}
            
        	m.setViewName(MATERIAL_VIEW);
        }
        
        else if(category.getName().toLowerCase().contains(DESIGN))
        {
        	//m.addObject("material", request.getAttribute("material"));
        	
        	String catg = category.getName();
        	
        	/*//Store Material to DTO
        	EncOrderItemDTO itemDTO = encOrderItemDTOService.retrieveItemDTO(request);
        	Long encM =  itemDTO.getMaterial().getId();*/
        	
        	if(catg.contains(FRONT_NECK_DESIGN_CAT_NAME))
        		m.setViewName(FN_DESIGN_VIEW);
        	else if(catg.contains(BACK_NECK_DESIGN_CAT_NAME))
        		m.setViewName(BN_DESIGN_VIEW);
        	else if(catg.contains(SLEEVE_DESIGN_CAT_NAME))
        		m.setViewName(SL_DESIGN_VIEW);

        	EncOrderItemDTO itemDTO = encOrderItemDTOService.retrieveItemDTO(request);
        	
        	if(category.getName().toLowerCase().contains(BLOUSE))
        	{
        		m.addObject("type", BLOUSE);
        	}
        	else
        	{
        		m.addObject("type", CHUD);
        	}
        	
    		if (itemDTO.getMaterial() == null)
    		{
    			//set pick up material by default
    			EncMaterial material = (EncMaterial) catalogService.findProductById(PICKUP_MATERIAL);
    			itemDTO.setMaterial(material);
    			encOrderItemDTOService.save(itemDTO);
    		}

            m.addObject("status", itemDTO.getStatus());
            
            if(category.getName().contains(FRONT_NECK_DESIGN_CAT_NAME)){
        		m.addObject("prodselid", itemDTO.getFnSelectedId());
        	}else if(category.getName().contains(BACK_NECK_DESIGN_CAT_NAME)){
        		m.addObject("prodselid", itemDTO.getBnSelectedId());
        	}else if(category.getName().contains(SLEEVE_DESIGN_CAT_NAME)){
        		m.addObject("prodselid", itemDTO.getSlSelectedId());
        	}
            
        }       	
        else if(category.getName().toLowerCase().contains(TAILOR)){  
        	//m.addObject("prodselid", itemsDTO.getTlSelectedId());
        	
        	EncOrderItemDTO itemDTO = encOrderItemDTOService.retrieveItemDTO(request);
            m.addObject("status", itemDTO.getStatus());
            m.addObject("prodselid", itemDTO.getTlSelectedId());
        	
            m.setViewName(TAILOR_VIEW);
        }
        
        return m;
    }
    
    public ModelAndView handleRequestBase(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
    	ModelAndView model = new ModelAndView();
        
        if (request.getParameterMap().containsKey("facetField")) {
            // If we receive a facetField parameter, we need to convert the field to the 
            // product search criteria expected format. This is used in multi-facet selection. We 
            // will send a redirect to the appropriate URL to maintain canonical URLs
            
            String fieldName = request.getParameter("facetField");
            List<String> activeFieldFilters = new ArrayList<String>();
            Map<String, String[]> parameters = new HashMap<String, String[]>(request.getParameterMap());
            
            for (Iterator<Entry<String,String[]>> iter = parameters.entrySet().iterator(); iter.hasNext();){
                Map.Entry<String, String[]> entry = iter.next();
                String key = entry.getKey();
                if (key.startsWith(fieldName + "-")) {
                    activeFieldFilters.add(key.substring(key.indexOf('-') + 1));
                    iter.remove();
                }
            }
            
            parameters.remove(ProductSearchCriteria.PAGE_NUMBER);
            parameters.put(fieldName, activeFieldFilters.toArray(new String[activeFieldFilters.size()]));
            parameters.remove("facetField");
            
            String newUrl = ProcessorUtils.getUrl(request.getRequestURL().toString(), parameters);
            model.setViewName("redirect:" + newUrl);
        } else {
            // Else, if we received a GET to the category URL (either the user clicked this link or we redirected
            // from the POST method, we can actually process the results
            
            Category category = (Category) request.getAttribute(CategoryHandlerMapping.CURRENT_CATEGORY_ATTRIBUTE_NAME);
            assert(category != null);
            
            //if(!category.getName().toLowerCase().contains(""))
            prepareModelForRequest(request,category,"",model);
            
            
           /* else
            {
            	//Retrieve All subcategories Neck Design , Sleeve design and tailors
            	String fNeckDesign= "";
            	String bNeckDesign = "";
            	String sleeve = "";
            	String tailor = TAILOR_CAT_NAME;
            	
            	if(category.getName().toLowerCase().contains(BLOUSE))
            	{
            		fNeckDesign = BLOUSE_FRONT_NECK_DESIGN_CAT_NAME;
            		bNeckDesign = BLOUSE_BACK_NECK_DESIGN_CAT_NAME;
            		sleeve = BLOUSE_SLEEVE_DESIGN_CAT_NAME;
            	}
            	
            	//retrieve the categories 
            	Map<String, String> categories = new HashMap<String,String>();
            	categories.put(fNeckDesign, "fn");
            	categories.put(bNeckDesign, "bn");
            	categories.put(sleeve, "sl");
            	
            	//Add Tailor
            	categories.put(tailor, "tl");
            	
            	for(String catg: categories.keySet())
            	{
                	List<Category> catgs = catalogService.findCategoriesByName(catg);   
                	
                	if(catgs.size() > 0)
                	{
                		//get first category
                		category = catgs.get(0);
                		prepareModelForRequest(request,category,categories.get(catg),model);
                		
                	}
            	}
            	
            	//Add attributes needed for measurement
               	//Retrieve Measurements
            	EncOrderItemDTO itemDTO = encOrderItemDTOService.retrieveItemDTO(request);
            	EncCustomer customer = (EncCustomer) CustomerState.getCustomer(request);
            	Collection<Measurement> customerMeasurements = customer.getCustomerMeasurements().values();
            	model.addObject("material", itemDTO.getMaterial());
            	model.addObject("custMeasurements", customerMeasurements);          	
            	
            } */
    
            if (StringUtils.isNotEmpty(category.getDisplayTemplate())) {
                model.setViewName(category.getDisplayTemplate());   
            } else {
                model.setViewName(getDefaultCategoryView());
            }
        }
        return model;
    }
    
    private void prepareModelForRequest(HttpServletRequest request, Category category,
    		 String prefix , ModelAndView model) throws ServiceException
    {
    	List<SearchFacetDTO> availableFacets = searchService.getCategoryFacets(category);
        ProductSearchCriteria searchCriteria = facetService.buildSearchCriteria(request, availableFacets);
        
        String searchTerm = request.getParameter(ProductSearchCriteria.QUERY_STRING);
        ProductSearchResult result;
        if (StringUtils.isNotBlank(searchTerm)) {
            result = searchService.findProductsByCategoryAndQuery(category, searchTerm, searchCriteria);
        } else {
            result = searchService.findProductsByCategory(category, searchCriteria);
        }
        
        facetService.setActiveFacetResults(result.getFacets(), request);
        
        model.addObject(prefix + CATEGORY_ATTRIBUTE_NAME, category);
        model.addObject(prefix + PRODUCTS_ATTRIBUTE_NAME, result.getProducts());
        model.addObject(prefix + FACETS_ATTRIBUTE_NAME, result.getFacets());
        model.addObject(prefix + PRODUCT_SEARCH_RESULT_ATTRIBUTE_NAME, result);
    }
}
