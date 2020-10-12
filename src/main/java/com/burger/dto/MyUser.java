package com.burger.dto;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class MyUser extends User {  // myUser là custom của class User - User: class trong spring security được sử
									// dụng để lưu trữ thông tin người dùng (như kiểu session), tuy nhiên nó chỉ lưu
									// thông tin chung như username, password và role. Nên tạo custom của User để
									// lưu những thông tin khác như fullname, address, ...

	public MyUser(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}
	
	private String fullName;

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
}
