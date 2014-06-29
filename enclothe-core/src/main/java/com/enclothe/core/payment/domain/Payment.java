package com.enclothe.core.payment.domain;

import java.io.Serializable;
import java.util.Date;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.broadleafcommerce.common.audit.Auditable;

public interface Payment extends Serializable {
	
    /**
     * Gets the primary key.
     * 
     * @return the primary key
     */
	@Nonnull
    public Long getPaymentId();

    /**
     * Sets the primary key.
     * 
     * @param PaymentId the new primary key
     */
    public void setPaymentId(@Nonnull Long PaymentId);

    /**
     * Gets the PaymentMethod.
     * 
     * @return the PaymentMethod
     */
    @Nonnull
    public int getPaymentMethod();

    /**
     * Sets the PaymentMethod.
     * 
     * @param PaymentMethod the new name
     */
    public void setPaymentMethod(@Nonnull int PaymentMethod);

    /**
     * Gets the Amount
     * 
     * @return the Amount
     */
    @Nullable
    public float getAmount();
    
    /**
     * Sets the Amount.
     * 
     * @param Amount the new description
     */    
    
    public void setAmount(@Nullable float Amount);

	String getMode();

	void setMode(String mode);

	void setResponseMessage(String responseMessage);

	String getDescription();

	void setDescription(String description);

	Boolean getIsFlagged();

	String getResponseMessage();

	String getTransactionID();

	void setTransactionID(String transactionID);

	int getResponseCode();

	void setResponseCode(int responseCode);

	void setIsFlagged(Boolean isFlagged);

	Date getDateCreated();

	void setDateCreated(Date dateCreated);

	void setBillingEmail(String billingEmail);

	String getBillingEmail();

	void setBillingName(String billingName);

	String getBillingName();

	String getBillingPhone();

	String getMerchantRefNo();

	void setMerchantRefNo(String merchantRefNo);

	void setDeliveryPostalCode(String deliveryPostalCode);

	String getDeliveryCountry();

	void setDeliveryCountry(String deliveryCountry);

	String getDeliveryPostalCode();

	void setDeliveryCity(String deliveryCity);

	String getDeliveryCity();

	void setDeliveryState(String deliveryState);

	String getDeliveryState();

	String getDeliveryName();

	void setDeliveryName(String deliveryName);

	String getDeliveryPhone();

	void setDeliveryPhone(String deliveryPhone);

	String getDeliveryAddress();

	void setDeliveryAddress(String deliveryAddress);

	void setBillingPhone(String billingPhone);

	String getBillingAddress();

	void setBillingAddress(String billingAddress);

	String getBillingState();

	void setBillingState(String billingState);

	void setBillingCity(String billingCity);

	String getBillingPostalCode();

	String getBillingCity();

	void setBillingPostalCode(String billingPostalCode);

	void setBillingCountry(String billingCountry);
}
