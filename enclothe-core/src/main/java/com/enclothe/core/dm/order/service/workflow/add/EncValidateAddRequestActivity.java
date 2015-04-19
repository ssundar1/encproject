package com.enclothe.core.dm.order.service.workflow.add;

import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.order.service.OrderService;
import org.broadleafcommerce.core.order.service.ProductOptionValidationService;
import org.broadleafcommerce.core.order.service.workflow.CartOperationContext;
import org.broadleafcommerce.core.order.service.workflow.CartOperationRequest;
import org.broadleafcommerce.core.order.service.workflow.add.ValidateAddRequestActivity;

import com.enclothe.core.dm.order.dto.EncOrderItemRequestDTO;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncTailor;

public class EncValidateAddRequestActivity extends ValidateAddRequestActivity {

    @Resource(name = "blOrderService")
    protected OrderService orderService;
    
    @Resource(name = "blCatalogService")
    protected CatalogService catalogService;

    @Resource(name = "blProductOptionValidationService")
    protected ProductOptionValidationService productOptionValidationService;
    
    @Override
    public CartOperationContext execute(CartOperationContext context) throws Exception {
    	
    	super.execute(context);
    	CartOperationRequest request =  context.getSeedData();
    	EncOrderItemRequestDTO orderItemRequestDTO = (EncOrderItemRequestDTO) request.getItemRequest();
    	
        // Validate that if the user specified a productId, it is a legitimate productId
    	// If we couldn't find a sku, then we're unable to add to cart.
        EncDesign design = null;
        
        int i = 0;
        List<Long> validatedDesignSkus = new ArrayList<Long>();        
        for(Long designId: orderItemRequestDTO.getDesigns())
        {
        	design = (EncDesign) catalogService.findProductById(designId);        	
        	if (design == null) {
                throw new IllegalArgumentException("Design was specified but no matching design was found for designId " + designId);
            }
        	
        	//Get Corresponding Sku
        	Long skuId = null;
        	if(orderItemRequestDTO.getDesignSkus() != null && i < orderItemRequestDTO.getDesignSkus().size())
        		skuId = orderItemRequestDTO.getDesignSkus().get(i);
        	
            Sku designSku = 
            		determineSku(design, skuId, orderItemRequestDTO.getItemAttributes());
            
            //throw if unable to determine a valid sku for design
            if (designSku == null) {

                StringBuilder sb = new StringBuilder();
                for (Entry<String, String> entry : orderItemRequestDTO.getItemAttributes().entrySet()) {
                    sb.append(entry.toString());
                }
                throw new IllegalArgumentException("Could not find SKU for :" +
                        " designId: " + (design == null ? "null" : design.getId()) + 
                        " designSkuId: " + skuId + 
                        " attributes: " + sb.toString());
            } else if (!designSku.isActive()) {
                throw new IllegalArgumentException("The requested skuId of " +
                					designSku.getId() + " is no longer active");
            } else {
                // We know definitively which sku we're going to add, so we can set this
                // value with certainty
            	validatedDesignSkus.add(designSku.getId());
            } 
            
        	//Increment counter to get corresponding sku for design
        	++i;
        }
        
        orderItemRequestDTO.setDesignSkus(validatedDesignSkus);
     
        
        //Validate Tailor
        EncTailor tailor = null;
        
        if(orderItemRequestDTO.getTailor() != null)
        {
        	tailor = (EncTailor) catalogService.findProductById(orderItemRequestDTO.getTailor());        	
        	if (tailor == null) {
                throw new IllegalArgumentException("Tailor was specified but "
                		+ "no matching tailor was found for id " + orderItemRequestDTO.getTailor());
            }
        	
        	//Get Corresponding Sku
        	Long tailorSkuId = orderItemRequestDTO.getTailorSku();
            Sku tailorSku = 
            		determineSku(design, tailorSkuId, orderItemRequestDTO.getItemAttributes());
            
        	//throw if unable to determine a valid sku for tailor
            if (tailorSku == null) {

                StringBuilder sb = new StringBuilder();
                for (Entry<String, String> entry : orderItemRequestDTO.getItemAttributes().entrySet()) {
                    sb.append(entry.toString());
                }
                throw new IllegalArgumentException("Could not find SKU for :" +
                        " tailorId: " + (tailor == null ? "null" : tailor.getId()) + 
                        " tailorSkuId: " + tailorSkuId + 
                        " attributes: " + sb.toString());
            } else if (!tailorSku.isActive()) {
                throw new IllegalArgumentException("The requested skuId of " +
                		tailorSku.getId() + " is no longer active");
            } else {
                // We know definitively which sku we're going to add, so we can set this
                // value with certainty
            	orderItemRequestDTO.setTailorSku(tailorSku.getId());
            } 
        }
        
    	return context;
    }
    
}
