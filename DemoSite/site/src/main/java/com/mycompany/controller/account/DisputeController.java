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
import javax.servlet.http.HttpServletResponse;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.core.web.controller.account.BroadleafOrderHistoryController;
import org.broadleafcommerce.profile.core.service.CountryService;
import org.broadleafcommerce.profile.core.service.StateService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.enclothe.core.dispute.dao.DisputeCommentDaoImpl;
import com.enclothe.core.dispute.domain.Dispute;
import com.enclothe.core.dispute.domain.DisputeChannel;
import com.enclothe.core.dispute.domain.DisputeComment;
import com.enclothe.core.dispute.domain.DisputeCommentImpl;
import com.enclothe.core.dispute.service.DisputeCommentService;
import com.enclothe.core.dispute.service.DisputeService;
import com.enclothe.core.dm.order.dto.EncOrderItemRequestDTO;

@Controller
public class DisputeController {

	@Resource(name = "blDisputeService")
    protected DisputeService disputeService;
	
	@Resource(name = "blDisputeCommentService")
    protected DisputeCommentService disputeCommentService;
	
	
    @RequestMapping(value = "/createDispute")
    public String createDispute(HttpServletRequest request, Model model) {
//	dummy place holder
    return "account/partials/disputeform";	
    }
    
    @RequestMapping(value = "/saveDispute")
    public String saveDispute(HttpServletRequest request, Model model, HttpServletResponse response
    		,@ModelAttribute("disputeComment") String comment) {

    	Dispute dispute = disputeService.createNewDispute();
    	disputeService.saveDispute(dispute);
    	
    	DisputeComment disputeComment = new DisputeCommentImpl();
    	disputeComment.setComment(comment);
    	//disputeComment.setDispute(dispute);
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
