package com.burger.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.burger.entity.ItemEntity;

public interface ItemRepository extends JpaRepository<ItemEntity, Long>{
	
	@Query(value = "SELECT i FROM item i WHERE i.order.id = :id")
	public List<ItemEntity> findByOrderId(@Param("id") Long id);
}
