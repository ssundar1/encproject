package com.enclothe.core.product.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.core.catalog.domain.ProductImpl;

import com.enclothe.core.product.EncCartableItem;
import com.enclothe.core.serviceprovider.domain.ServiceProvider;
import com.enclothe.core.serviceprovider.domain.ServiceProviderImpl;
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_MATERIAL")
public class EncMaterialImpl extends ProductImpl implements EncCartableItem, EncMaterial{

	/* @OneToOne(targetEntity=ServiceProviderImpl.class, optional=false)
	  @JoinColumn(name="MATERIAL_OWNER_ID")
	//  @AdminPresentationCollection(friendlyName="EncOrderItemImpl_state_detail", order=20, addType=AddMethodType.PERSIST, tab="EncOrderItemImpl_Advanced_Tab", tabOrder=3000)
	  protected ServiceProvider serviceProvider;

	public ServiceProvider getServiceProvider() {
		return serviceProvider;
	}

	public void setServiceProvider(ServiceProvider serviceProvider) {
		this.serviceProvider = serviceProvider;
	}
	
    @Column(name = "IS_DUMMY")
  //  @AdminPresentation(friendlyName = "ServiceProviderImpl_Customer_Registered", order = 80, prominent = true, gridOrder = 4000)
    protected Boolean isDummy = false;

	public Boolean getIsDummy() {
		return isDummy;
	}

	public void setIsDummy(Boolean isDummy) {
		this.isDummy = isDummy;
	}  
    */
	
	@Column(name = "TEST")
	  //  @AdminPresentation(friendlyName = "ServiceProviderImpl_Customer_Registered", order = 80, prominent = true, gridOrder = 4000)
	    protected String test;

		public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}
}
