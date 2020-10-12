package com.burger.service;

import java.util.List;

import com.burger.entity.OrderEntity;

public interface IOrderService {
	List<OrderEntity> listAllOrder();
	OrderEntity saveOrder(OrderEntity order);
	OrderEntity getOrder(Long id);
}
