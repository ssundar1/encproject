package com.enclothe.core.serviceprovider.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.common.locale.domain.Locale;
import org.broadleafcommerce.profile.core.domain.Address;
import org.broadleafcommerce.profile.core.domain.ChallengeQuestion;

import com.enclothe.core.common.domain.UserCategory;

/**
 * Implementations of this interface are used to hold data about a Service Provider.
 * <br>
 * <br>
 * You should implement this class if you want to make significant changes to how the
 * Service provider is persisted.  If you just want to add additional fields then you should extend {@link ServiceProviderImpl}.
 *
 * @see {@link ServieProvierImpl}
 * @author Prashanth Doraiswamy
 * 
 */
public interface ServiceProvider extends Serializable {

	 	public Long getId();
	 
		public void setId(Long id);

		public String getFirstName();

		public void setFirstName(String firstName);
		
		public String getLastName();

		public void setLastName(String lastName);

		public String getFirmName();

		public void setFirmName(String firmName);

		public String getShortDesc();

		public void setShortDesc(String shortDesc);

		public String getLongDesc();

		public void setLongDesc(String longDesc);

		public Address getAddress();

		public void setAddress(Address address);
		
		public ChallengeQuestion getChallengeQuestion();

		public void setChallengeQuestion(ChallengeQuestion challengeQuestion);

		public String getChallengeAnswer();

		public void setChallengeAnswer(String challengeAnswer);

		public String getPassword();

		public void setPassword(String password);

		public Boolean getPasswordChangeRequired();

		public void setPasswordChangeRequired(Boolean passwordChangeRequired);

		public Boolean getReceiveEmail();

		public void setReceiveEmail(Boolean receiveEmail);

		public Boolean getRegistered();

		public void setRegistered(Boolean registered);

		public String getEnclotheURL();

		public void setEnclotheURL(String enclotheURL);

		public String getMerchantURL();
		
		public void setMerchantURL(String merchantURL);

		public String getCurrentCapacity();

		public void setCurrentCapacity(String currentCapacity);
		
		public String getImageURL();

		public void setImageURL(String imageURL);

		public String getLogoURL();

		public void setLogoURL(String logoURL);
		
		public Auditable getAuditable();

		public void setAuditable(Auditable auditable);

		public Date getEndDate();

		public void setEndDate(Date endDate);

		public UserCategory getUserCategory();

		public void setUserCategory(UserCategory userCategory);
		
		public Locale getSpLocale();

		public void setSpLocale(Locale spLocale);		

		public Boolean getIsFeatured();

		public void setIsFeatured(Boolean isFeatured);
		
		public Map<String, ServiceProviderAttribute> getServiceProviderAttributes();
		
		public void setServiceProviderAttributes(Map<String, ServiceProviderAttribute> spAttributes);
		
		public void addServiceProviderAttributes(ServiceProviderAttribute spAttribute);
		
		public ServiceProviderAttribute getServiceProviderAttribute(String name);
				
	 
}
