package com.enclothe.core.payment.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.common.audit.AuditableListener;
import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.AdminPresentationClass;
import org.broadleafcommerce.common.presentation.PopulateToOneFieldsEnum;
import org.broadleafcommerce.common.presentation.client.VisibilityEnum;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.SQLDelete;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_Payment")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
public class PaymentImpl implements Payment {

	private static final long serialVersionUID = 1L;
	
	@Id
    @Column(name = "PaymentId", nullable=false)
    protected Long PaymentId;
    @Column(name = "PaymentMethod", nullable=false)
    protected int PaymentMethod;
    @Column(name = "Amount", nullable=true)
    protected float Amount;
    
    @Column(name = "Mode", nullable=true)
    protected String Mode;

	@Column(name = "TransactionID", nullable=true)
    protected String TransactionID;
    @Column(name = "ResponseCode", nullable=true)
    protected int ResponseCode;
    @Column(name = "ResponseMessage", nullable=true)
    protected String ResponseMessage;
    @Column(name = "Description", nullable=true)
    protected String Description;
    @Column(name = "IsFlagged", nullable=true)
    protected Boolean IsFlagged;
    @Column(name = "MerchantRefNo", nullable=true)
    protected String MerchantRefNo;
    @Column(name = "DateCreated", nullable=true)
    protected Date DateCreated;    

    @Column(name = "BillingEmail", nullable=true)
    protected String BillingEmail;

    @Column(name = "BillingName", nullable=true)
    protected String BillingName;
    
    @Column(name = "BillingPhone", nullable=true)
    protected String BillingPhone;
    
    @Column(name = "BillingAddress", nullable=true)
    protected String BillingAddress;
    
    @Column(name = "BillingState", nullable=true)
    protected String BillingState;
    
    @Column(name = "BillingCity", nullable=true)
    protected String BillingCity;
    
    @Column(name = "BillingPostalCode", nullable=true)
    protected String BillingPostalCode;
    
    @Column(name = "BillingCountry", nullable=true)
    protected String BillingCountry;
    
    @Column(name = "DeliveryName", nullable=true)
    protected String DeliveryName;
    
    @Column(name = "DeliveryPhone", nullable=true)
    protected String DeliveryPhone;
    
    @Column(name = "DeliveryAddress", nullable=true)
    protected String DeliveryAddress;
    
    @Column(name = "DeliveryState", nullable=true)
    protected String DeliveryState;
    
    @Column(name = "DeliveryCity", nullable=true)
    protected String DeliveryCity;
    
    @Column(name = "DeliveryPostalCode", nullable=true)
    protected String DeliveryPostalCode;
    
    @Column(name = "DeliveryCountry", nullable=true)
    protected String DeliveryCountry;
    
    

    @Override
	public Long getPaymentId() {
		return PaymentId;
	}

    @Override
	public void setPaymentId(Long PaymentId) {
		this.PaymentId = PaymentId;
	}
    
    @Override
	public int getPaymentMethod() {
		return PaymentMethod;
	}

    @Override
	public void setPaymentMethod(int PaymentMethod) {
		this.PaymentMethod = PaymentMethod;
	}
    @Override
	public float getAmount() {
		return Amount;
	}

    @Override
	public void setAmount(float Amount) {
		this.Amount = Amount;
	}
    @Override
    public String getMode() {
		return Mode;
	}
    @Override
	public void setMode(String mode) {
		Mode = mode;
	}
    @Override
	public String getTransactionID() {
		return TransactionID;
	}
    @Override
	public void setTransactionID(String transactionID) {
		TransactionID = transactionID;
	}
    @Override
	public int getResponseCode() {
		return ResponseCode;
	}
    @Override
	public void setResponseCode(int responseCode) {
		ResponseCode = responseCode;
	}
    @Override
	public String getResponseMessage() {
		return ResponseMessage;
	}
    @Override
	public void setResponseMessage(String responseMessage) {
		ResponseMessage = responseMessage;
	}
    @Override
	public String getDescription() {
		return Description;
	}
    @Override
	public void setDescription(String description) {
		Description = description;
	}
    @Override
	public Boolean getIsFlagged() {
		return IsFlagged;
	}
	@Override
	public void setIsFlagged(Boolean isFlagged) {
		IsFlagged = isFlagged;
	}
	@Override
	public String getMerchantRefNo() {
		return MerchantRefNo;
	}
	@Override
	public void setMerchantRefNo(String merchantRefNo) {
		MerchantRefNo = merchantRefNo;
	}
	@Override
	public Date getDateCreated() {
		return DateCreated;
	}
	@Override
	public void setDateCreated(Date dateCreated) {
		DateCreated = dateCreated;
	}
	@Override
	public String getBillingEmail() {
		return BillingEmail;
	}
	@Override
	public void setBillingEmail(String billingEmail) {
		BillingEmail = billingEmail;
	}
	@Override
	public String getBillingName() {
		return BillingName;
	}
	@Override
	public void setBillingName(String billingName) {
		BillingName = billingName;
	}
	@Override
	public String getBillingPhone() {
		return BillingPhone;
	}
	@Override
	public void setBillingPhone(String billingPhone) {
		BillingPhone = billingPhone;
	}
	@Override
	public String getBillingAddress() {
		return BillingAddress;
	}
	@Override
	public void setBillingAddress(String billingAddress) {
		BillingAddress = billingAddress;
	}
	@Override
	public String getBillingState() {
		return BillingState;
	}
	@Override
	public void setBillingState(String billingState) {
		BillingState = billingState;
	}
	@Override
	public String getBillingCity() {
		return BillingCity;
	}
	@Override
	public void setBillingCity(String billingCity) {
		BillingCity = billingCity;
	}
	@Override
	public String getBillingPostalCode() {
		return BillingPostalCode;
	}
	@Override
	public void setBillingPostalCode(String billingPostalCode) {
		BillingPostalCode = billingPostalCode;
	}

	public String getBillingCountry() {
		return BillingCountry;
	}
	@Override
	public void setBillingCountry(String billingCountry) {
		BillingCountry = billingCountry;
	}
	@Override
	public String getDeliveryName() {
		return DeliveryName;
	}
	@Override
	public void setDeliveryName(String deliveryName) {
		DeliveryName = deliveryName;
	}
	@Override
	public String getDeliveryPhone() {
		return DeliveryPhone;
	}
	@Override
	public void setDeliveryPhone(String deliveryPhone) {
		DeliveryPhone = deliveryPhone;
	}
	@Override
	public String getDeliveryAddress() {
		return DeliveryAddress;
	}
	@Override
	public void setDeliveryAddress(String deliveryAddress) {
		DeliveryAddress = deliveryAddress;
	}
	@Override
	public String getDeliveryState() {
		return DeliveryState;
	}
	@Override
	public void setDeliveryState(String deliveryState) {
		DeliveryState = deliveryState;
	}
	@Override
	public String getDeliveryCity() {
		return DeliveryCity;
	}
	@Override
	public void setDeliveryCity(String deliveryCity) {
		DeliveryCity = deliveryCity;
	}
	@Override
	public String getDeliveryPostalCode() {
		return DeliveryPostalCode;
	}
	@Override
	public void setDeliveryPostalCode(String deliveryPostalCode) {
		DeliveryPostalCode = deliveryPostalCode;
	}
	@Override
	public String getDeliveryCountry() {
		return DeliveryCountry;
	}
	@Override
	public void setDeliveryCountry(String deliveryCountry) {
		DeliveryCountry = deliveryCountry;
	}
}
