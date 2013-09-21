/*
 * Copyright 2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.mycompany.controller.account;

import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.core.web.controller.account.BroadleafRegisterController;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.broadleafcommerce.profile.web.core.form.RegisterCustomerForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.enclothe.core.customer.domain.EncCustomer;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.web.form.EncRegisterCustomerForm;
import com.enclothe.web.validator.RegisterEncCustomerValidator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * The controller responsible for registering a customer
 */
@Controller
@RequestMapping("/register")
public class RegisterController extends BroadleafRegisterController {
    
	   	
    @RequestMapping(method=RequestMethod.GET)
    public String register(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("registrationForm") RegisterCustomerForm registerCustomerForm) {
        return super.register(registerCustomerForm, request, response, model);
    	

    }
    
    @RequestMapping(method=RequestMethod.POST)
    public String processRegister(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("registrationForm") RegisterCustomerForm registerCustomerForm, BindingResult errors) throws ServiceException {
        //return super.processRegister(registerCustomerForm, errors, request, response, model);
    	
    	/* Enclothe Changes Begins 
    	 * Store the url after calling the processregister of suprt class. Now retrieve
    	 * the measurement from the form. also retrieve the new customer entity created.
    	 * Add measurement to customer and set customer to measurement. Then save the 
    	 * customer and measurement in the db
    	*/
    	String url = super.processRegister(registerCustomerForm, errors, request, response, model);
    	EncCustomer newCustomer = (EncCustomer) CustomerState.getCustomer();
    	
    	Measurement m = ((EncRegisterCustomerForm)registerCustomerForm).getMeasurement();
    	m.setCustomer(newCustomer);
    	newCustomer.addMeasurement(m);
    	
    	
    	newCustomer = (EncCustomer) customerService.saveCustomer(newCustomer);
    	// Place the new customer onto the request
        CustomerState.setCustomer(newCustomer);
        
        //Enclothe Change ends
    	return url;    	
    }
    
    @ModelAttribute("registrationForm") 
    public RegisterCustomerForm initCustomerRegistrationForm() {
        //return super.initCustomerRegistrationForm();
    	
        RegisterCustomerForm superForm = super.initCustomerRegistrationForm();      

        EncRegisterCustomerForm form = new EncRegisterCustomerForm();
        form.setCustomer(superForm.getCustomer());
        return form;    	
    }
}
