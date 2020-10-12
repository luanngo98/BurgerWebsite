package com.burger.api.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.burger.entity.BurgerEntity;
import com.burger.service.IBurgerService;

@RestController(value = "burgerAPIOfAdmin")
public class BurgerAPI {

	@Autowired
	private IBurgerService service;
	
	@GetMapping(value = "/api/burger")
	public List<BurgerEntity> getAllBurger() {
		List<BurgerEntity> listBuger = new ArrayList<>(service.findAll());
		return listBuger;
	}

	@GetMapping(value = "/api/burger/{id}")
	public BurgerEntity getOneBurger(@PathVariable long id) {
		return service.get(id);
	}

	@PostMapping(value = "/api/burger")
	public BurgerEntity createBurger(@RequestBody BurgerEntity burgerEntity ) throws IllegalStateException, IOException {

//		if (thumbnail != null) {
//			String path = "/images/";
//			String fileName = thumbnail.getOriginalFilename();
//
//			if (!new File(path).exists()) {
//				new File(path).mkdirs();
//			}
//
//			File file = new File(path, fileName);
//			thumbnail.transferTo(file);
//
//			burgerEntity.setThumbnailName(fileName);
//			burgerEntity.setThumbnailData(path + fileName);
//			System.out.println(burgerEntity.getThumbnailData());
//		}

		return service.save(burgerEntity);
	}

	@PutMapping(value = "/api/burger")
	public BurgerEntity updateBurger(@RequestBody BurgerEntity burgerEntity) {
		if (service.get(burgerEntity.getId()) == null) {
			return null;
		}
		return service.save(burgerEntity);
	}

	@DeleteMapping(value = "/api/burger")
	public void deleteBurger(@RequestBody long[] ids) {
		service.delete(ids);
	}
}
