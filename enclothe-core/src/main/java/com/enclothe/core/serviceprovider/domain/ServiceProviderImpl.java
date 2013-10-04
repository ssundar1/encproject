package com.enclothe.core.serviceprovider.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapKey;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.common.audit.AuditableListener;
import org.broadleafcommerce.common.locale.domain.Locale;
import org.broadleafcommerce.common.locale.domain.LocaleImpl;
import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.AdminPresentationClass;
import org.broadleafcommerce.common.presentation.AdminPresentationCollection;
import org.broadleafcommerce.common.presentation.AdminPresentationMap;
import org.broadleafcommerce.common.presentation.PopulateToOneFieldsEnum;
import org.broadleafcommerce.common.presentation.client.AddMethodType;
import org.broadleafcommerce.common.presentation.client.VisibilityEnum;
import org.broadleafcommerce.profile.core.domain.Address;
import org.broadleafcommerce.profile.core.domain.AddressImpl;
import org.broadleafcommerce.profile.core.domain.ChallengeQuestion;
import org.broadleafcommerce.profile.core.domain.ChallengeQuestionImpl;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Parameter;
import org.broadleafcommerce.profile.core.domain.CustomerImpl;

import com.enclothe.core.common.domain.UserCategory;
import com.enclothe.core.common.domain.UserCategoryImpl;


@Entity
@EntityListeners(value = { AuditableListener.class })
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_SERVICE_PROVIDER")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
@AdminPresentationClass(populateToOneFields = PopulateToOneFieldsEnum.TRUE, friendlyName = "ServiceProviderImpl_base")

public class ServiceProviderImpl extends CustomerImpl implements ServiceProvider{

	private static final long serialVersionUID = -2667332421333264215L;

	@Id
    @GeneratedValue(generator= "SPId")
    @GenericGenerator(
        name="SPId",
        strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator",
        parameters = {
            @Parameter(name="segment_value", value="ServiceProviderImpl"),
            @Parameter(name="entity_name", value="com.enclothe.core.serviceprovider.domain.ServiceProviderImpl")
        }
    )
    @AdminPresentation(friendlyName = "ServiceProviderImpl_Id", group = "ServiceProviderImpl_Primary_Key",
    visibility = VisibilityEnum.HIDDEN_ALL)
    @Column(name = "SP_ID", nullable=false)
    protected Long id;

