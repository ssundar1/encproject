package com.enclothe.core.dm.order.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.broadleafcommerce.profile.core.service.IdGenerationService;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Service;

import com.enclothe.core.customer.domain.EncCustomer;
import com.enclothe.core.dm.order.dao.EncOrderItemDTODao;
import com.enclothe.core.dm.order.domain.EncOrderItemDTO;

@Service("encOrderItemDTOService")
public class EncOrderItemDTOServiceImpl implements EncOrderItemDTOService {

    @Resource(name="encOrderItemDTODao")
    protected EncOrderItemDTODao encOrderItemDTODao;
    
    @Resource(name="blIdGenerationService")
    protected IdGenerationService idGenerationService;

    @Override
	public EncOrderItemDTO createEncOrderItemDTO() {
		return createEncOrderItemDTOFromId(null);
	}

	@Override
	public EncOrderItemDTO createEncOrderItemDTOFromId(Long id) {
		EncOrderItemDTO encOrderItemDTO = id != null ? readEncOrderItemDTOById(id) : null;
        if (encOrderItemDTO == null) {
        	encOrderItemDTO = encOrderItemDTODao.create(encOrderItemDTO);
            if (id != null) {
            	encOrderItemDTO.setId(id);
            } else {
            	encOrderItemDTO.setId(findNextEncOrderItemDTOId());
            }
        }
        return encOrderItemDTO;
	}

	@Override
	public EncOrderItemDTO createNewEncOrderItemDTO() {
		return createEncOrderItemDTOFromId(null);
	}
	
	@Override
	public Long findNextEncOrderItemDTOId() {
		return idGenerationService.findNextId("com.enclothe.core.dm.order.domain.EncOrderItemDTOImpl");
	}

	@Override
	public EncOrderItemDTO readEncOrderItemDTOById(Long id) {
		return encOrderItemDTODao.readOrderItemDTOById(id);
	}
	
	@Override
	public EncOrderItemDTO readActiveOrderItemDTOByCustomerId(Long customerId) {
		return encOrderItemDTODao.readActiveOrderItemDTOByCustomerId(customerId);
	}

	@Override
	public EncOrderItemDTO readActiveOrderItemDTOBySessionId(String sessionId) {
		return encOrderItemDTODao.readActiveOrderItemDTOBySessionId(sessionId);
	}

	@Override
	public EncOrderItemDTO readActiveOrderItemDTOByIP(String ipAddress) {
		return encOrderItemDTODao.readActiveOrderItemDTOByIP(ipAddress);
	}

	@Override
	public EncOrderItemDTO save(EncOrderItemDTO encOrderItemDTO) {
		return encOrderItemDTODao.save(encOrderItemDTO);
	}

	@Override
	public void delete(EncOrderItemDTO encOrderItemDTO) {

		encOrderItemDTODao.delete(encOrderItemDTO);
	}

	@Override
    public EncOrderItemDTO retrieveItemDTO(HttpServletRequest request)
    {
    	//Retrieve Customer Information
    	String sessionId = request.getSession().getId();
    	String ipAddress = request.getRemoteAddr();
  //     	EncCustomer customer = (EncCustomer) CustomerState.getCustomer(request);
       	EncOrderItemDTO encOrderItemDTO = null;
       	if(sessionId != null)
       		encOrderItemDTO = readActiveOrderItemDTOBySessionId(sessionId);       		
       	if(encOrderItemDTO == null && ipAddress != null)
       		encOrderItemDTO = readActiveOrderItemDTOByIP(ipAddress);
/*       	if(encOrderItemDTO == null && customer != null)
       		encOrderItemDTO = readActiveOrderItemDTOByCustomerId(customer.getId());
*/       	
       	return encOrderItemDTO;
    }

}
