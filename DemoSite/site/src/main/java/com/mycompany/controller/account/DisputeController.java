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

import java.util.Collection;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.order.service.OrderItemService;
import org.broadleafcommerce.core.web.controller.account.BroadleafOrderHistoryController;
import org.broadleafcommerce.profile.core.service.CountryService;
import org.broadleafcommerce.profile.core.service.StateService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.enclothe.core.customer.domain.EncCustomer;
import com.enclothe.core.dispute.dao.DisputeCommentDaoImpl;
import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.dispute.domain.DisputeChannel;
import com.enclothe.core.dispute.domain.DisputeComment;
import com.enclothe.core.dispute.domain.DisputeCommentImpl;
import com.enclothe.core.dispute.domain.DisputePriority;
import com.enclothe.core.dispute.domain.DisputePriorityImpl;
import com.enclothe.core.dispute.service.DisputeCommentService;
import com.enclothe.core.dispute.service.DisputePriorityService;
import com.enclothe.core.dispute.service.DisputeService;
import com.enclothe.core.dm.order.dto.EncOrderItemRequestDTO;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncMaterial;
import com.enclothe.core.serviceprovider.domain.ServiceProvider;
import com.enclothe.core.serviceprovider.service.ServiceProviderService;

@Controller
public class DisputeController {

	@Resource(name = "blDisputeService")
    protected DisputeService disputeService;
	
	@Resource(name = "blDisputeCommentService")
    protected DisputeCommentService disputeCommentService;
	
	@Resource(name = "blDisputePriorityService")
    protected DisputePriorityService disputePriorityService;
	
	@Resource(name = "blServiceProviderService")
	protected ServiceProviderService serviceProviderService;
	
	@Resource(name = "blOrderItemService")
	protected OrderItemService orderItemService;
	
    @RequestMapping(value = "/createDispute/{encOrderItemId}")
    public ModelAndView createDispute(HttpServletRequest request, Model model, @PathVariable("encOrderItemId") String orderItemId) {
//	dummy place holder
    	request.getSession().setAttribute("orderItemId_session", orderItemId);
    ModelAndView m = new ModelAndView();
	
	Collection<ServiceProvider> serviceProviders = serviceProviderService.getServiceProviders();
	m.addObject("ServiceProveiders", serviceProviders);
	m.addObject("EncOrderItemId", orderItemId);
	m.setViewName("account/partials/disputeform");
    return m;
    }
    
    @RequestMapping(value = "/saveDispute")	
    public String saveDispute(HttpServletRequest request, Model model, HttpServletResponse response
    		,@ModelAttribute("disputeComment") String comment, @ModelAttribute("serviceProviderId") String serviceProviderId, @ModelAttribute("encOrderItemId") String encOrderItemId) {

    	Dispute dispute = disputeService.createNewDispute();
    	dispute.setDisputeServiceProvider(serviceProviderService.readServiceProviderById(Long.parseLong(serviceProviderId)));
    	dispute.setDisputePriority(disputePriorityService.readDisputePriorityById((long) 1));
    	//dispute.setOrderItem(orderItemService.readOrderItemById(Long.parseLong(request.getSession().getAttribute("orderItemId_session").toString())));
    	dispute.setEncOrderItemId(Long.parseLong(request.getSession().getAttribute("orderItemId_session").toString()));
    	dispute.setCustomer(CustomerState.getCustomer(request));
    	//dispute.setOrderItem(orderItem);
    	disputeService.saveDispute(dispute);
    	
    	DisputeComment disputeComment = new DisputeCommentImpl();
    	disputeComment.setComment(comment);
    	disputeComment.setDispute(dispute);
    	disputeCommentService.saveDisputeComment(disputeComment);
    	
    	
    return "account/partials/disputeform";	
    }

    @RequestMapping(value = "/viewDispDet")
    public String viewDisputeDetails(HttpServletRequest request, Model model) {
    	
    long disputeId = Long.parseLong(request.getParameter("dispid"));	
//	dummy place holder
    return "";	
    }
    
}
