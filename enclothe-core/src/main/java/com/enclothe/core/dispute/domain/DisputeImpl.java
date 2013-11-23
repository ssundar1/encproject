package com.enclothe.core.dispute.domain;

import java.util.Date;

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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.common.audit.AuditableListener;
import org.broadleafcommerce.core.order.domain.OrderItem;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.SQLDelete;

import com.enclothe.core.customer.domain.EncCustomerImpl;
import com.enclothe.core.dm.order.domain.EncOrderItemImpl;
//import com.enclothe.core.serviceprovider.domain.ServiceProvider;
//import com.enclothe.core.serviceprovider.domain.ServiceProviderImpl;

@Entity
@EntityListeners(value = { AuditableListener.class })
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_Dispute")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
@SQLDelete(sql="UPDATE ENC_Dispute SET END_DATE = now() WHERE DISPUTE_ID = ?")
public class DisputeImpl implements Dispute {

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(generator= "DisputeId")
    @GenericGenerator(
        name="DisputeId",
        strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator",
        parameters = {
            @Parameter(name="segment_value", value="DisputeImpl"),
            @Parameter(name="entity_name", value="com.enclothe.core.dispute.domain.DisputeImpl")
        }
    )
    @Column(name = "DISPUTE_ID", nullable=false)
    protected Long id;
	
	@OneToOne(targetEntity = EncOrderItemImpl.class)
    @JoinColumn(name = "ORDER_ITEM_ID",referencedColumnName="ORDER_ITEM_ID")
    @Index(name="DISPUTE_ORDERITEM_INDEX", columnNames={"ORDER_ITEM_ID"})
    protected OrderItem orderItem;
	
//	@OneToOne(targetEntity = ServiceProviderImpl.class)
//    @JoinColumn(name = "DISPUTE_SP_ID", referencedColumnName="SP_ID")
//    @Index(name="DISPUTE_SP_INDEX", columnNames={"DISPUTE_SP_ID"})
//    protected ServiceProvider serviceProvider;
	
	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE}, targetEntity = EncCustomerImpl.class)
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName="CUSTOMER_ID")
    @Index(name="DISPUTE_CUSTOMER_INDEX", columnNames={"CUSTOMER_ID"})
    protected Customer customer;
	
	@ManyToOne(targetEntity = DisputeStateImpl.class)
    @JoinColumn(name = "DISPUTE_STATE_ID", referencedColumnName="DISPUTE_STATE_ID")
    @Index(name="DISPUTE_STATE_INDEX", columnNames={"DISPUTE_STATE_ID"})
    protected DisputeState disputeState;
	
	@ManyToOne(targetEntity = DisputePriorityImpl.class)
    @JoinColumn(name = "DISPUTE_PRIORITY_ID", referencedColumnName="DISPUTE_PRIORITY_ID")
    @Index(name="DISPUTE_PRIORITY_INDEX", columnNames={"DISPUTE_PRIORITY_ID"})
    protected DisputePriority disputePriority;

	@ManyToOne(targetEntity = DisputeChannelImpl.class, optional=true)
    @JoinColumn(name = "DISPUTE_CHANNEL_ID", referencedColumnName="DISPUTE_CHANNEL_ID")
    @Index(name="DISPUTE_CHANNEL_INDEX", columnNames={"DISPUTE_CHANNEL_ID"})
    protected DisputeChannel disputeChannel;
	
	@Column(name = "END_DATE")
    protected Date endDate;
    
    @Embedded
    protected Auditable auditable = new Auditable();

    @Override
	public Long getId() {
		return id;
	}
    @Override
	public void setId(Long id) {
		this.id = id;
	}
    @Override
	public OrderItem getOrderItem() {
		return orderItem;
	}
    @Override
	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}
  //  @Override
//	public ServiceProvider getServiceProvider() {
//		return serviceProvider;
//	}
//    @Override
//	public void setServiceProvider(ServiceProvider serviceProvider) {
//		this.serviceProvider = serviceProvider;
//	}
    @Override
	public Customer getCustomer() {
		return customer;
	}
    @Override
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
    @Override
	public DisputeState getDisputeState() {
		return disputeState;
	}
    @Override
	public void setDisputeState(DisputeState disputeState) {
		this.disputeState = disputeState;
	}
    @Override
	public DisputePriority getDisputePriority() {
		return disputePriority;
	}
    @Override
	public void setDisputePriority(DisputePriority disputePriority) {
		this.disputePriority = disputePriority;
	}
    @Override
	public DisputeChannel getDisputeChannel() {
		return disputeChannel;
	}
    @Override
	public void setDisputeChannel(DisputeChannel disputeChannel) {
		this.disputeChannel = disputeChannel;
	}
    @Override
	public Date getEndDate() {
		return endDate;
	}
    @Override
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
    @Override
	public Auditable getAuditable() {
		return auditable;
	}
    @Override
	public void setAuditable(Auditable auditable) {
		this.auditable = auditable;
	}
}
