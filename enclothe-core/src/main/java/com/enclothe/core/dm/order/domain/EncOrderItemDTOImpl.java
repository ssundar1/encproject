package com.enclothe.core.dm.order.domain;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.enclothe.core.measurement.domain.Measurement;
import com.enclothe.core.measurement.domain.MeasurementImpl;
import com.enclothe.core.product.domain.EncDesign;
import com.enclothe.core.product.domain.EncDesignImpl;
import com.enclothe.core.product.domain.EncMaterial;
import com.enclothe.core.product.domain.EncMaterialImpl;
import com.enclothe.core.product.domain.EncTailor;
import com.enclothe.core.product.domain.EncTailorImpl;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_ORDER_ITEM_DTO")
public class EncOrderItemDTOImpl implements EncOrderItemDTO {


	@SuppressWarnings("unused")
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(generator= "OrderItemDTOId")
    @GenericGenerator(
        name="OrderItemDTOId",
        strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator",
        parameters = {
            @Parameter(name="segment_value", value="EncOrderItemDTOImpl"),
            @Parameter(name="entity_name", value="com.enclothe.core.dm.order.domain.EncOrderItemDTOImpl")
        }
    )
    @Column(name = "ORDER_ITEM_DTO_ID", nullable=false)
    protected Long id;

	@ManyToOne(targetEntity = EncMaterialImpl.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "MATERIAL_ID")
	protected EncMaterial material;
	
	@ManyToOne(targetEntity = EncTailorImpl.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "TAILOR_ID")
	protected EncTailor tailor;
	
	@ManyToOne(targetEntity = MeasurementImpl.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "MEASUREMENT_ID")
	protected Measurement measurement;

	@ManyToMany(targetEntity = EncDesignImpl.class, cascade = CascadeType.ALL)
    @JoinTable(name = "ENC_ORDER_ITEM_DTO_DESIGN_MAP", joinColumns = @JoinColumn(name = "ORDER_ITEM_DTO_ID"),
    inverseJoinColumns = @JoinColumn(name = "DESIGN_ID"))
	protected List<EncDesign> designs;

	@Column(name = "SESSION_ID")
	protected String sessionId;
	
 	@JoinColumn(name = "CUSTOMER_ID")
    protected Long customerId;

	@Column(name = "IP_ADDRESS")
	protected String ipAddress;
	
	@Column(name = "CREATION_DATE")
	protected Date creationDate;

	@Column(name = "END_DATE")
	protected Date endDate;
	
	@Override
	public Date getCreationDate() {
		return creationDate;
	}

	@Override
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	@Override
	public Date getEndDate() {
		return endDate;
	}

	@Override
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public EncMaterial getMaterial() {
		return material;
	}

	public void setMaterial(EncMaterial material) {
		this.material = material;
	}

	public List<EncDesign> getDesigns() {
			return designs;
	}

	public void setDesigns(List<EncDesign> designs) {
			this.designs = designs;
	}
	
	public EncTailor getTailor() {
		return tailor;
	}

	public void setTailor(EncTailor tailor) {
		this.tailor = tailor;
	}

	public Measurement getMeasurement() {
		return measurement;
	}

	public void setMeasurement(Measurement measurement) {
		this.measurement = measurement;
	}
	
	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	
	@Override
	public Long getCustomerId() {
		return customerId;
	}

	@Override
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

}
