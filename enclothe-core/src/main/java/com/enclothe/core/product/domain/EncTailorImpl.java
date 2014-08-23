package com.enclothe.core.product.domain;

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
@Table(name = "ENC_TAILOR")
public class EncTailorImpl extends ProductImpl implements EncNonCartableItem,EncTailor {

	private static final long serialVersionUID = 6545097668293683751L;
	
	@OneToOne(targetEntity=ServiceProviderImpl.class, optional=true)
	 @JoinColumn(name="SP_ID", nullable = false)
	  //@AdminPresentation(friendlyName = "MaterialImpl_Owner_id", order = 30, group = "MaterialImpl_Owner",   	    visibility = VisibilityEnum.HIDDEN_ALL)
	protected ServiceProvider serviceProvider;
  

	public ServiceProvider getServiceProvider() {
		return serviceProvider;
	}

	public void setServiceProvider(ServiceProvider serviceProvider) {
		this.serviceProvider = serviceProvider;
	}
	
}
