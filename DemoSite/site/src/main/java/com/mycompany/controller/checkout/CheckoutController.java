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

package com.mycompany.controller.checkout;

import org.apache.commons.collections.CollectionUtils;
import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.common.time.SystemTime;
import org.broadleafcommerce.core.checkout.service.exception.CheckoutException;
import org.broadleafcommerce.core.order.domain.FulfillmentGroup;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.OrderService;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.payment.domain.PaymentInfo;
import org.broadleafcommerce.core.payment.service.type.PaymentInfoType;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.web.checkout.model.BillingInfoForm;
import org.broadleafcommerce.core.web.checkout.model.OrderInfoForm;
import org.broadleafcommerce.core.web.checkout.model.OrderMultishipOptionForm;
import org.broadleafcommerce.core.web.checkout.model.ShippingInfoForm;
import org.broadleafcommerce.core.web.controller.checkout.BroadleafCheckoutController;
import org.broadleafcommerce.core.web.order.CartState;
import org.broadleafcommerce.profile.core.domain.CustomerAddress;
import org.broadleafcommerce.profile.core.service.AddressService;
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
import org.springframework.web.servlet.view.RedirectView;
import org.apache.commons.beanutils.BeanUtils;

import com.enclothe.core.payment.domain.Payment;
import com.enclothe.core.payment.service.PaymentService;
import com.enclothe.core.web.checkout.model.EncBillingInfoForm;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

@Controller
@RequestMapping("/checkout")
public class CheckoutController extends BroadleafCheckoutController {


    @Resource(name = "blPaymentService")
    protected PaymentService paymentService;
     
    @Resource(name="blOrderService")
    protected OrderService orderService;    
    /*
    * The Checkout page for Heat Clinic will have the shipping information pre-populated 
    * with an address if the fulfillment group has an address and fulfillment option 
    * associated with it. It also assumes that there is only one payment info of type 
    * credit card on the order. If so, then the billing address will be pre-populated.
    */
    @RequestMapping("")
    public String checkout(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("orderInfoForm") OrderInfoForm orderInfoForm,
            @ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm,
            @ModelAttribute("billingInfoForm") EncBillingInfoForm billingForm, RedirectAttributes redirectAttributes) throws PricingException {
        prepopulateCheckoutForms(CartState.getCart(), orderInfoForm, shippingForm, billingForm);
        
        return super.checkout(request, response, model, redirectAttributes);
    }
    
    @RequestMapping(value = "/savedetails", method = RequestMethod.POST)
    public String saveGlobalOrderDetails(HttpServletRequest request, Model model, 
            @ModelAttribute("orderInfoForm") OrderInfoForm orderInfoForm, BindingResult result) throws ServiceException {
        return super.saveGlobalOrderDetails(request, model, orderInfoForm, result);
    }
    
    @RequestMapping(value="/singleship", method = RequestMethod.GET)
    public String convertToSingleship(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
        return super.convertToSingleship(request, response, model);
    }

    @RequestMapping(value="/singleship", method = RequestMethod.POST)
    public String saveSingleShip(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("orderInfoForm") OrderInfoForm orderInfoForm,
            @ModelAttribute("billingInfoForm") EncBillingInfoForm billingForm,
            @ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm, 
            BindingResult result) throws PricingException, ServiceException {
        prepopulateOrderInfoForm(CartState.getCart(), orderInfoForm);
        return super.saveSingleShip(request, response, model, shippingForm, result);
    }

    @RequestMapping(value = "/multiship", method = RequestMethod.GET)
    public String showMultiship(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("orderMultishipOptionForm") OrderMultishipOptionForm orderMultishipOptionForm, 
            BindingResult result) throws PricingException {
        return super.showMultiship(request, response, model);
    }
    
    @RequestMapping(value = "/multiship", method = RequestMethod.POST)
    public String saveMultiship(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("orderMultishipOptionForm") OrderMultishipOptionForm orderMultishipOptionForm, 
            BindingResult result) throws PricingException, ServiceException {
        return super.saveMultiship(request, response, model, orderMultishipOptionForm, result);
    }
    
    @RequestMapping(value = "/add-address", method = RequestMethod.GET)
    public String showMultishipAddAddress(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("addressForm") ShippingInfoForm addressForm, BindingResult result) {
        return super.showMultishipAddAddress(request, response, model);
    }
    
    @RequestMapping(value = "/add-address", method = RequestMethod.POST)
    public String saveMultishipAddAddress(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("addressForm") ShippingInfoForm addressForm, BindingResult result) throws ServiceException {
        return super.saveMultishipAddAddress(request, response, model, addressForm, result);
    }

