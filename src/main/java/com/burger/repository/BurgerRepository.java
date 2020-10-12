package com.burger.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.burger.entity.BurgerEntity;

public interface BurgerRepository extends JpaRepository<BurgerEntity, Long> {

	@Query(value = "SELECT b FROM burger b WHERE b.name LIKE '%' || :keyword || '%'"
			+ " OR b.price LIKE '%' || :keyword || '%' ")
	public List<BurgerEntity> search(@Param("keyword") String keyword);

}
