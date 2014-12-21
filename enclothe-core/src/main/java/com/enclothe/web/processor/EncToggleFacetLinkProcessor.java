package com.enclothe.web.processor;

import org.apache.commons.lang.ArrayUtils;
import org.broadleafcommerce.common.web.BroadleafRequestContext;
import org.broadleafcommerce.core.search.domain.ProductSearchCriteria;
import org.broadleafcommerce.core.search.domain.SearchFacetResultDTO;
import org.broadleafcommerce.core.web.service.SearchFacetDTOService;
import org.broadleafcommerce.core.web.util.ProcessorUtils;
import org.springframework.stereotype.Component;
import org.thymeleaf.Arguments;
import org.thymeleaf.dom.Element;
import org.thymeleaf.processor.attr.AbstractAttributeModifierAttrProcessor;
import org.thymeleaf.standard.expression.StandardExpressionProcessor;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Component("encToggleFacetLinkProcessor")
public class EncToggleFacetLinkProcessor extends AbstractAttributeModifierAttrProcessor {
	
    @Resource(name = "blSearchFacetDTOService")
    protected SearchFacetDTOService facetService;
    
	/**
     * Sets the name of this processor to be used in Thymeleaf template
     */
    public EncToggleFacetLinkProcessor() {
        super("enctogglefacetlink");
    }
    
    public EncToggleFacetLinkProcessor(String tag) {
        super(tag);
    }
    
    @Override
    public int getPrecedence() {
        return 10000;
    }

    protected Map<String, String> getModifiedAttributeValues(Arguments arguments, Element element, String attributeName, 
    		String category)
    {
    	 Map<String, String> attrs = new HashMap<String, String>();
         
         BroadleafRequestContext blcContext = BroadleafRequestContext.getBroadleafRequestContext();
         HttpServletRequest request = blcContext.getRequest();
         
         String baseUrl = request.getRequestURL().toString();
         Map<String, String[]> params = new HashMap<String, String[]>(request.getParameterMap());
         
         SearchFacetResultDTO result = (SearchFacetResultDTO) StandardExpressionProcessor.processExpression(arguments, element.getAttributeValue(attributeName));
         
         String key = facetService.getUrlKey(result);
         String value = facetService.getValue(result);
         String[] paramValues = params.get(key);
         
         if (ArrayUtils.contains(paramValues, facetService.getValue(result))) {
             paramValues = (String[]) ArrayUtils.removeElement(paramValues, facetService.getValue(result));
         } else {
             paramValues = (String[]) ArrayUtils.add(paramValues, value);
         }
         
         params.remove(ProductSearchCriteria.PAGE_NUMBER);
         params.put(key, paramValues);
         params.put("category", new String[]{category});
         String url = ProcessorUtils.getUrl(baseUrl, params);
         
         attrs.put("href", url);
         return attrs;
    }
    
    
    @Override
    @SuppressWarnings("unchecked")
    protected Map<String, String> getModifiedAttributeValues(Arguments arguments, Element element, String attributeName) {
        Map<String, String> attrs = new HashMap<String, String>();
        
        BroadleafRequestContext blcContext = BroadleafRequestContext.getBroadleafRequestContext();
        HttpServletRequest request = blcContext.getRequest();
        
        String baseUrl = request.getRequestURL().toString();
        Map<String, String[]> params = new HashMap<String, String[]>(request.getParameterMap());
        
        SearchFacetResultDTO result = (SearchFacetResultDTO) StandardExpressionProcessor.processExpression(arguments, element.getAttributeValue(attributeName));
        
        String key = facetService.getUrlKey(result);
        String value = facetService.getValue(result);
        String[] paramValues = params.get(key);
        
        if (ArrayUtils.contains(paramValues, facetService.getValue(result))) {
            paramValues = (String[]) ArrayUtils.removeElement(paramValues, facetService.getValue(result));
        } else {
            paramValues = (String[]) ArrayUtils.add(paramValues, value);
        }
        
        params.remove(ProductSearchCriteria.PAGE_NUMBER);
        params.put(key, paramValues);
        
        String url = ProcessorUtils.getUrl(baseUrl, params);
        
        attrs.put("href", url);
        return attrs;
    }

    @Override
    protected ModificationType getModificationType(Arguments arguments, Element element, String attributeName, String newAttributeName) {
        return ModificationType.SUBSTITUTION;
    }

    @Override
    protected boolean removeAttributeIfEmpty(Arguments arguments, Element element, String attributeName, String newAttributeName) {
        return true;
    }

    @Override
    protected boolean recomputeProcessorsAfterExecution(Arguments arguments, Element element, String attributeName) {
        return false;
    }
    
}
