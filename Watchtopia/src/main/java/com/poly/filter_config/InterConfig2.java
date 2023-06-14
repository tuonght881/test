package com.poly.filter_config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.service.AuthInterceptor;

@Configuration
public class InterConfig2 implements WebMvcConfigurer{
	@Autowired
	AuthInterceptor auth;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(auth).addPathPatterns("/account/edit", "/account/updateinfo", "/account/changePassword", "/account/logout", "/account/profileUser", "/cart/add/*","/admin/**")
				.excludePathPatterns("/assets/**", "/admin/home/index");
	}
}
