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

package com.mycompany.controller.account;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.broadleafcommerce.core.web.controller.account.BroadleafOrderHistoryController;
import org.broadleafcommerce.profile.core.service.CountryService;
import org.broadleafcommerce.profile.core.service.StateService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DisputeController {

	
    @RequestMapping(value = "/createDispute")
    public String createDispute(HttpServletRequest request, Model model) {
//	dummy place holder
    return "account/partials/disputeform";	
    }

    @RequestMapping(value = "/viewDispDet")
    public String viewDisputeDetails(HttpServletRequest request, Model model) {
    	
    long disputeId = Long.parseLong(request.getParameter("dispid"));	
//	dummy place holder
    return "";	
    }
    
}
