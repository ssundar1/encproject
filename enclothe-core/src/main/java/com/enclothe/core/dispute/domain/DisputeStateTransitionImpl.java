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
import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.AdminPresentationClass;
import org.broadleafcommerce.common.presentation.PopulateToOneFieldsEnum;
import org.broadleafcommerce.common.presentation.client.VisibilityEnum;
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
import com.enclothe.core.serviceprovider.domain.ServiceProvider;
import com.enclothe.core.serviceprovider.domain.ServiceProviderImpl;

@Entity
@EntityListeners(value = { AuditableListener.class })
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_Dispute_State_Transition")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
public class DisputeStateTransitionImpl implements DisputeStateTransition {

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(generator= "DisputeStateTransitionId")
    @GenericGenerator(
        name="DisputeStateTransitionId",
        strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator",
        parameters = {
            @Parameter(name="segment_value", value="DisputeStateTransitionImpl"),
            @Parameter(name="entity_name", value="com.enclothe.core.dispute.domain.DisputeStateTransitionImpl")
        }
    )
    @Column(name = "DISPUTE_STATE_TRANSITION_ID", nullable=false)
    protected Long id;
	
	@ManyToOne(targetEntity = DisputeImpl.class, optional=false)
    @JoinColumn(name = "DISPUTE_ID",referencedColumnName="DISPUTE_ID")
    @Index(name="DISPUTE_INDEX", columnNames={"DISPUTE_ID"})
    protected Dispute dispute;
	
	@ManyToOne(targetEntity = DisputeStateImpl.class, optional=false)
    @JoinColumn(name = "DISPUTE_STATE_ID", referencedColumnName="DISPUTE_STATE_ID")
    @Index(name="DISPUTE_STATE_INDEX", columnNames={"DISPUTE_STATE_ID"})
    protected DisputeState disputeState;
	
	@ManyToOne(targetEntity = DisputeChannelImpl.class, optional=true)
    @JoinColumn(name = "DISPUTE_CHANNEL_ID", referencedColumnName="DISPUTE_CHANNEL_ID")
    @Index(name="DISPUTE_CHANNEL_INDEX", columnNames={"DISPUTE_CHANNEL_ID"})
    protected DisputeChannel disputeChannel;
		
	@Column(name = "UPDATED_BY")
    protected Long updatedBy;
    
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
	public Dispute getDispute() {
		return dispute;
	}

    @Override
	public void setDispute(Dispute dispute) {
		this.dispute = dispute;
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
	public DisputeChannel getDisputeChannel() {
		return disputeChannel;
	}

    @Override
	public void setDisputeChannel(DisputeChannel disputeChannel) {
		this.disputeChannel = disputeChannel;
	}

    @Override
	public Long getUpdatedBy() {
		return updatedBy;
	}

    @Override
	public void setUpdatedBy(Long updatedBy) {
		this.updatedBy = updatedBy;
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
