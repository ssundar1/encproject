package com.enclothe.core.dispute.domain;

import java.io.Serializable;
import java.util.Date;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.broadleafcommerce.common.audit.Auditable;

public interface DisputeState extends Serializable {
	
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
     * Gets the Short Description
     * 
     * @return the Short Description
     */
    @Nullable
    public String getShortDescription();
    
    /**
     * Sets the Short Description.
     * 
     * @param Short Description the new description
     */    
    
    public void setShortDescription(@Nullable String shortDescription);
    
    @Nullable
	public String getLongDescription();

	/**
	 * @param longDescription the longDescription to set
	 */
    
	public void setLongDescription(@Nullable String longDescription);

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
