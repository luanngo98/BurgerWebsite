package com.burger.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.burger.entity.BurgerEntity;
import com.burger.service.IBurgerService;
import com.burger.utils.MessageUtil;

@Controller(value = "burgerControllerOfAdmin")
public class BurgerController {
	
	@Autowired
	private IBurgerService burgerService;
	
	@Autowired
	private MessageUtil messageUtil;
	
	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach/san-pham", method = RequestMethod.GET)
	public ModelAndView burgerList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/burger/list");
		List<BurgerEntity> listBurger = burgerService.findAll();
		mav.addObject("listBurger", listBurger);
		
//		if(request.getParameter("message") != null) {
//			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
//			mav.addObject("message", message.get("message"));
//			mav.addObject("alert", message.get("alert"));
//		}
		
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach/san-pham/chinh-sua", method = RequestMethod.GET)
	public ModelAndView viewEditBurger(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/burger/edit");
		BurgerEntity model = new BurgerEntity();
		if(id != null) {
			model = burgerService.get(id);
			System.out.println("Id của bài viết: " + model.getId());
		}
		
//		if(request.getParameter("message") != null) {
//			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
//			mav.addObject("message", message.get("message"));
//			mav.addObject("alert", message.get("alert"));
//		}
		
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach/san-pham/them-moi", method = RequestMethod.POST)
	public String saveBurguer(@ModelAttribute("model") @Valid BurgerEntity burgerEntity, BindingResult result,  @RequestParam(value = "thumbnail") CommonsMultipartFile fileUpload, Model model) {
		if(result.hasErrors() && fileUpload.getOriginalFilename() == "") {
			model.addAttribute("error", "is required");
			return "admin/burger/edit";
		}
		else if (result.hasErrors()) {
			return "admin/burger/edit";
		}
		else if (fileUpload.getOriginalFilename() == "") {
			model.addAttribute("error", "is required");
			return "admin/burger/edit";
		}
		else {
				String path = "/images/";
				String fileName = fileUpload.getOriginalFilename();
				
				if(! new File(path).exists()) {
					new File(path).mkdirs();
				}
				
				File file = new File(path, fileName);
				try {
					fileUpload.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					System.out.println(e.toString());
//					e.printStackTrace();
				}
				
				burgerEntity.setThumbnailName(fileName);
				burgerEntity.setThumbnailData(path+fileName);
				System.out.println(burgerEntity.getThumbnailData());
			
				burgerService.save(burgerEntity);

			return "redirect:/quan-tri/bai-viet/danh-sach/san-pham";
		}
	}
	
	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach/san-pham/xoa")
	public String deleteBurger(@RequestParam long id) {
		burgerService.deleteOne(id);
		return "redirect:/quan-tri/bai-viet/danh-sach/san-pham";
	}
	
	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach/san-pham/tim-kiem", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam String keyword) {
		ModelAndView mav = new ModelAndView("admin/burger/list");
		List<BurgerEntity> listBurger = burgerService.search(keyword);
		mav.addObject("listBurger", listBurger);
		return mav;
	}
}