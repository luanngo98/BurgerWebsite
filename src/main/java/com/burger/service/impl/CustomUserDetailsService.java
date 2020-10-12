package com.burger.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.burger.constant.SystemConstant;
import com.burger.dto.MyUser;
import com.burger.entity.RoleEntity;
import com.burger.entity.UserEntity;
import com.burger.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService { // CustomUserDetailsService.class được sử dụng để
																		// authentication

	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException { // ở đây chỉ loadUsername
																								// chứ không load
																								// password vì password
																								// được ngầm định xử lí
																								// trong file cấu hình
																								// security
		UserEntity userEntity = userRepository.findOneByUserNameAndStatus(username, SystemConstant.ACTIVE_STATUS);

		if (userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}

		// get roles của thằng user
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (RoleEntity role : userEntity.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getCode())); // put role(s) của user vào list authorities
		}
		
		// put thông tin vào security sau khi user login vào hệ thống để duy trì thông tin user
//		User user = new User(userEntity.getUserName(), userEntity.getPassword(), true, true, true, true, authorities); // lí do set 4 thuộc tính là true thì click vào class User để xem chi tiết
		MyUser myUser = new MyUser(userEntity.getUserName(), userEntity.getPassword(), true, true, true, true,
				authorities);
		myUser.setFullName(userEntity.getFullName());

		return myUser; // trả về myUser là vì thằng myUser extends từ thg User, trong khi đó thg User
						// implements từ UserDetails
	}

}

