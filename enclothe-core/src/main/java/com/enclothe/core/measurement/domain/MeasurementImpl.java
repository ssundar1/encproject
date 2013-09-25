package com.enclothe.core.measurement.domain;

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
import javax.persistence.Table;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.common.audit.AuditableListener;
import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.AdminPresentationClass;
import org.broadleafcommerce.common.presentation.PopulateToOneFieldsEnum;
import org.broadleafcommerce.common.presentation.client.VisibilityEnum;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.SQLDelete;

import com.enclothe.core.customer.domain.EncCustomerImpl;


@Entity
@EntityListeners(value = { AuditableListener.class })
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_MEASUREMENTS")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
@AdminPresentationClass(populateToOneFields = PopulateToOneFieldsEnum.TRUE, friendlyName = "MeasurementImpl_baseMeasurement")
@SQLDelete(sql="UPDATE ENC_MEASUREMENTS SET END_DATE = now() WHERE MEASUREMENT_ID = ?")
public class MeasurementImpl implements Measurement {

	private static final long serialVersionUID = 1L;
	
    @Id
    @GeneratedValue(generator= "MeasurementId")
    @GenericGenerator(
        name="MeasurementId",
        strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator",
        parameters = {
            @Parameter(name="segment_value", value="MeasurementImpl"),
            @Parameter(name="entity_name", value="com.enclothe.core.measurement.domain.MeasurementImpl")
        }
    )
    @AdminPresentation(friendlyName = "MeasurementImpl_Measurement_Id", group = "MeasurementImpl_Primary_Key",
    visibility = VisibilityEnum.HIDDEN_ALL)
    @Column(name = "MEASUREMENT_ID", nullable=false)
    protected Long id;
    

    @Column(name = "MEASUREMENT_NAME", nullable=false)
    @AdminPresentation(friendlyName = "MeasurementImpl_Name", order = 10, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL)    
    protected String name;    
    
