package com.enclothe.core.measurement.domain;

import java.io.Serializable;
import java.util.Date;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.broadleafcommerce.common.audit.Auditable;
import org.broadleafcommerce.profile.core.domain.Customer;

/**
 * Implementations of this interface are used to hold data about a Measurement.
 *  A measurement is used to hold details about all kinds of measurement
 * <br>
 * <br>
 * You should implement this class if you want to make significant changes to how the
 * Measurement is persisted.  If you just want to add additional fields then you should extend {@link MeasurementImpl}.
 *
 * @see {@link MeasurementImpl}
 * @author Prashanth Doraiswamy
 * 
 */
public interface Measurement extends Serializable {
	
    /**
     * Gets the primary key.
     * 
     * @return the primary key
     */
	@Nonnull
    public Long getId();

    /**
     * Sets the primary key.
     * 
     * @param id the new primary key
     */
    public void setId(@Nonnull Long id);

    /**
     * Gets the name.
     * 
     * @return the name
     */
    @Nonnull
    public String getName();

    /**
     * Sets the name.
     * 
     * @param name the new name
     */
    public void setName(@Nonnull String name);

    /**
     * Gets the description
     * 
     * @return the description
     */
    @Nullable
    public String getDescription();
    
    /**
     * Sets the description.
     * 
     * @param description the new description
     */    
    
    public void setDescription(@Nonnull String description);
    
    @Nullable
    public Customer getCustomer();

    public void setCustomer(@Nullable Customer customer);
    
    @Nullable
    public float getHeight();
    
    public void setHeight(@Nullable float height);
    
    @Nullable
    public float getChest();
    
    public void setChest(@Nullable float chest);
    
    @Nullable
    public float getBust();
    
    public void setBust(@Nullable float bust); 
    
    @Nullable
    public float getDartline();
    
    public void setDartline(@Nullable float dartline);
    
    @Nullable
    public float getWaist();
    
    public void setWaist(@Nullable float waist);
    
    @Nullable
    public float getHip();
    
    public void setHip(@Nullable float hip);
    
    @Nullable
    public float getNWaist();
    
    public void setNWaist(@Nullable float nWaist);
    
    @Nullable
    public float getShoulder();
    
    public void setShoulder(@Nullable float shoulder);
    
    @Nullable
    public float getSleeveLength();
    
    public void setSleeveLength(@Nullable float sleeveLength);
    
    @Nullable
    public float getArmHole();
    
    public void setArmHole(@Nullable float armHole);
    
    @Nullable
    public float getTSleeve();
    
    public void setTSleeve(@Nullable float tSleeve);
    
    @Nullable
    public float getBSleeve();
    
    public void setBSleeve(@Nullable float bSleeve);
    
    @Nullable
    public float getFrontNeck();
    
    public void setFrontNeck(@Nullable float frontNeck);
    
    @Nullable
    public float getBackNeck();
    
    public void setBackNeck(@Nullable float backNeck);
    
    @Nullable
    public float getPantHeight();
    
    public void setPantHeight(@Nullable float pantHeight);
    
    @Nullable
    public float getSeat();
    
    public void setSeat(@Nullable float seat);
    
    @Nullable
    public Auditable getAuditable();

    public void setAuditable(@Nullable Auditable auditable);
    
    @Nullable
    public Date getEndDate();
    
    public void setEndDate(@Nullable Date endDate);
    
}
