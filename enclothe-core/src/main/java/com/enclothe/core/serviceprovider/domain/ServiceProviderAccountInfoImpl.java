package com.enclothe.core.serviceprovider.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.AdminPresentationClass;
import org.broadleafcommerce.common.presentation.AdminPresentationCollection;
import org.broadleafcommerce.common.presentation.client.AddMethodType;
import org.broadleafcommerce.common.presentation.client.VisibilityEnum;
import org.broadleafcommerce.profile.core.domain.Address;
import org.broadleafcommerce.profile.core.domain.AddressImpl;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Parameter;

//import com.enclothe.core.serviceprovider.domain.ServiceProviderImpl.Presentation;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name="ENC_SERVICE_PROVIDER_ACCOUNT_INFO")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region="blStandardElements")
//@AdminPresentationClass(friendlyName = "ServiceProviderAcctountInfoImpl_base")
public class ServiceProviderAccountInfoImpl implements
		ServiceProviderAccountInfo {

    /** The Constant serialVersionUID. */
    private static final long serialVersionUID = 1L;
    
    /** The id. */
    @Id
    @GeneratedValue(generator= "ServiceProviderAcctountInfoId")
    @GenericGenerator(
        name="ServiceProviderAcctountInfoId",
        strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator",
        parameters = {
            @Parameter(name="segment_value", value="ServiceProviderAcctountInfoImpl"),
            @Parameter(name="entity_name", value="com.enclothe.core.serviceprovider.domain.ServiceProviderAcctountInfoImpl")
        }
    )
    @Column(name = "SP_ACCOUNT_INFO_ID")
    protected Long id;
    
    /** The name. */
    @Column(name = "ACCOUNT_HOLDER_NAME", nullable=false)
    @Index(name="SP_ACCOUNT_HOLDER_NAME_INDEX", columnNames={"ACCOUNT_HOLDER_NAME"})
//    @AdminPresentation(friendlyName = "SPAccountInfoImpl_ahname", order = 20, group = "SPAccountInfoImpl_SP",
//    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected String accountHolderName;	
    
    @Column(name = "BANK_NAME", nullable=false)
//    @AdminPresentation(friendlyName = "SPAccountInfoImpl_bname", order = 20, group = "SPAccountInfoImpl_SP",
//    visibility = VisibilityEnum.HIDDEN_ALL)    
    protected String bankName;    	
    
    @Column(name = "BANK_IFSC_CODE", nullable=true)
//    @AdminPresentation(friendlyName = "SPAccountInfoImpl_ifsc", order = 20, group = "SPAccountInfoImpl_SP",
//    visibility = VisibilityEnum.HIDDEN_ALL)    
    protected String bankIFSCCode;
    
    @Column(name = "ACCOUNT_NO", nullable=true)
//    @AdminPresentation(friendlyName = "SPAccountInfoImpl_accNo", order = 20, group = "SPAccountInfoImpl_SP",
//    visibility = VisibilityEnum.HIDDEN_ALL)    
    protected String accountNumber;
    
    @Column(name = "BRANCH", nullable=true)
//    @AdminPresentation(friendlyName = "SPAccountInfoImpl_branch", order = 20, group = "SPAccountInfoImpl_SP",
//    visibility = VisibilityEnum.HIDDEN_ALL)    
    protected String branch;   
        
    @OneToOne(cascade = CascadeType.ALL, targetEntity = AddressImpl.class, optional=false)
    @JoinColumn(name = "BRANCH_ADDRESS_ID", referencedColumnName="ADDRESS_ID")
   /* @AdminPresentationCollection(friendlyName = "SPAccountInfoImpl_address", order = 40,
    addType = AddMethodType.PERSIST,
    tab = Presentation.Tab.Name.Contact, tabOrder = Presentation.Tab.Order.Contact)    */
    protected Address address;    
    
    @Column(name = "ACCOUNT_TYPE", nullable=true)
//    @AdminPresentation(friendlyName = "SPAccountInfoImpl_accType", order = 20, group = "SPAccountInfoImpl_SP",
//    visibility = VisibilityEnum.HIDDEN_ALL)    
    protected String accountType;
    
	@Embedded
    protected Auditable auditable = new Auditable();
    
    @Column(name = "END_DATE")
//    @AdminPresentation(friendlyName = "SPAccountInfoImpl_End_Date", order = 200, group = "ServiceProviderImpl_SP",
//    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected Date endDate;
    
    @ManyToOne(targetEntity = ServiceProviderImpl.class, optional=false)
    @JoinColumn(name = "SP_ID")
    @Index(name="SP_ACCOUNT_INFO_INDEX", columnNames={"SP_ID"})
    protected ServiceProvider serviceProvider;
    
	@Override
	public Long getId() {
		// TODO Auto-generated method stub
		return this.id;
	}

	@Override
	public void setId(Long id) {
		this.id = id;

	}

	@Override
	public String getAccountHolderName() {
		// TODO Auto-generated method stub
		return this.accountHolderName;
	}

	@Override
	public void setAccountHolderName(String name) {
		this.accountHolderName = name;
	}

	@Override
	public String getBankName() {
		// TODO Auto-generated method stub
		return this.bankName;
	}

	@Override
	public void setBankName(String bankName) {
		this.bankName = bankName;

	}

	@Override
	public String getBankIFSCCode() {
		// TODO Auto-generated method stub
		return this.bankIFSCCode;
	}

	@Override
	public void setBankIFSCCode(String ifscCode) {
		this.bankIFSCCode = ifscCode;

	}

	@Override
	public String getAccountNumber() {
		// TODO Auto-generated method stub
		return this.accountNumber;
	}

	@Override
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;

	}

	@Override
	public String getBranch() {
		// TODO Auto-generated method stub
		return this.branch;
	}

	@Override
	public void setBranch(String branch) {
		this.branch = branch;

	}

	@Override
	public Address getBankAddress() {
		// TODO Auto-generated method stub
		return this.address;
	}

	@Override
	public void setBankAddress(Address add) {
		this.address = add;

	}

	@Override
	public String getAccountType() {
		// TODO Auto-generated method stub
		return this.accountType;
	}

	@Override
	public void setAccountType(String accountType) {
		this.accountType = accountType;

	}

	@Override
	public Auditable getAuditable() {
		// TODO Auto-generated method stub
		return this.auditable;
	}

	@Override
	public void setAuditable(Auditable auditable) {
		this.auditable = auditable;

	}

	@Override
	public Date getEndDate() {
		// TODO Auto-generated method stub
		return this.endDate;
	}

	@Override
	public void setEndDate(Date endDate) {
		this.endDate = endDate;

	}

	@Override
	public ServiceProvider getServiceProvider() {
		// TODO Auto-generated method stub
		return this.serviceProvider;
	}

	@Override
	public void setServiceProvider(ServiceProvider sp) {
		this.serviceProvider = sp;

	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
