package com.burger.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.burger.entity.OrderEntity;

public interface OrderRepository extends JpaRepository<OrderEntity, Long>{
	
}
