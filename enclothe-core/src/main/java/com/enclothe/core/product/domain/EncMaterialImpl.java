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

	 
	
    @Column(name = "IS_DUMMY")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_Customer_Registered", order = 80, prominent = true, gridOrder = 4000)
    protected Boolean isDummy = false;

	public Boolean getIsDummy() {
		return isDummy;
	}

	public void setIsDummy(Boolean isDummy) {
		this.isDummy = isDummy;
	}  
	@OneToOne(targetEntity=ServiceProviderImpl.class, optional=true)
	 @JoinColumn(name="SP_ID")
	  //@AdminPresentation(friendlyName = "MaterialImpl_Owner_id", order = 30, group = "MaterialImpl_Owner",   	    visibility = VisibilityEnum.HIDDEN_ALL)
	protected ServiceProvider serviceProvider;
   

	public ServiceProvider getServiceProvider() {
		return serviceProvider;
	}

	public void setServiceProvider(ServiceProvider serviceProvider) {
		this.serviceProvider = serviceProvider;
	}
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4325214477111206908L;
	
	@Column(name = "TYPE", nullable = false)
	  //  @AdminPresentation(friendlyName = "ServiceProviderImpl_Customer_Registered", order = 80, prominent = true, gridOrder = 4000)
	    protected String type;

		public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
