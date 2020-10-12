package com.burger.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.burger.entity.ItemEntity;
import com.burger.repository.ItemRepository;
import com.burger.service.IItemService;

@Service
public class ItemService implements IItemService{

	@Autowired
	private ItemRepository repo;
	
	@Override
	public ItemEntity saveItem(ItemEntity item) {
		return repo.save(item);
	}

	@Override
	public List<ItemEntity> findListItemsByOrderId(Long id) {
		return repo.findByOrderId(id);
	}

}
