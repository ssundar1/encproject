package com.enclothe.core.dm.order.service.workflow.add;

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
        EncDesign design = null;
        if (orderItemRequestDTO.getDesignId() != null) {
            design = (EncDesign) catalogService.findProductById(orderItemRequestDTO.getDesignId());
            if (design == null) {
                throw new IllegalArgumentException("Design was specified but no matching design was found for designId " + orderItemRequestDTO.getDesignId());
            }
        }
        
        Sku designSku = determineSku(design, orderItemRequestDTO.getDesignSkuId(), orderItemRequestDTO.getItemAttributes());
        
        // If we couldn't find a sku, then we're unable to add to cart.
        if (designSku == null) {

            StringBuilder sb = new StringBuilder();
            for (Entry<String, String> entry : orderItemRequestDTO.getItemAttributes().entrySet()) {
                sb.append(entry.toString());
            }
            throw new IllegalArgumentException("Could not find SKU for :" +
                    " designId: " + (design == null ? "null" : design.getId()) + 
                    " designSkuId: " + orderItemRequestDTO.getDesignSkuId() + 
                    " attributes: " + sb.toString());
        } else if (!designSku.isActive()) {
            throw new IllegalArgumentException("The requested skuId of " + designSku.getId() + " is no longer active");
        } else {
            // We know definitively which sku we're going to add, so we can set this
            // value with certainty
        	orderItemRequestDTO.setDesignSkuId(designSku.getId());
        }    	
    	return context;
    }
    
}
