package com.enclothe.core.dispute.domain;

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
@EntityListeners(value = { AuditableListener.class })
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_Dispute_States")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
@SQLDelete(sql="UPDATE ENC_Dispute_States SET END_DATE = now() WHERE DISPUTE_STATE_ID = ?")
public class DisputeStateImpl implements DisputeState {

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(generator= "DisputeStateId")
    @GenericGenerator(
        name="DisputeStateId",
        strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator",
        parameters = {
            @Parameter(name="segment_value", value="DisputeStateImpl"),
            @Parameter(name="entity_name", value="com.enclothe.core.dispute.domain.DisputeStateImpl")
        }
    )
    @Column(name = "DISPUTE_STATE_ID", nullable=false)
    protected Long id;
	
	@Column(name = "DISPUTE_STATE_NAME", nullable=false)
    protected String name;
	
	@Column(name = "DISPUTE_STATE_SHORT_DESC", nullable=true)
    protected String shortDescription;
	
	@Column(name = "DISPUTE_STATE_LONG_DESC", nullable=true)
    protected String longDescription;

	@Column(name = "END_DATE")
    protected Date endDate;
    
    @Embedded
    protected Auditable auditable = new Auditable();

	/**
	 * @return the id
	 */
    @Override
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
    @Override
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
    @Override
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
    @Override
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the shortDescription
	 */
    @Override
	public String getShortDescription() {
		return shortDescription;
	}

	/**
	 * @param shortDescription the shortDescription to set
	 */
    @Override
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	/**
	 * @return the longDescription
	 */
    @Override
	public String getLongDescription() {
		return longDescription;
	}

	/**
	 * @param longDescription the longDescription to set
	 */
    @Override
	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}

	/**
	 * @return the endDate
	 */
    @Override
	public Date getEndDate() {
		return endDate;
	}

	/**
	 * @param endDate the endDate to set
	 */
    @Override
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
    
	@Override
	public void setAuditable(Auditable auditable) {
		this.auditable = auditable;

	}
	
	@Override
	public Auditable getAuditable() {
		return auditable;
	}
}
