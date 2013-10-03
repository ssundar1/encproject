package com.enclothe.core.common.service;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import org.hibernate.annotations.QueryHints;
import org.hibernate.ejb.QueryHints;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.test.context.transaction.TransactionConfiguration;



import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.From;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Order;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;




import javax.annotation.Resource;

import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.core.catalog.dao.ProductDao;
import org.broadleafcommerce.core.catalog.domain.Category;
import org.broadleafcommerce.core.catalog.domain.CategoryImpl;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.domain.ProductImpl;
import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.catalog.domain.SkuImpl;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.catalog.service.CatalogServiceImpl;
import org.springframework.transaction.annotation.Transactional;

import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncDesignImpl;
import com.enclothe.core.product.domain.EncMaterial;
import com.enclothe.core.product.domain.EncMaterialImpl;
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "blTransactionManager", defaultRollback = false)
@ContextConfiguration(locations = { "/bl-applicationContext-test.xml"})
public class EncCatalogServiceImpl extends CatalogServiceImpl {
	@PersistenceContext(unitName="blPU")
    protected EntityManager em;
	 
	@Test
@Transactional



    public void saveProduct(){
		
        Calendar activeStartCal = Calendar.getInstance();
        activeStartCal.add(Calendar.DAY_OF_YEAR, -2);
        
        Calendar activeEndCal = Calendar.getInstance();
        activeEndCal.add(Calendar.DAY_OF_YEAR, -1);
		    Category category = new CategoryImpl();
	        category.setName("test category");
	        category.setActiveStartDate(activeStartCal.getTime());
	        System.out.println("create catgiry obj");
	        category = saveCategory(category);
	        
	        Sku newSku = new SkuImpl();
	        newSku.setName("test product");
	        newSku.setRetailPrice(new Money(44.99));
	        newSku.setActiveStartDate(activeStartCal.getTime());  
	        newSku.setDiscountable(true);
	        newSku =saveSku(newSku);
	        System.out.println("create sku obj");
	        Product newProduct = new EncMaterialImpl();
	        Product design = new EncDesignImpl();
	        System.out.println("create prod obj");
	        newProduct.setDefaultCategory(category);
	        design.setDefaultCategory(category);
	        System.out.println("create prd catgiry obj");
	        newProduct.setDefaultSku(newSku);
	        newSku.setName("Design Test");
	        design.setDefaultSku(newSku);
	        EncDesign encdesign =(EncDesign)design;
	        encdesign.setTest("my simple Design test");

	        EncMaterial encMaterial =(EncMaterial)newProduct;
	        encMaterial.setTest("my simple Material test");

	        newProduct = saveProduct(newProduct);
	        design = saveProduct(design);
	        
	        Product prod = findProductById((long) 10302);
	        EncDesign des = (EncDesign) prod;
	        System.out.println("find prod test"+prod.getClass()+"test coloumn"+des.getTest());
	        
	         prod = findProductById((long) 10351);
	         
	        System.out.println("find prod test"+prod.getClass());
	        CriteriaBuilder builder = em.getCriteriaBuilder();
	        CriteriaQuery<EncDesign> criteria = builder.createQuery(EncDesign.class);
	        Root<EncDesignImpl> product = criteria.from(EncDesignImpl.class);
	        criteria.select(product);
	        
	        // We only want results that match the product IDs
	        //criteria.where(product.get("id").as(Long.class).in(productIds));
	        TypedQuery<EncDesign> query = em.createQuery(criteria);
	        query.setHint(QueryHints.HINT_CACHEABLE, true);
	        query.setHint(QueryHints.HINT_CACHE_REGION, "query.Catalog");
	        
	        for( EncDesign des1: query.getResultList()){
	        System.out.println("inside loop"+des1.getTest());
	        }
		
		System.out.println("test" + newProduct)	;			
		
    	System.out.println("test2"+design.getName())	;		
    	
    	System.out.println("table loaded");
    }
    
    
    
    

    

}
