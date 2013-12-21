package com.enclothe.core.serviceprovider.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.broadleafcommerce.common.persistence.EntityConfiguration;
import org.springframework.stereotype.Repository;

import com.enclothe.core.common.domain.UserCategory;
import com.enclothe.core.serviceprovider.domain.ServiceProvider;

@Repository("blServiceProviderDao")
public class ServiceProviderDaoImpl implements ServiceProviderDao {

	@PersistenceContext(unitName = "blPU")
    protected EntityManager em;
	
	@Resource(name = "blEntityConfiguration")
    protected EntityConfiguration entityConfiguration;
	
	@Override
	public ServiceProvider readServiceProviderById(Long ServiceProviderId) {
		ServiceProvider serviceProvider = null;
		final Query query = em.createNamedQuery("BC_READ_SERVICEPROVIDER_BY_ID");
        query.setParameter("id", ServiceProviderId);
        @SuppressWarnings("rawtypes")
        final List temp = query.getResultList();
        if (temp != null && !temp.isEmpty()) {
        	serviceProvider = (ServiceProvider) temp.get(0);
        }
        return serviceProvider;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<ServiceProvider> readServiceProvidersByFirstName(String FirstName) {
		Query query = em.createNamedQuery("BC_READ_SERVICEPROVIDER_BY_FIRST_NAME");
        query.setParameter("firstName", FirstName);        
        return query.getResultList();   
	}
	
	public ServiceProvider readServiceProviderByFirstName(String FirstName) {
		List<ServiceProvider> serviceProviders = readServiceProvidersByFirstName(FirstName);
        return serviceProviders == null || serviceProviders.isEmpty() ? null : serviceProviders.get(0);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<ServiceProvider> readServiceProvidersByLastName(String LastName) {
		Query query = em.createNamedQuery("BC_READ_SERVICEPROVIDER_BY_LAST_NAME");
        query.setParameter("lastName", LastName);        
        return query.getResultList();
	}
	
	@Override
	public ServiceProvider readServiceProviderByLastName(String LastName) {
		List<ServiceProvider> serviceProviders = readServiceProvidersByLastName(LastName);
        return serviceProviders == null || serviceProviders.isEmpty() ? null : serviceProviders.get(0);
	}

	@Override
	@SuppressWarnings("unchecked")
	public ServiceProvider readServiceProviderByFirmName(String FirmName) {
		Query query = em.createNamedQuery("BC_READ_SERVICEPROVIDER_BY_FIRM_NAME");
        query.setParameter("firmName", FirmName);        
        List<ServiceProvider> serviceProviders = query.getResultList();
        return serviceProviders == null || serviceProviders.isEmpty() ? null : serviceProviders.get(0);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ServiceProvider> readServiceProvidersByEmail(String Email) {
		Query query = em.createNamedQuery("BC_READ_SERVICEPROVIDER_BY_EMAIL");
        query.setParameter("emailAddress", Email);        
        return query.getResultList();
	}

	@Override
	public ServiceProvider readServiceProviderByEmail(String Email) {
        List<ServiceProvider> serviceProviders = readServiceProvidersByEmail(Email);
        return serviceProviders == null || serviceProviders.isEmpty() ? null : serviceProviders.get(0);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<ServiceProvider> readServiceProvidersByRegistered(
			Boolean registered) {
		Query query = em.createNamedQuery("BC_READ_SERVICEPROVIDER_BY_REGISTERED");
        query.setParameter("registered", registered);        
        return query.getResultList();
	}
	
	@Override
	public ServiceProvider readServiceProviderByRegistered(Boolean registered) {
		List<ServiceProvider> serviceProviders = readServiceProvidersByRegistered(registered);
        return serviceProviders == null || serviceProviders.isEmpty() ? null : serviceProviders.get(0);
	}	
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ServiceProvider> readServiceProvidersByUserCategory(
			UserCategory userCategory) {
		Query query = em.createNamedQuery("BC_READ_SERVICEPROVIDER_BY_USER_CATEGORY");
        query.setParameter("userCategory", userCategory);        
        return query.getResultList();
	}

	@Override
	public ServiceProvider readServiceProviderByUserCategory(
			UserCategory userCategory) {
		List<ServiceProvider> serviceProviders = readServiceProvidersByUserCategory(userCategory);
        return serviceProviders == null || serviceProviders.isEmpty() ? null : serviceProviders.get(0);
	}

	@Override
	public ServiceProvider save(ServiceProvider serviceProvider) {
		return em.merge(serviceProvider);
	}

	@Override
	public void delete(ServiceProvider serviceProvider) {
		if (!em.contains(serviceProvider)) {
			serviceProvider = readServiceProviderById(serviceProvider.getId());
        }
        em.remove(serviceProvider);		
	}

	@Override
	public ServiceProvider create() {
		final ServiceProvider serviceProvider = ((ServiceProvider) entityConfiguration.createEntityInstance("com.enclothe.core.serviceprovider.domain.ServiceProvider"));
        return serviceProvider;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<ServiceProvider> readServiceProvidersByUserName(String UserName) {
		Query query = em.createNamedQuery("BC_READ_SERVICEPROVIDER_BY_USER_NAME");
        query.setParameter("firstName", UserName);        
        return query.getResultList();   
	}
	
	public ServiceProvider readServiceProviderByUserName(String UserName) {
		List<ServiceProvider> serviceProviders = readServiceProvidersByFirstName(UserName);
        return serviceProviders == null || serviceProviders.isEmpty() ? null : serviceProviders.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ServiceProvider> getServiceProviders() {
		Query query = em.createNamedQuery("BC_READ_SERVICEPROVIDERS");
        return query.getResultList();   
	}
	
}
