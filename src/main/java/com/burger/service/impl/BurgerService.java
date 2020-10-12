package com.burger.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.burger.entity.BurgerEntity;
import com.burger.repository.BurgerRepository;
import com.burger.service.IBurgerService;

@Service
public class BurgerService implements IBurgerService{

	@Autowired
	private BurgerRepository burgerRepository;
	
	@Override
	public List<BurgerEntity> findAll() {
		return burgerRepository.findAll();
	}

	@Override
	@Transactional
	public BurgerEntity save(BurgerEntity burger) {
		return burgerRepository.save(burger);
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for(long id : ids) {
			burgerRepository.delete(id);
		}
	}

	@Override
	public BurgerEntity get(long id) {
		return burgerRepository.findOne(id);
	}

	@Override
	@Transactional
	public void deleteOne(long id) {
		burgerRepository.delete(id);
	}

	@Override
	public List<BurgerEntity> search(String keyword) {
		return burgerRepository.search(keyword);
	}
	
	

}
