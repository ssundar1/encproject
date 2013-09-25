package com.enclothe.core.common.domain;

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
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@EntityListeners(value = { AuditableListener.class })
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "ENC_USER_CATEGORY")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blStandardElements")
public class UserCategoryImpl implements UserCategory {

	private static final long serialVersionUID = -3037170962262685796L;

    @Id
    @GeneratedValue(generator= "UserCategoryId")
    @GenericGenerator(
        name="UserCategoryId",
        strategy="org.broadleafcommerce.common.persistence.IdOverrideTableGenerator",
        parameters = {
            @Parameter(name="segment_value", value="UserCategoryImpl"),
            @Parameter(name="entity_name", value="com.enclothe.core.common.domain.UserCategoryImpl")
        }
    )	
    @Column(name = "USER_CATEGORY_ID", nullable=false)
    protected Long id;	
    
    @Column(name = "USER_CATEGORY_NAME", nullable=false)
    protected String name;   
    
    @Column(name = "USER_CATEGORY_DESCRIPTION", nullable=false)
    protected String desc;   
    
    @Embedded
    protected Auditable auditable = new Auditable();  
    
    @Column(name = "END_DATE")
    protected Date endDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Auditable getAuditable() {
		return auditable;
	}

	public void setAuditable(Auditable auditable) {
		this.auditable = auditable;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
 
	
}
