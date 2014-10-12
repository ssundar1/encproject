package com.enclothe.web.processor;

import java.util.Map;

import org.springframework.stereotype.Component;
import org.thymeleaf.Arguments;
import org.thymeleaf.dom.Element;

@Component("encSLToggleFacetLinkProcessor")
public class EncSLToggleFacetLinkProcessor extends EncToggleFacetLinkProcessor {

	public EncSLToggleFacetLinkProcessor() {
		super("sltogglefacetlink");
		// TODO Auto-generated constructor stub
	}

    @Override
    @SuppressWarnings("unchecked")
    protected Map<String, String> getModifiedAttributeValues(Arguments arguments, Element element, String attributeName)
    {
    	return super.getModifiedAttributeValues(arguments, element, attributeName, "sl");
    }
}
