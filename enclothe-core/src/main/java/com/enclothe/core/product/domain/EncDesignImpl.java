package com.enclothe.core.product.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.broadleafcommerce.core.catalog.domain.ProductImpl;
import com.enclothe.core.product.EncNonCartableItem;
import com.enclothe.core.serviceprovider.domain.ServiceProvider;
import com.enclothe.core.serviceprovider.domain.ServiceProviderImpl;
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_DESIGN")
public class EncDesignImpl extends ProductImpl implements EncNonCartableItem,EncDesign {

	private static final long serialVersionUID = 6545097668293683751L;
	
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

	//Determine whether its for Chudidhar or Blouse
	@Column(name = "TYPE", nullable = false)
	  //  @AdminPresentation(friendlyName = "ServiceProviderImpl_Customer_Registered", order = 80, prominent = true, gridOrder = 4000)
	    protected String type;

		public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	//Determine whether its for Front Neck or Back Neck or Sleeve design
	@Column(name = "CATEGORY", nullable = false)
	  //  @AdminPresentation(friendlyName = "ServiceProviderImpl_Customer_Registered", order = 80, prominent = true, gridOrder = 4000)
	    protected String category;

		public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
		

}
