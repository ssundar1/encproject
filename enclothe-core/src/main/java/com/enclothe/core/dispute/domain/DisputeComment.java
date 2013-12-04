package com.enclothe.core.dispute.domain;

import java.io.Serializable;
import java.util.Date;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.core.order.domain.OrderItem;
import org.broadleafcommerce.profile.core.domain.Customer;

import com.enclothe.core.serviceprovider.domain.ServiceProvider;

public interface DisputeComment extends Serializable {
	@Nonnull
	public Long getId();

	public void setId(@Nonnull Long id);
	@Nonnull
	public Dispute getDispute();

	public void setDispute(@Nonnull Dispute dispute);
	@Nonnull
	public String getComment();

	public void setComment(@Nonnull String comment);
	@Nullable
	public DisputeChannel getDisputeChannel();

	public void setDisputeChannel(@Nullable DisputeChannel disputeChannel);
    
	public void setAuditable(@Nullable Auditable auditable);
	
	@Nullable
	public Auditable getAuditable();
}
