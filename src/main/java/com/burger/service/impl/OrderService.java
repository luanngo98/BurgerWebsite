package com.burger.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.burger.entity.OrderEntity;
import com.burger.repository.OrderRepository;
import com.burger.service.IOrderService;

@Service
public class OrderService implements IOrderService {

	@Autowired
	private OrderRepository repo;
	
	@Override
	public List<OrderEntity> listAllOrder() {
		return repo.findAll();
	}

	@Override
	public OrderEntity saveOrder(OrderEntity order) {
		return repo.save(order);
	}

	@Override
	public OrderEntity getOrder(Long id) {
		return repo.getOne(id);
	}

}
