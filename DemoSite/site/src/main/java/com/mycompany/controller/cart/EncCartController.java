/*
 * Copyright 2008-2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.mycompany.controller.cart;


import org.broadleafcommerce.core.order.service.OrderService;
import org.broadleafcommerce.core.order.service.exception.AddToCartException;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.enclothe.core.dm.order.dto.EncOrderItemRequestDTO;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.measurement.domain.MeasurementImpl;
import com.enclothe.core.measurement.service.MeasurementService;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/enccart")
public class EncCartController extends CartController {
    
    @Resource(name = "encMeasurementService")
    protected MeasurementService measurementService;
    	
	public static final String ORDER_ITEM_REQUEST = "orderItemRequest";
	
    @Override
    @RequestMapping("")
    public String cart(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
        return super.cart(request, response, model);
    }
    
    @RequestMapping("dummy")
    public String dummy(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "cart/dummy";
    }
    
   
    /*
     * The Heat Clnic does not show the cart when a product is added. Instead, when the product is added via an AJAX
     * POST that requests JSON, we only need to return a few attributes to update the state of the page. The most
     * efficient way to do this is to call the regular add controller method, but instead return a map that contains
     * the necessary attributes. By using the @ResposeBody tag, Spring will automatically use Jackson to convert the
     * returned object into JSON for easy processing via JavaScript.
     */
    @RequestMapping(value = "/addtocart", produces = "application/json")
    public @ResponseBody Map<String, Object> addJson(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("addToCartItem") EncOrderItemRequestDTO addToCartItem, @ModelAttribute("measurement") MeasurementImpl measurement) throws IOException, PricingException, AddToCartException {
       
    	measurement.setCustomer(CustomerState.getCustomer(request));
    	measurementService.saveMeasurement(measurement);
    	addToCartItem.setMeasurementId(measurement.getId());
        return super.addJson(request, response, model, addToCartItem);
    }

	/*
     * The Heat Clinic does not support adding products with required product options from a category browse page
     * when JavaScript is disabled. When this occurs, we will redirect the user to the full product details page 
     * for the given product so that the required options may be chosen.
     */
    @RequestMapping(value = "/addtocart", produces = { "text/html", "*/*" })
    public String add(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes,
            @ModelAttribute("addToCartItem") EncOrderItemRequestDTO addToCartItem, @ModelAttribute("measurement") MeasurementImpl measurement) throws IOException, PricingException, AddToCartException {

    	    measurement.setCustomer(CustomerState.getCustomer(request));
    		measurement = (MeasurementImpl) measurementService.saveMeasurement(measurement);
    		addToCartItem.setMeasurementId(measurement.getId());
            return super.add(request, response, model, addToCartItem);
    }    

    
}
