package com.enclothe.core.dm.order.dao;

import com.enclothe.core.dm.order.domain.EncOrderItemDTO;

public interface EncOrderItemDTODao {

	EncOrderItemDTO readActiveOrderItemDTOByCustomerId(Long customerId);

	EncOrderItemDTO readActiveOrderItemDTOBySessionId(String sessionId);

	EncOrderItemDTO readActiveOrderItemDTOByIP(String ipAddress);

	EncOrderItemDTO save(EncOrderItemDTO encOrderItemDTO);

	void delete(EncOrderItemDTO encOrderItemDTO);

	EncOrderItemDTO create(EncOrderItemDTO encOrderItemDTO);

	EncOrderItemDTO readOrderItemDTOById(Long id);

}
