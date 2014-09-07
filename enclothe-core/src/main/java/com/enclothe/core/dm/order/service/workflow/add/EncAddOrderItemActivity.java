package com.enclothe.core.dm.order.service.workflow.add;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.broadleafcommerce.core.catalog.domain.Category;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.domain.ProductBundle;
import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.OrderService;
import org.broadleafcommerce.core.order.service.call.ProductBundleOrderItemRequest;
import org.broadleafcommerce.core.order.service.workflow.CartOperationContext;
import org.broadleafcommerce.core.order.service.workflow.CartOperationRequest;
import org.broadleafcommerce.core.order.service.workflow.add.AddOrderItemActivity;

import com.enclothe.core.common.domain.UserCategory;
import com.enclothe.core.dm.order.domain.EncOrderItem;
import com.enclothe.core.dm.order.domain.EncOrderItemStateDetail;
import com.enclothe.core.dm.order.domain.EncOrderItemStates;
import com.enclothe.core.dm.order.dto.EncOrderItemRequestDTO;
import com.enclothe.core.dm.order.service.EncOrderItemRequest;
import com.enclothe.core.dm.order.service.EncOrderItemService;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.measurement.service.MeasurementService;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncTailor;

public class EncAddOrderItemActivity extends AddOrderItemActivity {
	 EncOrderItem item;
	 
	    @Resource(name = "blOrderService")
	    protected OrderService orderService;
	    
	    @Resource(name = "blEncOrderItemService")
	    protected EncOrderItemService orderItemService;
	    
	    @Resource(name = "blCatalogService")
	    protected CatalogService catalogService;
	    
	    @Resource(name = "encMeasurementService")
	    protected MeasurementService measurementService;

	@Override
    public CartOperationContext execute(CartOperationContext context) throws Exception {
		CartOperationRequest request = context.getSeedData();
        //OrderItemRequestDTO orderItemRequestDTO = request.getItemRequest();
        EncOrderItemRequestDTO orderItemRequestDTO =  (EncOrderItemRequestDTO) request.getItemRequest();

        // Order and sku have been verified in a previous activity -- the values 
        // in the request can be trusted
        Order order = request.getOrder();
        Sku sku = catalogService.findSkuById(orderItemRequestDTO.getSkuId());
        
        Product product = null;
        if (orderItemRequestDTO.getProductId() != null) {
            product = catalogService.findProductById(orderItemRequestDTO.getProductId());
        }
               
        //Initialize Design and DesignSku's
        
        
        //Add all designs
        List<EncDesign> designs = null;
        for(Long designId: orderItemRequestDTO.getDesigns())
        {
        	EncDesign design = (EncDesign) catalogService.findProductById(designId);
        	
        	if(designs == null)
        		designs = new ArrayList<EncDesign>();
        	
        	designs.add(design);
        }
        
        //Add all design skus
        List<Sku> designSkus = null;
        for(Long designSkuId: orderItemRequestDTO.getDesignSkus())
        {
        	Sku designSku = catalogService.findSkuById(designSkuId);
        	
        	if(designSkus == null)
        		designSkus = new ArrayList<Sku>();
        	
        	designSkus.add(designSku);
        }
        
        //Add Tailor & Tailor Sku
        EncTailor tailor = null;
        Sku tailorSku = null;
        
        if(orderItemRequestDTO.getTailor() != null)
        {
        	tailor = (EncTailor) catalogService.findProductById(orderItemRequestDTO.getTailor());
        	tailorSku = catalogService.findSkuById(orderItemRequestDTO.getTailorSku());
        }
        
        //Set Measurement
        Measurement measurement = null;       
        if (orderItemRequestDTO.getMeasurementId() != null && orderItemRequestDTO.getMeasurementId()!=0)
        	measurement = measurementService.readMeasurementById(orderItemRequestDTO.getMeasurementId());
        
        Category category = null;
        if (orderItemRequestDTO.getCategoryId() != null) {
            category = catalogService.findCategoryById(orderItemRequestDTO.getCategoryId());
        } 

        if (category == null && product != null) {
            category = product.getDefaultCategory();
        }

      
        EncOrderItem item;
        if (product == null || !(product instanceof ProductBundle)) {
            EncOrderItemRequest itemRequest = new EncOrderItemRequest();
            
            itemRequest.setCategory(category);
            itemRequest.setProduct(product);
            itemRequest.setSku(sku);
            itemRequest.setQuantity(orderItemRequestDTO.getQuantity());
            
            itemRequest.setItemAttributes(orderItemRequestDTO.getItemAttributes());
            itemRequest.setOrder(order);
            itemRequest.setSalePriceOverride(orderItemRequestDTO.getOverrideSalePrice());
            itemRequest.setRetailPriceOverride(orderItemRequestDTO.getOverrideRetailPrice());
            itemRequest.setDesigns(designs);
            itemRequest.setDesignSkus(designSkus);
            itemRequest.setTailor(tailor);
            itemRequest.setTailorSku(tailorSku);
            itemRequest.setMeasurement(measurement);
            
            item = (EncOrderItem) orderItemService.createDiscreteOrderItem(itemRequest);
        } else {
            ProductBundleOrderItemRequest bundleItemRequest = new ProductBundleOrderItemRequest();
            bundleItemRequest.setCategory(category);
            bundleItemRequest.setProductBundle((ProductBundle) product);
            bundleItemRequest.setSku(sku);
            bundleItemRequest.setQuantity(orderItemRequestDTO.getQuantity());
            bundleItemRequest.setItemAttributes(orderItemRequestDTO.getItemAttributes());
            bundleItemRequest.setName(product.getName());
            bundleItemRequest.setOrder(order);
            bundleItemRequest.setSalePriceOverride(orderItemRequestDTO.getOverrideSalePrice());
            bundleItemRequest.setRetailPriceOverride(orderItemRequestDTO.getOverrideRetailPrice());
            item = (EncOrderItem) orderItemService.createBundleOrderItem(bundleItemRequest);
        }
        
        item = (EncOrderItem) orderItemService.saveOrderItem(item);
        order.getOrderItems().add(item);
        order = orderService.save(order, false);
        
        request.setOrder(order);
        request.setAddedOrderItem(item);
        
        return context;
		}
}
