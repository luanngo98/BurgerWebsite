package com.burger.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.burger.constant.SystemConstant;
import com.burger.entity.BurgerEntity;
import com.burger.repository.UserRepository;
import com.burger.service.IBurgerService;
import com.burger.service.impl.BurgerService;
import com.burger.utils.SecurityUtils;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	
	@Autowired
	private IBurgerService burgerService;

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");

		System.out.println(SecurityUtils.getAuthorities());
		
		List<BurgerEntity> listBurger = burgerService.findAll();
		mav.addObject("listBurger", listBurger);
		return mav;
	}
	
	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public String login() {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		System.out.println(auth.getAuthorities());
//		if(auth.getAuthorities().contains("ADMIN")) {
//			return "redirect:/quan-tri/trang-chu";
//		}
		
		System.out.println(SecurityUtils.getAuthorities());
		if(SecurityUtils.getAuthorities().contains("ADMIN")) {
			return "redirect:/quan-tri/trang-chu";
		}

		return "login";
	}
	
	@RequestMapping(value = "/thoat", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		if(auth != null) {
//			new SecurityContextLogoutHandler().logout(request, response, auth);
//		}
		return new ModelAndView("redirect:/trang-chu");
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/dang-nhap?accessDenied");
	}
}
