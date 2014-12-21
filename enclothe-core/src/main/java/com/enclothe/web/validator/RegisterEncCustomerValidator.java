package com.enclothe.web.validator;

import org.broadleafcommerce.profile.web.controller.validator.RegisterCustomerValidator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;


import com.enclothe.web.form.EncRegisterCustomerForm;

@Component("blRegisterEncCustomerValidator")
public class RegisterEncCustomerValidator extends RegisterCustomerValidator {
	
	public String getValidateNumberExpression() {
		return validateNumberExpression;
	}
	public void setValidateNumberExpression(String validateNumberExpression) {
		this.validateNumberExpression = validateNumberExpression;
	}

	private String validateNumberExpression = "(\\d*[.])?\\d+";
	public RegisterEncCustomerValidator() {}
	@Override
	public boolean supports(@SuppressWarnings("rawtypes") Class clazz) {
		// TODO Auto-generated method stub
		return clazz.equals(EncRegisterCustomerForm.class);
	}

	 @Override
	 public void validate(Object obj, Errors errors, boolean useEmailForUsername) {
		 
		 super.validate(obj, errors, useEmailForUsername);
		 
		 EncRegisterCustomerForm form = (EncRegisterCustomerForm) obj;
		 errors.pushNestedPath("measurement");
		 
		 
		 if (!Float.toString(form.getMeasurement().getHip()).matches(getValidateNumberExpression())) {
             errors.rejectValue("hip", "Invalid Number", null, null);
         }
		 
		 errors.popNestedPath();
		 
	 }
}
