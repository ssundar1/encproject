package com.enclothe.core.dispute.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.core.order.domain.OrderItem;
import org.broadleafcommerce.profile.core.domain.Customer;

import com.enclothe.core.serviceprovider.domain.ServiceProvider;

public interface Dispute extends Serializable {
	@Nonnull
	public Long getId();

	public void setId(@Nonnull Long id);
	@Nonnull
	public OrderItem getOrderItem();

	public void setOrderItem(@Nonnull OrderItem orderItem);
//	@Nonnull
//	public ServiceProvider getServiceProvider();
//
//	public void setServiceProvider(@Nonnull ServiceProvider serviceProvider);
	@Nonnull
	public Customer getCustomer();

	public void setCustomer(@Nonnull Customer customer);
	@Nonnull
	public DisputeState getDisputeState();

	public void setDisputeState(@Nonnull DisputeState disputeState);
	@Nonnull
	public ServiceProvider getDisputeServiceProvider();

	public void setDisputeServiceProvider(@Nonnull ServiceProvider serviceProvider);
	@Nonnull
	public DisputePriority getDisputePriority();

	public void setDisputePriority(@Nonnull DisputePriority disputePriority);
	
	public List<DisputeComment> getDisputeComments();
	
	public void setDisputeComments(List<DisputeComment> disputeComments);
	
	@Nullable
	public DisputeChannel getDisputeChannel();

	public void setDisputeChannel(@Nullable DisputeChannel disputeChannel);

	/**
	 * @return the endDate
	 */
	@Nonnull
	public Date getEndDate();

	/**
	 * @param endDate the endDate to set
	 */
    
	public void setEndDate(@Nonnull Date endDate);
    
	public void setAuditable(@Nullable Auditable auditable);
	
	@Nullable
	public Auditable getAuditable();
}