    @Column(name = "USER_NAME")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_UserName", order = 4000, group = "ServiceProviderImpl_SP",
            visibility = VisibilityEnum.HIDDEN_ALL)
    protected String username;
	
    @Column(name = "SP_FIRST_NAME", nullable=true)
    @AdminPresentation(friendlyName = "ServiceProviderImpl_fname", order = 10, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL)    
    protected String firstName;    	
	
    @Column(name = "SP_LAST_NAME", nullable=true)
    @AdminPresentation(friendlyName = "ServiceProviderImpl_lname", order = 20, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL)    
    protected String lastName;    	
    
    @Column(name = "SP_EMAIL_ADDRESS")
    @Index(name = "SP_EMAIL_INDEX", columnNames = { "SP_EMAIL_ADDRESS" })
    @AdminPresentation(friendlyName = "ServiceProviderImpl_Email_Address", order = 1000, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL)
    protected String emailAddress;

    @Column(name = "SP_FIRM_NAME", nullable=false, unique=true)
    @AdminPresentation(friendlyName = "ServiceProviderImpl_firm_name", order = 20, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL)    
    protected String firmName;    	    
	
    @Column(name = "SP_SHORT_DESCRIPTION", nullable=true)
    @AdminPresentation(friendlyName = "ServiceProviderImpl_short_desc", order = 20, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL)    
    protected String shortDesc;    	  
    
    @Column(name = "SP_LONG_DESCRIPTION", nullable=true)
    @AdminPresentation(friendlyName = "ServiceProviderImpl_long_desc", order = 20, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL)    
    protected String longDesc;    
    
    @OneToOne(cascade = CascadeType.ALL, targetEntity = AddressImpl.class, optional=false)
    @JoinColumn(name = "ADDRESS_ID")
    @AdminPresentationCollection(friendlyName = "ServiceProviderImpl_address", order = 40,
    addType = AddMethodType.PERSIST,
    tab = Presentation.Tab.Name.Contact, tabOrder = Presentation.Tab.Order.Contact)    
    protected Address address;
    
    @ManyToOne(targetEntity = ChallengeQuestionImpl.class)
    @JoinColumn(name = "CHALLENGE_QUESTION_ID")
    @Index(name="SP_CHALLENGE_INDEX", columnNames={"CHALLENGE_QUESTION_ID"})
    @AdminPresentation(friendlyName = "ServiceProviderImpl_Challenge_Question", order = 50,
            tab = Presentation.Tab.Name.Advanced, tabOrder = Presentation.Tab.Order.Advanced,
            excluded = true)
    protected ChallengeQuestion challengeQuestion;

    @Column(name = "CHALLENGE_ANSWER")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_Challenge_Answer", order = 60,
            tab = Presentation.Tab.Name.Advanced, tabOrder = Presentation.Tab.Order.Advanced,
            excluded = true)
    protected String challengeAnswer;

    @Column(name = "PASSWORD")
    @AdminPresentation(excluded = true)
    protected String password;
    
    @Column(name = "PASSWORD_CHANGE_REQUIRED")
    @AdminPresentation(excluded = true)
    protected Boolean passwordChangeRequired = false;

    @Column(name = "RECEIVE_EMAIL")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_Receive_Email",order=70, 
            tab = Presentation.Tab.Name.Advanced, tabOrder = Presentation.Tab.Order.Advanced)
    protected Boolean receiveEmail = true;

    @Column(name = "IS_REGISTERED")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_Customer_Registered", order = 80,
            prominent = true, gridOrder = 4000)
    protected Boolean registered = false;  
    
    @Column(name = "DEACTIVATED")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_Customer_Deactivated", order=90,
        tab = Presentation.Tab.Name.Advanced, tabOrder = Presentation.Tab.Order.Advanced)
    protected Boolean deactivated = false;
    
    @Column(name = "ENCLOTHE_URL")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_enclothe_url", order = 20, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL)   
    protected String enclotheURL;
    
    @Column(name = "MERCHANT_URL")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_merchant_url", order = 20, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL)   
    protected String merchantURL;
    
    @Column(name = "CURRENT_CAPACITY")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_current_capacity", order = 20, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL)   
    protected String currentCapacity;
    
    @Column(name = "IMAGE_URL")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_image_url", order = 20, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL)   
    protected String imageURL;
    
    @Column(name = "LOGO_URL")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_logo_url", order = 20, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL)   
    protected String logoURL;
 
    @Column(name = "IS_FEATURED")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_is_featured", order = 20, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL)   
    protected Boolean isFeatured;


	@Embedded
    protected Auditable auditable = new Auditable();
    
    @Column(name = "END_DATE")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_End_Date", order = 200, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected Date endDate;
    
    @OneToOne(cascade = CascadeType.ALL, targetEntity = UserCategoryImpl.class, optional=false)
    @JoinColumn(name = "USER_CATEGORY_ID")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_user_category", order = 200, group = "ServiceProviderImpl_SP",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected UserCategory userCategory;
    
    @ManyToOne(targetEntity = LocaleImpl.class)
    @JoinColumn(name = "LOCALE_CODE")
    @AdminPresentation(friendlyName = "ServiceProviderImpl_Locale",order=4000,             
            tab = Presentation.Tab.Name.Advanced, tabOrder = Presentation.Tab.Order.Advanced,
        excluded = true, visibility = VisibilityEnum.GRID_HIDDEN)
    protected Locale spLocale;
    

    @OneToMany(mappedBy = "serviceProvider", targetEntity = ServiceProviderAttributeImpl.class, cascade = { CascadeType.ALL }, orphanRemoval = true)
    @Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
    @MapKey(name="name")
    @BatchSize(size = 50)
    @AdminPresentationMap(friendlyName = "ServiceProviderAttributesTitle",
        tab = Presentation.Tab.Name.Advanced, tabOrder = Presentation.Tab.Order.Advanced,
        deleteEntityUponRemove = true, forceFreeFormKeys = true, keyPropertyFriendlyName = "ServiceProviderImpl_Attribute_Name"
    )
    protected Map<String, ServiceProviderAttribute> spAttributes = new HashMap<String, ServiceProviderAttribute>();
    
    @Transient
    protected String unencodedPassword;

    public String getUnencodedPassword() {
		return unencodedPassword;
	}

	public void setUnencodedPassword(String unencodedPassword) {
		this.unencodedPassword = unencodedPassword;
	}

	@Transient
    protected String unencodedChallengeAnswer;
        
    public String getUnencodedChallengeAnswer() {
		return unencodedChallengeAnswer;
	}

	public void setUnencodedChallengeAnswer(String unencodedChallengeAnswer) {
		this.unencodedChallengeAnswer = unencodedChallengeAnswer;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirmName() {
		return firmName;
	}

	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}

	public String getShortDesc() {
		return shortDesc;
	}

	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}

	public String getLongDesc() {
		return longDesc;
	}

	public void setLongDesc(String longDesc) {
		this.longDesc = longDesc;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public ChallengeQuestion getChallengeQuestion() {
		return challengeQuestion;
	}

	public void setChallengeQuestion(ChallengeQuestion challengeQuestion) {
		this.challengeQuestion = challengeQuestion;
	}

	public String getChallengeAnswer() {
		return challengeAnswer;
	}

	public void setChallengeAnswer(String challengeAnswer) {
		this.challengeAnswer = challengeAnswer;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getPasswordChangeRequired() {
		return passwordChangeRequired;
	}

	public void setPasswordChangeRequired(Boolean passwordChangeRequired) {
		this.passwordChangeRequired = passwordChangeRequired;
	}

	public Boolean getReceiveEmail() {
		return receiveEmail;
	}

	public void setReceiveEmail(Boolean receiveEmail) {
		this.receiveEmail = receiveEmail;
	}

	public Boolean getRegistered() {
		return registered;
	}

	public void setRegistered(Boolean registered) {
		this.registered = registered;
	}

	public String getEnclotheURL() {
		return enclotheURL;
	}

	public void setEnclotheURL(String enclotheURL) {
		this.enclotheURL = enclotheURL;
	}

	public String getMerchantURL() {
		return merchantURL;
	}

	public void setMerchantURL(String merchantURL) {
		this.merchantURL = merchantURL;
	}

	public String getCurrentCapacity() {
		return currentCapacity;
	}

	public void setCurrentCapacity(String currentCapacity) {
		this.currentCapacity = currentCapacity;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public String getLogoURL() {
		return logoURL;
	}

	public void setLogoURL(String logoURL) {
		this.logoURL = logoURL;
	}

	public Auditable getAuditable() {
		return auditable;
	}

	public void setAuditable(Auditable auditable) {
		this.auditable = auditable;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public UserCategory getUserCategory() {
		return userCategory;
	}

	public void setUserCategory(UserCategory userCategory) {
		this.userCategory = userCategory;
	}

	public Locale getSpLocale() {
		return spLocale;
	}

	public void setSpLocale(Locale spLocale) {
		this.spLocale = spLocale;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Boolean getIsFeatured() {
		return isFeatured;
	}

	public void setIsFeatured(Boolean isFeatured) {
		this.isFeatured = isFeatured;
	}
	
	public Map<String, ServiceProviderAttribute> getServiceProviderAttributes()
	{
		return this.spAttributes;
	}
	
	public void setServiceProviderAttributes(Map<String, ServiceProviderAttribute> spAttributes)
	{
		this.spAttributes = spAttributes;
	}
	
	public void addServiceProviderAttributes(ServiceProviderAttribute spAttribute)
	{
		this.spAttributes.put(spAttribute.getName(), spAttribute);
	}
	
	public ServiceProviderAttribute getServiceProviderAttribute(String name)
	{
		return this.spAttributes.get(name);
	}
	
    public static class Presentation {

        public static class Tab {

            public static class Name {

                public static final String Contact = "CustomerImpl_Contact_Tab";
                public static final String Advanced = "CustomerImpl_Advanced_Tab";
            }

            public static class Order {

                public static final int Contact = 2000;
                public static final int Advanced = 3000;
            }
        }
    }

	@Override
	public boolean isRegistered() {
		if (registered == null) {
            return true;
        } else {
            return registered.booleanValue();
        }
	}    
	
	@Override
    public void setDeactivated(boolean deactivated) {
        this.deactivated = Boolean.valueOf(deactivated);
    }
	
	@Override
    public boolean isDeactivated() {
        if (deactivated == null) {
            return false;
        } else {
            return deactivated.booleanValue();
        }
    }
	
}
