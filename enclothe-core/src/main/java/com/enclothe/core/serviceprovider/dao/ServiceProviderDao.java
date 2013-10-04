/*
 * Copyright 2008-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.enclothe.core.serviceprovider.dao;

import com.enclothe.core.serviceprovider.domain.ServiceProvider;
import com.enclothe.core.common.domain.UserCategory;

import java.util.List;

/**
 * Implementations of this interface are used to manipulate Service Provider .
 * <br>
 * <br>
 * You should implement this class if you want to make significant changes to how the
 * Service provider is persisted.  If you just want to add additional fields then you should extend {@link ServiceProviderDaoImpl}.
 *
 * @see {@link ServieProvierDaoImpl}
 * @author Tamilselvan Palanisamy
 * 
 */

public interface ServiceProviderDao {

	public ServiceProvider readServiceProviderById(Long ServiceProviderId);
	
	public List<ServiceProvider> readServiceProvidersByUserName(String FirstName);
	
	public ServiceProvider readServiceProviderByUserName(String UserName);

    public List<ServiceProvider> readServiceProvidersByFirstName(String FirstName);
    
    public ServiceProvider readServiceProviderByFirstName(String FirstName);
    
    public List<ServiceProvider> readServiceProvidersByLastName(String LastName);
    
    public ServiceProvider readServiceProviderByLastName(String LastName);
        
    public ServiceProvider readServiceProviderByFirmName(String FirmName);

    public ServiceProvider readServiceProviderByEmail(String FirmName);
    
    public List<ServiceProvider> readServiceProvidersByEmail(String FirmName);
    
    public List<ServiceProvider> readServiceProvidersByRegistered(Boolean registered);
    
    public ServiceProvider readServiceProviderByRegistered(Boolean registered);
    
    public List<ServiceProvider> readServiceProvidersByUserCategory(UserCategory userCategory);
    
    public ServiceProvider readServiceProviderByUserCategory(UserCategory userCategory);

    public ServiceProvider save(ServiceProvider serviceProvider);

    public void delete(ServiceProvider serviceProvider);

    public ServiceProvider create();
    
}
