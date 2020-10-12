package com.burger.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@Configuration
@EnableJpaAuditing(auditorAwareRef = "auditorProvider")
public class JpaAuditingConfig {

	@Bean
	public AuditorAware<String> auditorProvider() {
		return new AuditorAwareImpl();
	}

	public static class AuditorAwareImpl implements AuditorAware<String> {

		@Override
		public String getCurrentAuditor() { // method này là nơi JpaAuditing get username (tức là spring security có
											// nhiệm vụ chứa thông tin, và nhiệm vụ của thằng jpa auditing là vô spring
											// security để get thông tin ra - cụ thể là username để nó insert và 2
											// column có annotation là createdby và lastmodifiedby)
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			if (authentication == null) {
				return null;
			}
			return authentication.getName(); // hàm getName() thuộc đối tượng Pricipal trong spring security, nó sẽ chứa
												// tất cả thông tin của người dùng. khi đăng nhập xong nó sẽ put tất cả
												// thông tin người dùng vào trong Principal của spring security và thằng
												// jpa auditing có nhiệm vụ là vào đó và lấy thông tin ra (trong đó có username )
		}

	}
}
