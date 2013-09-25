package com.enclothe.core.serviceprovider.domain;

import java.util.Date;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.profile.core.domain.Address;

public interface ServiceProviderAccountInfo {

	Long getId();
	
	void setId(Long id);
	
	String getAccountHolderName();
	
	void setAccountHolderName(String name);
	
	String getBankName();
	
	void setBankName(String bankName);
	
	String getBankIFSCCode();
	
	void setBankIFSCCode(String ifscCode);
	
	String getAccountNumber();
	
	void setAccountNumber(String accountNumber);
	
	String getBranch();
	
	void setBranch(String branch);	
	
	Address getBankAddress();
	
	void setBankAddress(Address add);
	
	String getAccountType();
	
	void setAccountType(String accountType);	
	
	Auditable getAuditable();

	void setAuditable(Auditable auditable);

	Date getEndDate();

	void setEndDate(Date endDate);	
	
	ServiceProvider getServiceProvider();
	
	void setServiceProvider(ServiceProvider sp);
}
