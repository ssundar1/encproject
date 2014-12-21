package com.enclothe.core.common.domain;

import java.io.Serializable;
import java.util.Date;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.broadleafcommerce.common.audit.Auditable;

public interface UserCategory extends Serializable{
	
	@Nonnull
	public Long getId();

	public void setId(@Nonnull Long id);
	
	@Nonnull
	public String getName();

	public void setName(@Nonnull String name);
	
	@Nullable
	public String getDesc();

	public void setDesc(@Nullable String desc);
	
	public Auditable getAuditable();

	public void setAuditable(Auditable auditable);

	@Nullable
	public Date getEndDate();

	public void setEndDate(@Nullable Date endDate);

}
