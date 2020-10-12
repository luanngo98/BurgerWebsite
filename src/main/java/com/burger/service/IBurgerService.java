package com.burger.service;

import java.util.List;

import com.burger.entity.BurgerEntity;

public interface IBurgerService {
	List<BurgerEntity> findAll();
	BurgerEntity get(long id);
	BurgerEntity save(BurgerEntity burger);
	void delete(long[] ids);
	void deleteOne(long id);
	List<BurgerEntity> search(String keyword);
}
