package com.mycompany.controller.account;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.common.web.controller.BroadleafAbstractController;
import org.broadleafcommerce.core.web.controller.account.CustomerAddressForm;
import org.broadleafcommerce.profile.core.domain.CustomerAddress;
import org.broadleafcommerce.profile.core.service.CustomerAddressService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.measurement.service.MeasurementService;
import com.enclothe.web.form.CustomerMeasurementForm;

@Controller
@RequestMapping("/account/measurements")
public class ManageCustomerMeasurementsController extends BroadleafAbstractController{

    @Resource(name = "encMeasurementService")
    private MeasurementService measurementService;
    
    
    protected String measurementUpdatedMessage = "Measurement successfully updated";
    protected String measurementAddedMessage = "Measurement successfully added";
    protected String measurementRemovedMessage = "Measurement successfully removed";
    protected String measurementRemovedErrorMessage = "Measurement could not be removed as it is in use";
    
    protected static String customerMeasurementsView = "account/manageCustomerMeasurements";
    protected static String customerMeasurementsRedirect = "redirect:/account/measurements";
   
    @ModelAttribute("customerMeasurements")
    protected List<Measurement> populateCustomerMeasurements() {
        return measurementService.readActiveCustomerMeasurementsByCustomerId(CustomerState.getCustomer().getId());
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String viewCustomerMeasurements(HttpServletRequest request, Model model) {
        model.addAttribute("customerMeasurementForm", new CustomerMeasurementForm());
        return getCustomerMeasurementsView();
    }
    
    @RequestMapping(value = "/{customerMeasurementId}", method = RequestMethod.GET)
    public String viewCustomerMeasurement(HttpServletRequest request, Model model, @PathVariable("customerMeasurementId") Long customerMeasurementId) {
        Measurement measurement = measurementService.readMeasurementById(customerMeasurementId);
        if (measurement == null) {
            throw new IllegalArgumentException("Measurement not found with the specified customerMeasurementId");
        }
        CustomerMeasurementForm form = new CustomerMeasurementForm();
        form.setMeasurement(measurement);        
        form.setCustomerMeasurementId(customerMeasurementId);
        model.addAttribute("customerMeasurementForm", form);
        return getCustomerMeasurementsView();
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public String addCustomerMeasurement(HttpServletRequest request, Model model, @ModelAttribute("customerMeasurementForm") CustomerMeasurementForm form, BindingResult result, RedirectAttributes redirectAttributes) throws ServiceException {
       /* customerAddressValidator.validate(form, result);
    	
        if (result.hasErrors()) {
            return getCustomerAddressesView();
        } */
    	
    	
        Measurement measurement = form.getMeasurement();
        measurement.setCustomer(CustomerState.getCustomer());
        
        measurement = measurementService.saveMeasurement(measurement);
        
        /*if (form.getAddress().isDefault()) {
            customerAddressService.makeCustomerAddressDefault(customerAddress.getId(), customerAddress.getCustomer().getId());
        }*/
        if (!isAjaxRequest(request)) {
            List<Measurement> measurements = measurementService.readActiveCustomerMeasurementsByCustomerId(CustomerState.getCustomer().getId());
            model.addAttribute("measurements", measurements);
        }
        redirectAttributes.addFlashAttribute("successMessage", getMeasurementAddedMessage());
        return getCustomerMeasurementsRedirect();
    }
       
    @RequestMapping(value = "/{customerMeasurementId}", method = RequestMethod.POST)
    public String updateCustomerMeasurement(HttpServletRequest request, Model model, @PathVariable("customerMeasurementId") Long customerMeasurementId, @ModelAttribute("customerMeasurementForm") CustomerMeasurementForm form, BindingResult result, RedirectAttributes redirectAttributes) throws ServiceException {
       /* customerAddressValidator.validate(form, result);
        if (result.hasErrors()) {
            return getCustomerAddressesView();
        } */
    	
        Measurement measurement = measurementService.readMeasurementById(customerMeasurementId);
        if (measurement == null) {
            throw new IllegalArgumentException("Customer Measurement not found with the specified customerMeasurementId");
        }
        
        measurement = measurementService.saveMeasurement(form.getMeasurement());
        
        /*
        if (form.getAddress().isDefault()) {
            customerAddressService.makeCustomerAddressDefault(customerAddress.getId(), customerAddress.getCustomer().getId());
        }
        */
        
        redirectAttributes.addFlashAttribute("successMessage", getMeasurementUpdatedMessage());
        return getCustomerMeasurementsRedirect();
    }
    
    
 /*  


   
//Remove to be implemented later
    @RequestMapping(value = "/{customerAddressId}", method = RequestMethod.POST, params="removeAddress=Remove")
    public String removeCustomerAddress(HttpServletRequest request, Model model, @PathVariable("customerAddressId") Long customerAddressId, RedirectAttributes redirectAttributes) {
        return super.removeCustomerAddress(request, model, customerAddressId, redirectAttributes);
    }
    */
    public String getCustomerMeasurementsView() {
        return customerMeasurementsView;
    }
    
    public String getCustomerMeasurementsRedirect() {
        return customerMeasurementsRedirect;
    }
    
    public String getMeasurementAddedMessage() {
        return measurementAddedMessage;
    }
    

    public String getMeasurementUpdatedMessage() {
        return measurementUpdatedMessage;
    }
    
}
