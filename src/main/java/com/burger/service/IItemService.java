package com.burger.service;

import java.util.List;

import com.burger.entity.ItemEntity;

public interface IItemService {
	List<ItemEntity> findListItemsByOrderId(Long id);
	ItemEntity saveItem(ItemEntity item);
}
