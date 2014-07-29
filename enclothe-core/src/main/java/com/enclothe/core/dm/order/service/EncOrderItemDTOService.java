package com.enclothe.core.dm.order.service;

import javax.servlet.http.HttpServletRequest;

import com.enclothe.core.dm.order.domain.EncOrderItemDTO;

public interface EncOrderItemDTOService {

	EncOrderItemDTO readActiveOrderItemDTOByCustomerId(Long customerId);

	EncOrderItemDTO readActiveOrderItemDTOBySessionId(String sessionId);

	EncOrderItemDTO readActiveOrderItemDTOByIP(String ipAddress);

	EncOrderItemDTO save(EncOrderItemDTO encOrderItemDTO);

	void delete(EncOrderItemDTO encOrderItemDTO);

	EncOrderItemDTO createEncOrderItemDTO();

	EncOrderItemDTO createEncOrderItemDTOFromId(Long id);

	EncOrderItemDTO createNewEncOrderItemDTO();

	Long findNextEncOrderItemDTOId();

	EncOrderItemDTO readEncOrderItemDTOById(Long id);

	EncOrderItemDTO retrieveItemDTO(HttpServletRequest request);
}
