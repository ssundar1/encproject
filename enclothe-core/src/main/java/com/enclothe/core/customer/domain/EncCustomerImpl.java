package com.enclothe.core.customer.domain;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.MapKey;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.InheritanceType;

import org.broadleafcommerce.common.presentation.AdminPresentationMap;
import org.broadleafcommerce.profile.core.domain.CustomerImpl;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.measurement.domain.MeasurementImpl;
import com.enclothe.core.product.domain.EncTailor;
import com.enclothe.core.product.domain.EncTailorImpl;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_CUSTOMER")
public class EncCustomerImpl extends CustomerImpl implements EncCustomer {

	private static final long serialVersionUID = 6545097668293683751L;
	
   @OneToMany(mappedBy = "customer", targetEntity = MeasurementImpl.class, cascade = { CascadeType.ALL }, orphanRemoval = true)
    @Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
    @MapKey(name="name")
    @BatchSize(size = 50)
    @AdminPresentationMap(friendlyName = "MeasurementImpl_Measurement_Name",
            deleteEntityUponRemove = true, forceFreeFormKeys = true, keyPropertyFriendlyName = "MeasurementImpl_Measurement_Name",
            tab = Presentation.Tab.Name.Advanced, tabOrder = Presentation.Tab.Order.Advanced
    )
    protected Map<String, Measurement> measurements = new HashMap<String, Measurement>();

   @Override
   public Map<String, Measurement> getCustomerMeasurements() {
       return this.measurements;
   }

   @Override
   public void setCustomerMeasurements(Map<String, Measurement> measurements) {
	   this.measurements = measurements;
   }
   
   public void addMeasurement (Measurement measurement)
   {
	   Map<String, Measurement> m = this.measurements;
	   m.put(measurement.getName(), measurement);
	   
	   setCustomerMeasurements(m);
   }
   
	@OneToOne(targetEntity=MeasurementImpl.class, optional=true)
	@JoinColumn(name="DEF_MEASUREMENT_ID")	  
	protected Measurement preferredMeasurement;
	  
	@OneToOne(targetEntity=EncTailorImpl.class, optional=true)
	@JoinColumn(name="DEF_TAILOR_ID")	  
	protected EncTailor preferredTailor;
	
   	public Measurement getPreferredMeasurement() {
		return preferredMeasurement;
	}

	public void setPreferredMeasurement(Measurement preferredMeasurement) {
		this.preferredMeasurement = preferredMeasurement;
	}

	public EncTailor getPreferredTailor() {
		return preferredTailor;
	}

	public void setPreferredTailor(EncTailor preferredTailor) {
		this.preferredTailor = preferredTailor;
	}
		
}
