package com.enclothe.core.common.service;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.test.context.transaction.TransactionConfiguration;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.annotation.Resource;

import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.broadleafcommerce.core.catalog.dao.ProductDao;
import org.broadleafcommerce.core.catalog.service.CatalogServiceImpl;
import com.enclothe.core.dispute.domain.DisputeState;
import com.enclothe.core.dispute.service.DisputeStateService;
@RunWith(SpringJUnit4ClassRunner.class)
@TransactionConfiguration(transactionManager = "blTransactionManager", defaultRollback = false)
@ContextConfiguration(locations = { "/bl-applicationContext-test.xml"})
public class EncCatalogServiceImpl extends CatalogServiceImpl {
	@PersistenceContext(unitName="blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
    @Resource(name="blProductDao")
    protected ProductDao productDao;

	@Autowired
	protected DisputeStateService dss;
	
	/*@Test
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
	        
	     /*   Product prod = findProductById((long) 10302);
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
		
		//System.out.println("test" + newProduct)	;			
		
    //	System.out.println("test2"+design.getName())	;		
    	
    	System.out.println("table loaded");
    }*/
    
    @Test
    @Transactional
    public void TestDisputeState()
    {
    	
    	System.out.println("test started");
    	//DisputeStateService service = new DisputeStateServiceImpl();
//    	DisputeState disputeState = new DisputeStateImpl();
//    	disputeState.setName("Name");
//    	disputeState.setShortDescription("Desc1");
//    	dss.saveDisputeState(disputeState);
    	long disputeId = 301;
    	DisputeState disputeState = dss.readDisputeStateById(disputeId);
    	if(disputeState == null)
    		System.out.println("No Record");
    	else
    	{
    	System.out.println("name : " + disputeState.getName());
    	System.out.println("Short Description : " + disputeState.getShortDescription());
    	}
    	//dss.DeleteDisputeState(disputeState);
    	//System.out.println("Deleted Successfully");
//    	DisputeChannelDao dao = new DisputeChannelDaoImpl();
//    	DisputeChannelImpl disputeChannel = new DisputeChannelImpl();
//    	disputeChannel.setName("test");
//    	disputeChannel.setShortDescription("testdesc");
//    	disputeChannel.setLongDescription("long desc");
    	
    	//DisputeChannel disputechannel =em.merge(disputeChannel);
    	//DisputeChannel disputechannel =dao.save(disputeChannel);
    	
    /*	DisputeState disputeState = new DisputeStateImpl();
    	disputeState.setName("Name");
    	disputeState.setShortDescription("Desc");
    	em.merge(disputeState);
    	System.out.println("test channel id : " + disputeState.getId());*/
    }
    
    

    

}
