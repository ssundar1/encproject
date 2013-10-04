package com.enclothe.core.dispute.domain;

import java.io.Serializable;
import java.util.Date;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.profile.core.domain.Customer;

public interface DisputeStateTransition extends Serializable {
	@Nonnull
	public Long getId();
	
	public void setId(@Nonnull Long id);

	@Nonnull
	public Dispute getDispute();

	public void setDispute(@Nonnull Dispute dispute);

	@Nonnull
	public DisputeState getDisputeState();

	public void setDisputeState(@Nonnull DisputeState disputeState);

	@Nullable
	public DisputeChannel getDisputeChannel();

	public void setDisputeChannel(@Nullable DisputeChannel disputeChannel);
	
	@Nullable
	public Long getUpdatedBy();

	public void setUpdatedBy(@Nullable Long updatedBy);
    
	public void setAuditable(@Nullable Auditable auditable);
	
	@Nullable
	public Auditable getAuditable();
}
