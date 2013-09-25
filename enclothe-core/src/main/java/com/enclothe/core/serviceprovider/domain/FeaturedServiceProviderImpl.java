package com.enclothe.core.serviceprovider.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.InheritanceType;

import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.client.VisibilityEnum;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Parameter;

 
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_SERVICE_PROVIDER_FEATURED")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region="blStandardElements")
public class FeaturedServiceProviderImpl implements FeaturedServiceProvider {

    @Id
    @GeneratedValue(generator= "FeaturedServiceProviderId")
    @GenericGenerator(
        name="FeaturedServiceProviderId",
        strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator",
        parameters = {
            @Parameter(name="segment_value", value="FeaturedServiceProviderImpl"),
            @Parameter(name="entity_name", value="com.enclothe.core.measurement.domain.FeaturedServiceProviderImpl")
        }
    )
    protected Long id;
	
    @Column(name = "SEQUENCE")
    @AdminPresentation(visibility = VisibilityEnum.HIDDEN_ALL)
    protected Long sequence;

    @Column(name = "PROMOTION_MESSAGE")
    protected String promotionMessage;
    
    @ManyToOne(targetEntity = ServiceProviderImpl.class)
    @JoinColumn(name = "SP_ID")
    @Index(name="SP_INDEX", columnNames={"SP_ID"})
    protected ServiceProvider serviceProvider;   
	
	@Override
	public Long getId() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public ServiceProvider getServiceProvider() {
		// TODO Auto-generated method stub
		return serviceProvider;
	}

	@Override
	public void setServiceProvider(ServiceProvider sp) {
		this.serviceProvider = sp;

	}

	@Override
	public void setSequence(Long sequence) {
		this.sequence = sequence;

	}

	@Override
	public Long getSequence() {
		// TODO Auto-generated method stub
		return sequence;
	}

	@Override
	public String getPromotionMessage() {
		// TODO Auto-generated method stub
		return this.promotionMessage;
	}

	@Override
	public void setPromotionMessage(String promotionMessage) {
		// TODO Auto-generated method stub
		this.promotionMessage = promotionMessage;
	}

	@Override
	public List<ServiceProvider> getRelatedServiceProviders() {
		// TODO Auto-generated method stub
		return null;
	}

}