    @RequestMapping(value = "/complete", method = RequestMethod.POST)
    public void completeSecureCreditCardCheckout(HttpServletRequest request, HttpServletResponse response) throws IOException, CheckoutException, PricingException,ServletException,  ServiceException {
        //prepopulateCheckoutForms(CartState.getCart(), null, shippingForm, billingForm);
        
        //
    	//RequestDispatcher rd = request.getRequestDispatcher(EBS_URL);
    	//rd.forward(request, response);
       // return "redirect:" + EBS_URL;
        //populate all the fields needed in request before forwarding
        
        
        //return super.completeSecureCreditCardCheckout(request, response, model, billingForm, result);
    }

    @RequestMapping(value = "{orderId}/response", method = RequestMethod.GET)
    public String completeCheckout(HttpServletRequest request, 
    		HttpServletResponse response,
    		Model model,
    		@PathVariable long orderId) throws IOException, CheckoutException, PricingException,ServletException,  ServiceException, Exception {
        
    	String key = "ebskey"; //Your Secret Key
    	StringBuffer data1 = new StringBuffer().append(request.getParameter("DR"));
    	for (int i=0; i < data1.length(); i++){
    		if(data1.charAt(i)== ' ')
    			data1.setCharAt(i,'+');
    	}	
    	Base64 base64 = new Base64();
    	byte[] data = base64.decode(data1.toString());
    	RC4 rc4 = new RC4(key);
    	byte[] result = rc4.rc4(data);


    	ByteArrayInputStream byteIn = new ByteArrayInputStream (result, 0, result.length);
    	DataInputStream dataIn = new DataInputStream (byteIn);
    	String recvString1 = "";
    	String recvString = "";
    	recvString1 = dataIn.readLine();
    	int i =0;
    	while(recvString1 != null ){
    		i++;
    		if(i > 705) break;
    		recvString += recvString1 + "\n";
    		recvString1 = dataIn.readLine();
    	}
    recvString  = recvString.replace( "=&","=--&" )	;
    
	StringTokenizer st = new StringTokenizer(recvString, "=&");
	String field ,val;
	
	HashMap<String,String> respMap = new HashMap<String,String>();
	while(st.hasMoreTokens()) {
	field = st.nextToken(); 	
	val = st.nextToken(); 	
	respMap.put(field, val);
	}
	
	//Retrieve the order
	Order order = orderService.findOrderById(orderId);	
	String orderNumber = order.getOrderNumber();
	
	Payment payment = paymentService.createPayment();
	
	//Populate EBS Fields
	payment.setPaymentId(Long.parseLong(respMap.get("PaymentID")));
	payment.setResponseCode(Integer.parseInt(respMap.get("ResponseCode")));
	payment.setResponseMessage(respMap.get("ResponseMessage"));
	payment.setAmount(Float.parseFloat(respMap.get("Amount")));
	payment.setTransactionID(respMap.get("TransactionID"));
	payment.setMerchantRefNo(respMap.get("MerchantRefNo"));
	payment.setPaymentMethod(Integer.parseInt(respMap.get("PaymentMethod").replaceAll("(\\r|\\n|\"|&)", "").trim()));
	payment.setBillingName(respMap.get("BillingName"));
	payment.setBillingAddress(respMap.get("BillingAddress"));
	payment.setBillingCity(respMap.get("BillingCity"));
	payment.setBillingState(respMap.get("BillingState"));
	payment.setBillingCountry(respMap.get("BillingCountry"));
	payment.setBillingEmail(respMap.get("BillingEmail"));
	payment.setBillingPhone(respMap.get("BillingPhone"));
	payment.setBillingPostalCode(respMap.get("BillingPostalCode"));
	payment.setDescription(respMap.get("Description"));
	payment.setDateCreated(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH).parse(respMap.get("DateCreated")));
	
	paymentService.savePayment(payment);

	//Validation
	//check order number, amount and response code
	
	if(!orderNumber.equals(respMap.get("MerchantRefNo")) || 
			!((Float.valueOf(respMap.get("Amount")).equals(order.getTotal().getAmount().floatValue()))))
	{
			model.addAttribute("exceptionMessage", "Order Number or Amount sent by gateway doesnt match");
			model.addAttribute("orderNumber",respMap.get("MerchantRefNo"));
			return "checkout/ordercheckoutfailure";
	}
	else if(Integer.parseInt(respMap.get("ResponseCode")) != 0)
	{
		model.addAttribute("exceptionMessage", respMap.get("ResponseMessage"));
		model.addAttribute("orderNumber",respMap.get("MerchantRefNo"));
		return "checkout/ordercheckoutfailure";		
	}
	
	order.setStatus(OrderStatus.SUBMITTED);
	order.setSubmitDate(Calendar.getInstance().getTime());	
	orderService.save(order, false);
	
