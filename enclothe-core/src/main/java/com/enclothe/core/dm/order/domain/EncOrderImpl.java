package com.enclothe.core.dm.order.domain;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.broadleafcommerce.core.order.domain.OrderImpl;
import org.broadleafcommerce.profile.core.domain.Address;
import org.broadleafcommerce.profile.core.domain.AddressImpl;
import org.hibernate.annotations.Index;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_ORDER")
public class EncOrderImpl extends OrderImpl implements EncOrder {

    @ManyToOne(cascade = CascadeType.ALL, targetEntity = AddressImpl.class, optional=false)
    @JoinColumn(name = "ADDRESS_ID")
    @Index(name="CUSTOMERADDRESS_ADDRESS_INDEX", columnNames={"ADDRESS_ID"})
    protected Address billingAddress;
    
    @Column(name = "RAW_RESPONSE")
    protected String rawResponse;
    
	@Override
	public Address getAddress() {
		
		return billingAddress;
	}

	@Override
	public void setAddress(Address address) {
		this.billingAddress = address;

	}

	@Override
	public String getRawResponse() {		
		return rawResponse;
	}

	@Override
	public void setRawResponse(String resp) {
		this.rawResponse = resp;

	}

}
