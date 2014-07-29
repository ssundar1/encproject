package com.enclothe.web.processor;

import java.text.NumberFormat;

import org.broadleafcommerce.common.web.BroadleafRequestContext;
import org.broadleafcommerce.core.web.processor.PriceTextDisplayProcessor;
import org.thymeleaf.Arguments;
import org.thymeleaf.dom.Element;
import org.thymeleaf.standard.expression.StandardExpressionProcessor;
import org.broadleafcommerce.common.money.Money;

public class CustomPriceTextDisplayProcessor extends PriceTextDisplayProcessor{

	
    @Override
    protected String getText(Arguments arguments, Element element, String attributeName) {
        
        Money price;
        
        try {
            price = (Money) StandardExpressionProcessor.processExpression(arguments, element.getAttributeValue(attributeName));
        } catch (ClassCastException e) {
            Number value = (Number) StandardExpressionProcessor.processExpression(arguments, element.getAttributeValue(attributeName));
            price = new Money(value.doubleValue());
        }

        if (price == null) {
            return "Not Available";
        }

        BroadleafRequestContext brc = BroadleafRequestContext.getBroadleafRequestContext();
        if (brc.getJavaLocale() != null) {
            NumberFormat format = NumberFormat.getCurrencyInstance(brc.getJavaLocale());
            format.setCurrency(price.getCurrency());
            String amt = format.format(price.getAmount());
            amt = amt.replace("Rs. ", "&#8377;");
            
            return amt;
        } else {
            // Setup your BLC_CURRENCY and BLC_LOCALE to display a diff default.
            return "&#8377;" + price.getAmount().toString();
        }
    }
}
