package com.burger.controller.web;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.burger.entity.BurgerEntity;
import com.burger.entity.ItemEntity;
import com.burger.entity.OrderEntity;
import com.burger.service.IBurgerService;
import com.burger.service.IItemService;
import com.burger.service.IOrderService;

@Controller
public class CartController {

	@Autowired
	private IBurgerService burgerService;

	@Autowired
	private IOrderService orderService;

	@Autowired
	private IItemService itemService;

	@RequestMapping(value = "/them-vao-gio")
	public String addToCart(HttpServletRequest request, HttpServletResponse response) {
		int quantity = 1;
		long id;

		// truyền lên url 1 burgerId != null
		if (request.getParameter("burgerId") != null) {
			id = Long.parseLong(request.getParameter("burgerId"));
			BurgerEntity burger = burgerService.get(id);
			// check xem burger có tồn tại hay k
			if (burger != null) {
				// check xem quantity khi thêm có khác null k
				if (request.getParameter("quantity") != null) {
					quantity = Integer.parseInt(request.getParameter("quantity"));
					System.out.println(quantity);
				}
				// tạo httpsession
				HttpSession session = request.getSession();
				if (session.getAttribute("order") == null) { // lần đầu thêm sản phẩm vào giỏ hàng ->
																// session.getAttribute("order") == null
					OrderEntity order = new OrderEntity();
					List<ItemEntity> listItems = new ArrayList<ItemEntity>();
					ItemEntity item = new ItemEntity();
					item.setQuantity(quantity);
					item.setBurger(burger);
					item.setPrice(burger.getPrice());
					item.setOrder(order);
					listItems.add(item);
					order.setItems(listItems);
					session.setAttribute("order", order); // tạo session có attribue là order
				} else { // trường hợp đã tạo giỏ hàng
					OrderEntity order = (OrderEntity) session.getAttribute("order");
					List<ItemEntity> listItems = order.getItems();
					boolean check = false;
					for (ItemEntity item : listItems) {
						if (item.getBurger().getId() == burger.getId()) {
							item.setQuantity(item.getQuantity() + quantity);
							check = true;
						}
					}
					if (check == false) {
						ItemEntity item = new ItemEntity();
						item.setQuantity(quantity);
						item.setBurger(burger);
						item.setPrice(burger.getPrice());
						item.setOrder(order);
						listItems.add(item);
					}
					session.setAttribute("order", order);
				}
			}
			return "redirect:/trang-chu#menu";
		} else {
			return "redirect:/trang-chu#menu";
		}
	}

	@RequestMapping(value = "/tang-so-luong")
	public String addQuantity(HttpServletRequest request) {
		int quantity = 1;
		long id;

		if (request.getParameter("burgerId") != null) { // check param
			id = Long.parseLong(request.getParameter("burgerId"));
			BurgerEntity burger = burgerService.get(id);

			if (burger != null) { // check burger có tổn tại hay k
				HttpSession session = request.getSession();
				OrderEntity order = (OrderEntity) session.getAttribute("order");
				if (order != null) { // tránh trường hợp session timeout thì order = null
					List<ItemEntity> listItems = order.getItems();
					for (ItemEntity item : listItems) {
						if (item.getBurger().getId() == burger.getId()) {
							item.setQuantity(item.getQuantity() + quantity);
						}
					}
				}
				return "redirect:/cart#info";
			} else {
				return "redirect:/trang-chu#menu";
			}
		} else {
			return "redirect:/trang-chu#menu";
		}

	}

	@RequestMapping(value = "/giam-so-luong")
	public String subQuantity(HttpServletRequest request) {
		int quantity = 1;
		long id;

		if (request.getParameter("burgerId") != null) { // check param
			id = Long.parseLong(request.getParameter("burgerId"));
			BurgerEntity burger = burgerService.get(id);

			if (burger != null) { // check burger có tổn tại hay k
				HttpSession session = request.getSession();
				OrderEntity order = (OrderEntity) session.getAttribute("order");
				if (order != null) { // tránh trường hợp session timeout thì order = null
					List<ItemEntity> listItems = order.getItems();
					Iterator<ItemEntity> iterator = listItems.iterator();
					while(iterator.hasNext()) {
						ItemEntity item = iterator.next();
						if (item.getBurger().getId() == burger.getId()) {
							item.setQuantity(item.getQuantity() - quantity);
							if(item.getQuantity() == 0) {
								iterator.remove();
							}
						}
					}
				}
				return "redirect:/cart#info";
			} else {
				return "redirect:/trang-chu#menu";
			}
		} else {
			return "redirect:/trang-chu#menu";
		}
	}

	@RequestMapping(value = "/xoa")
	public String deleteItem(HttpServletRequest request) {
		long id;

		if (request.getParameter("burgerId") != null) { // check param
			id = Long.parseLong(request.getParameter("burgerId"));
			BurgerEntity burger = burgerService.get(id);

			if (burger != null) { // check burger có tổn tại hay k
				HttpSession session = request.getSession();
				OrderEntity order = (OrderEntity) session.getAttribute("order");
				if (order != null) { // tránh trường hợp session timeout thì order = null
					List<ItemEntity> listItems = order.getItems();
					Iterator<ItemEntity> iterator = listItems.listIterator();
					while (iterator.hasNext()) {
						ItemEntity item = iterator.next();
						if (item.getBurger().getId() == burger.getId()) {
							iterator.remove();
						}
					}
				}
				return "redirect:/cart#info";
			} else {
				return "redirect:/trang-chu#menu";
			}
		} else {
			return "redirect:/trang-chu#menu";
		}
	}

	@RequestMapping(value = "/cart")
	public String viewCart() {
		return "web/cart";
	}

	@RequestMapping(value = "/dat-hang")
	public String order(HttpServletRequest request, HttpServletResponse response, @RequestParam("username") String name,
			@RequestParam("address") String address, @RequestParam("phone") String phone,
			@RequestParam("totalPrice") Double totalPrice) {

		HttpSession session = request.getSession();
		OrderEntity order = (OrderEntity) session.getAttribute("order");

		if (order != null) {
			// xử lý order
			order.setUserName(name);
			order.setAddress(address);
			order.setPhone(phone);
			order.setOrderDate((new java.util.Date()).toString());
			order.setStatus("Đang xử lý");
			order.setTotalPrice(totalPrice);
			orderService.saveOrder(order);

			// xử lý item
			List<ItemEntity> listItems = order.getItems();
			for (ItemEntity item : listItems) {
				item.setBurger(item.getBurger());
				item.setOrder(item.getOrder());
				item.setPrice(item.getPrice());
				item.setQuantity(item.getQuantity());
				itemService.saveItem(item);
			}

			session.removeAttribute("order");
			return "web/order_success";
		} else {
			return "redirect:/cart";
		}

	}
}