	return "forward:/confirmation/" + orderNumber;
    }
    
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public String testSecureCreditCardCheckout(HttpServletRequest request, HttpServletResponse response,
    		@ModelAttribute("orderInfoForm") OrderInfoForm orderInfoForm) throws CheckoutException, PricingException, ServiceException {
        //prepopulateCheckoutForms(CartState.getCart(), null, shippingForm, billingForm);
        System.out.println("This is a test method");
        //
        return "";
        //populate all the fields needed in request before forwarding
        
        
        //return super.completeSecureCreditCardCheckout(request, response, model, billingForm, result);
    }

    protected void prepopulateOrderInfoForm(Order cart, OrderInfoForm orderInfoForm) {
        if (orderInfoForm != null) {
            orderInfoForm.setEmailAddress(cart.getEmailAddress());
        }
    }
            
    protected void prepopulateCheckoutForms(Order cart, OrderInfoForm orderInfoForm, ShippingInfoForm shippingForm, 
            EncBillingInfoForm billingForm) throws PricingException {
        List<FulfillmentGroup> groups = cart.getFulfillmentGroups();
        
        prepopulateOrderInfoForm(cart, orderInfoForm);
        
        if (CollectionUtils.isNotEmpty(groups) && groups.get(0).getFulfillmentOption() != null) {
            //if the cart has already has fulfillment information
            shippingForm.setAddress(groups.get(0).getAddress());
            shippingForm.setFulfillmentOption(groups.get(0).getFulfillmentOption());
            shippingForm.setFulfillmentOptionId(groups.get(0).getFulfillmentOption().getId());
        } else {
            //check for a default address for the customer
            CustomerAddress defaultAddress = customerAddressService.findDefaultCustomerAddress(CustomerState.getCustomer().getId());
            if (defaultAddress != null) {
                shippingForm.setAddress(defaultAddress.getAddress());
                shippingForm.setAddressName(defaultAddress.getAddressName());
            }
        }

        if (cart.getPaymentInfos() != null) {
            for (PaymentInfo paymentInfo : cart.getPaymentInfos()) {
                if (PaymentInfoType.CREDIT_CARD.equals(paymentInfo.getType())) {
                    billingForm.setAddress(paymentInfo.getAddress());
                }
            }
        }
        
        String orderNumber = new SimpleDateFormat("yyyyMMddHHmmssS").format(SystemTime.asDate()) + cart.getId().toString();
        cart.setOrderNumber(orderNumber);

        orderService.save(cart, false);
        billingForm.setAmount(cart.getTotal().toString());
        billingForm.setReferenceNo(orderNumber);
        
        String returnURL = "http://localhost:8080/checkout/"+ cart.getId().toString() + "/response?DR={DR}";
        billingForm.setReturnURL(returnURL);
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        super.initBinder(request, binder);
    }
    
}

@SuppressWarnings("rawtypes")
class ResponseData {
	
	   
	private HashMap info = new HashMap(); // Stores the data for
											 // the phone directory.
	   
	   @SuppressWarnings("unchecked")
	void addEntry(String name, String number) {
			 // Record the phone number for a specified name.
		  info.put(name,number);
	   }
	   
	   String getData(String name) {
			 // Retrieve the phone number for a specified name.
			 // Returns null if there is no number for the name.
		  return (String)info.get(name);
	   }
	   
	}

class Base64 {

    /**
     *  Decodes BASE64 encoded string.
     *  @param encoded string
     *  @return decoded data as byte array
     */
      byte[] decode(String encoded)  {
        int i;
    	byte output[] = new byte[3];
    	int state;

	ByteArrayOutputStream data = new ByteArrayOutputStream(encoded.length());

    	state = 1;
    	for(i=0; i < encoded.length(); i++)
    	{
            byte c;
            {
            	char alpha = encoded.charAt(i);
            	if (Character.isWhitespace(alpha)) continue;

   		if ((alpha >= 'A') && (alpha <= 'Z')) c = (byte)(alpha - 'A');
   		else if ((alpha >= 'a') && (alpha <= 'z')) c = (byte)(26 + (alpha - 'a'));
		else if ((alpha >= '0') && (alpha <= '9')) c = (byte)(52 + (alpha - '0'));
	   	else if (alpha=='+') c = 62;
   		else if (alpha=='/') c = 63;
	   	else if (alpha=='=') break; // end
   		else return null; // error
            }

            switch(state)
            {   case 1: output[0] = (byte)(c << 2);
                        break;
                case 2: output[0] |= (byte)(c >>> 4);
                        output[1] = (byte)((c & 0x0F) << 4);
                        break;
                case 3: output[1] |= (byte)(c >>> 2);
                        output[2] =  (byte)((c & 0x03) << 6);
                        break;
                case 4: output[2] |= c;
                        data.write(output,0,output.length);
                        break;
            }
            state = (state < 4 ? state+1 : 1);
    	} // for

	if (i < encoded.length()) /* then '=' found, but the end of string */
            switch(state)
            {   case 3: data.write(output,0,1);
                    return (encoded.charAt(i)=='=') && (encoded.charAt(i+1)=='=')
                    	 ? data.toByteArray() : null;
            	case 4: data.write(output,0,2);
                    return (encoded.charAt(i)=='=') ? data.toByteArray() : null;
            	default: return null;
            }
    	else return (state==1 ? data.toByteArray() : null); /* end of string */

    } // decode

