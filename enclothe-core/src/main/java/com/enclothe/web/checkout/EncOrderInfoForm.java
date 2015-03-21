package com.enclothe.web.checkout;

import org.broadleafcommerce.core.web.checkout.model.OrderInfoForm;

public class EncOrderInfoForm extends OrderInfoForm {

	protected String additionalInfo;
	
    public String getAdditionalInfo()
    {
    	return additionalInfo;
    }
    
    public void setAdditionalInfo( String additionalInfo )
    {
    	this.additionalInfo = additionalInfo;
    }
}