    @Column(name = "MEASUREMENT_DESCRIPTION")
    @AdminPresentation(friendlyName = "MeasurementImpl_Description", order = 20, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL)       
    protected String description;
    
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE}, targetEntity = EncCustomerImpl.class, optional=true)
    @JoinColumn(name = "CUSTOMER_ID")
    @Index(name="MEASUREMENT_CUSTOMER_INDEX", columnNames={"CUSTOMER_ID"})
    @AdminPresentation(friendlyName = "MeasurementImpl_Customer", order = 30, group = "MeasurementImpl_Measurement",
    	    visibility = VisibilityEnum.HIDDEN_ALL)
    protected Customer customer;
    
    @Column(name = "HEIGHT")
    @AdminPresentation(friendlyName = "MeasurementImpl_Height", order = 40, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float height;
    
    @Column(name = "CHEST")
    @AdminPresentation(friendlyName = "MeasurementImpl_Chest", order = 50, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float chest;

    @Column(name = "BUST")
    @AdminPresentation(friendlyName = "MeasurementImpl_Bust", order = 60, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float bust;    

    @Column(name = "DARTLINE")
    @AdminPresentation(friendlyName = "MeasurementImpl_Dartline", order = 70, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float dartline;

    @Column(name = "WAIST")
    @AdminPresentation(friendlyName = "MeasurementImpl_Waist", order = 80, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float waist;

    @Column(name = "HIP")
    @AdminPresentation(friendlyName = "MeasurementImpl_Hip", order = 90, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float hip;

    @Column(name = "N_WAIST")
    @AdminPresentation(friendlyName = "MeasurementImpl_N_Waist", order = 100, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float nWaist;

    @Column(name = "SHOULDER")
    @AdminPresentation(friendlyName = "MeasurementImpl_Shoulder", order = 110, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float shoulder;

    @Column(name = "S_LENGTH")
    @AdminPresentation(friendlyName = "MeasurementImpl_S_Length", order = 120, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float sLength;

    @Column(name = "ARM_HOLE")
    @AdminPresentation(friendlyName = "MeasurementImpl_Arm_Hole", order = 130, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float armHole;

    @Column(name = "T_SLEEVE")
    @AdminPresentation(friendlyName = "MeasurementImpl_T_SLeeve", order = 140, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float tSleeve;

    @Column(name = "B_SLEEVE")
    @AdminPresentation(friendlyName = "MeasurementImpl_B_Sleeve", order = 150, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float bSleeve;

    @Column(name = "F_NECK")
    @AdminPresentation(friendlyName = "MeasurementImpl_F_Neck", order = 160, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float fNeck;

    @Column(name = "B_NECK")
    @AdminPresentation(friendlyName = "MeasurementImpl_B_Neck", order = 170, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float bNeck;

    @Column(name = "PANT_HEIGHT")
    @AdminPresentation(friendlyName = "MeasurementImpl_Pant_Height", order = 180, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float pantHeight;

    @Column(name = "SEAT")
    @AdminPresentation(friendlyName = "MeasurementImpl_Seat", order = 190, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected float seat;

    @Column(name = "END_DATE")
    @AdminPresentation(friendlyName = "MeasurementImpl_End_Date", order = 200, group = "MeasurementImpl_Measurement",
    visibility = VisibilityEnum.HIDDEN_ALL) 
    protected Date endDate;
    
    @Embedded
    protected Auditable auditable = new Auditable();



	@Override
	public Long getId() {
		return this.id;
	}

	@Override
	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public String getName() {
		return this.name;
	}

	@Override
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String getDescription() {
		return this.description;
	}

	@Override
	public void setDescription(String description) {
		this.description = description;

	}

	@Override
	public Customer getCustomer() {		
		return this.customer;
	}

	@Override
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Override
	public float getHeight() {
		return this.height;
	}

	@Override
	public void setHeight(float height) {
		this.height = height;
	}

	@Override
	public float getChest() {		
		return this.chest;
	}

	@Override
	public void setChest(float chest) {
		this.chest = chest;

	}

	@Override
	public float getBust() {
		return this.bust;
	}

	@Override
	public void setBust(float bust) {
		this.bust = bust;
	}

	@Override
	public float getDartline() {
		return this.dartline;
	}

	@Override
	public void setDartline(float dartline) {
		this.dartline = dartline;
	}

	@Override
	public float getWaist() {
		return this.waist;
	}

	@Override
	public void setWaist(float waist) {
		this.waist = waist;
	}

	@Override
	public float getHip() {
		return this.hip;
	}

	@Override
	public void setHip(float hip) {
		this.hip = hip;
	}

	@Override
	public float getNWaist() {
		return nWaist;
	}

	@Override
	public void setNWaist(float nWaist) {
		this.nWaist = nWaist;
	}

	public float getShoulder() {
		return shoulder;
	}

	public void setShoulder(float shoulder) {
		this.shoulder = shoulder;
	}

	public float getSleeveLength() {
		return sLength;
	}

	public void setSleeveLength(float sLength) {
		this.sLength = sLength;
	}

	public float getArmHole() {
		return armHole;
	}

	public void setArmHole(float armHole) {
		this.armHole = armHole;
	}

	public float getTSleeve() {
		return tSleeve;
	}

	public void setTSleeve(float tSleeve) {
		this.tSleeve = tSleeve;
	}

	public float getBSleeve() {
		return bSleeve;
	}

	public void setBSleeve(float bSleeve) {
		this.bSleeve = bSleeve;
	}

	public float getFrontNeck() {
		return fNeck;
	}

	public void setFrontNeck(float fNeck) {
		this.fNeck = fNeck;
	}

	public float getBackNeck() {
		return bNeck;
	}

	public void setBackNeck(float bNeck) {
		this.bNeck = bNeck;
	}

	public float getPantHeight() {
		return pantHeight;
	}

	public void setPantHeight(float pantHeight) {
		this.pantHeight = pantHeight;
	}

	public float getSeat() {
		return seat;
	}

	public void setSeat(float seat) {
		this.seat = seat;
	}

	@Override
	public void setAuditable(Auditable auditable) {
		this.auditable = auditable;

	}
	
	public Auditable getAuditable() {
		return auditable;
	}

	@Override
	public Date getEndDate() {
		return this.endDate;
	}

	@Override
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

}