     final static String base64 =
		"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    /**
     *  Encodes binary data by BASE64 method.
     *  @param data binary data as byte array
     *  @return encoded data as String
     */
      String encode(byte[] data) {

	char output[] = new char[4];
	int state = 1;
	int restbits = 0;
        int chunks = 0;

	StringBuffer encoded = new StringBuffer();

    	for(int i=0; i < data.length; i++)
    	{
            int ic = (data[i] >= 0 ? data[i] : (data[i] & 0x7F) + 128);
            switch (state)
            {	case 1: output[0] = base64.charAt(ic >>> 2);
                     restbits = ic & 0x03;
                     break;
             	case 2: output[1] = base64.charAt((restbits << 4) | (ic >>> 4));
                     restbits = ic & 0x0F;
                     break;
             	case 3: output[2] = base64.charAt((restbits << 2) | (ic >>> 6));
                     output[3] = base64.charAt(ic & 0x3F);
                     encoded.append(output);

                     // keep no more the 76 character per line
                     chunks++;
                     if ((chunks % 19)==0) encoded.append("\r\n");
                     break;
            }
            state = (state < 3 ? state+1 : 1);
    	} // for

    	/* final */
    	switch (state)
    	{    case 2:
             	 output[1] = base64.charAt((restbits << 4));
                 output[2] = output[3] = '=';
                 encoded.append(output);
                 break;
             case 3:
             	 output[2] = base64.charAt((restbits << 2));
                 output[3] = '=';
		 encoded.append(output);
                 break;
    	}

	return encoded.toString();
    } // encode()

} // Base64

class RC4 {
    
    private byte state[] = new byte[256];
    private int x;
    private int y;
    
    /**
     * Initializes the class with a string key. The length
     * of a normal key should be between 1 and 2048 bits.  But
     * this method doens't check the length at all.
     *
     * @param key   the encryption/decryption key
     */
     RC4(String key) throws NullPointerException {
        this(key.getBytes());
    }

    /**
     * Initializes the class with a byte array key.  The length
     * of a normal key should be between 1 and 2048 bits.  But
     * this method doens't check the length at all.
     *
     * @param key   the encryption/decryption key
     */
     RC4(byte[] key) throws NullPointerException {

        for (int i=0; i < 256; i++) {
            state[i] = (byte)i;
        }
        
        x = 0;
        y = 0;
        
        int index1 = 0;
        int index2 = 0;
        
        byte tmp;
        
        if (key == null || key.length == 0) {
            throw new NullPointerException();
        }
        
        for (int i=0; i < 256; i++) {

            index2 = ((key[index1] & 0xff) + (state[i] & 0xff) + index2) & 0xff;

            tmp = state[i];
            state[i] = state[index2];
            state[index2] = tmp;
            
            index1 = (index1 + 1) % key.length;
        }



    }

    /** 
     * RC4 encryption/decryption.
     *
     * @param data  the data to be encrypted/decrypted
     * @return the result of the encryption/decryption
     */
     byte[] rc4(String data) {
        
        if (data == null) {
            return null;
        }
        
        byte[] tmp = data.getBytes();
        
        this.rc4(tmp);
        
        return tmp;
    }

    /** 
     * RC4 encryption/decryption.
     *
     * @param buf  the data to be encrypted/decrypted
     * @return the result of the encryption/decryption
     */
     byte[] rc4(byte[] buf) {

        //int lx = this.x;
        //int ly = this.y;
        
        int xorIndex;
        byte tmp;
        
        if (buf == null) {
            return null;
        }
        
        byte[] result = new byte[buf.length];
        
        for (int i=0; i < buf.length; i++) {

            x = (x + 1) & 0xff;
            y = ((state[x] & 0xff) + y) & 0xff;

            tmp = state[x];
            state[x] = state[y];
            state[y] = tmp;
            
            xorIndex = ((state[x] &0xff) + (state[y] & 0xff)) & 0xff;
            result[i] = (byte)(buf[i] ^ state[xorIndex]);
        }
        
        //this.x = lx;
        //this.y = ly;
        
        return result;
    }
    
}


