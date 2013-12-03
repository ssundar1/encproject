package com.enclothe.core.product.domain;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.MapKey;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.broadleafcommerce.common.presentation.AdminPresentationCollection;
import org.broadleafcommerce.common.presentation.AdminPresentationMap;
import org.broadleafcommerce.common.presentation.client.AddMethodType;
import org.broadleafcommerce.core.catalog.domain.ProductImpl;
import org.broadleafcommerce.profile.core.domain.CustomerImpl.Presentation;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.enclothe.core.dm.order.domain.EncOrderItemStateDetail;
import com.enclothe.core.dm.order.domain.EncOrderItemStateDetailImpl;
import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.measurement.domain.MeasurementImpl;
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

	@Column(name = "TYPE")
	  //  @AdminPresentation(friendlyName = "ServiceProviderImpl_Customer_Registered", order = 80, prominent = true, gridOrder = 4000)
	    protected String type;

		public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

		

}
