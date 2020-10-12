package com.burger.utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.burger.dto.MyUser;

public class SecurityUtils {

	public static MyUser getPrincipal() { // get thông tin user (bao gồm username, password, fullname) từ MyUser - những
											// thông tin user put vào MyUser trong CustomerUserDetailsService. Được sử dụng cho phần hiển thị tên user khi login thành công 
		MyUser myUser = (MyUser) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
		return myUser;
	}

	@SuppressWarnings("unchecked")
	public static List<String> getAuthorities() { // lấy danh sách roles
		List<String> results = new ArrayList<>();
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities(); // lấy role(s) của user đã được put vào list authorities từ
														// CustomUserDetailsService
		for (GrantedAuthority authority : authorities) {
			results.add(authority.getAuthority()); // put role(s) của user vào list results
		}
		return results;
	}
}
