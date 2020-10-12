package com.burger.controller.admin;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.burger.entity.ItemEntity;
import com.burger.entity.OrderEntity;
import com.burger.service.IItemService;
import com.burger.service.IOrderService;

@Controller(value = "orderControllerOfAdmin")
public class OrderController {
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IItemService itemService;
	
	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach/don-hang", method = RequestMethod.GET)
	public ModelAndView orderList() {
		ModelAndView mav = new ModelAndView("admin/order/order_list");
		List<OrderEntity> listOrder = orderService.listAllOrder();
		mav.addObject("listOrder", listOrder);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach/don-hang/chi-tiet", method = RequestMethod.GET)
	public ModelAndView viewDetail(@RequestParam("id") Long id) {
		ModelAndView mav = new ModelAndView("admin/order/order_detail");
		List<ItemEntity> items = itemService.findListItemsByOrderId(id);
		for(ItemEntity item : items) {
			System.out.println(item.getOrder().getId() + "||" + item.getBurger().getName() + "||" + item.getPrice() + "||" + item.getQuantity());
		}
		mav.addObject("items", items);
		
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach/don-hang/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editOrder(@RequestParam("id") Long id) {
		ModelAndView mav = new ModelAndView("admin/order/order_edit");
		OrderEntity order = new OrderEntity();
		if(id == null) {
			return new ModelAndView("redirect:/quan-tri/bai-viet/danh-sach/don-hang");
		}else {
			order = orderService.getOrder(id);
			if(order == null) {
				return new ModelAndView("redirect:/quan-tri/bai-viet/danh-sach/don-hang");
			}else {
				mav.addObject("order", order);
				return mav;
			}
		}
	}
	
	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach/don-hang/chinh-sua", method = RequestMethod.POST)
	public String saveOrder(@ModelAttribute("order") @Valid OrderEntity order, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "admin/order/order_edit";
		}else {
			orderService.saveOrder(order);
			return "redirect:/quan-tri/bai-viet/danh-sach/don-hang";
		}
		
	}
}
