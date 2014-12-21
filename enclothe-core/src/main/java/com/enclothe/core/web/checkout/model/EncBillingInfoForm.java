package com.enclothe.core.web.checkout.model;

import java.math.BigInteger;
import java.security.MessageDigest;

import org.broadleafcommerce.core.web.checkout.model.BillingInfoForm;

public class EncBillingInfoForm extends BillingInfoForm {

	private final static String accountId = "5880";
	private String referenceNo;
	private String amount;
	private String returnURL;
	public static String getAccountid() {
		return accountId;
	}


	public static String getMode() {
		return MODE;
	}


	public String getReturnURL() {
		return returnURL;
	}


	public void setReturnURL(String returnURL) {
		this.returnURL = returnURL;
	}


	private final static String  MODE = "TEST";
	
	public String getSecureHash() {
		String md5HashData = "ebskey";
		md5HashData += '|'+  accountId + '|'+ amount +'|'+ referenceNo +'|'+returnURL+'|'+
				MODE;

		String hash = null;
		try {
			 hash = md5(md5HashData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return hash;
	}

	
	private String md5(String str) throws Exception {
		MessageDigest m = MessageDigest.getInstance("MD5");

		byte[] data = str.getBytes();
		
		m.update(data,0,data.length);
		
		BigInteger i = new BigInteger(1,m.digest());
		
		String hash = String.format("%1$032X", i);
		
		return hash;
	}

	public String getAccountId() {
		return accountId;
	}


	public String getReferenceNo() {
		return referenceNo;
	}


	public void setReferenceNo(String referenceNo) {
		this.referenceNo = referenceNo;
	}


	public String getAmount() {
		return amount;
	}


	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	
}
