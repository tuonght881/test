package com.poly.filter_config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.poly.entity.Users;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class AuthInterceptor implements HandlerInterceptor {
	//ttest commit
	
	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		Users user = (Users) session.getAttribute("username"); // lấy từ session
		String error = "";
		if (user == null) { // chưa đăng nhập
			error = "Please login!";
		}
		// không đúng vai trò
		else if ((!user.isRoles() && uri.startsWith("/admin/"))||(!user.isRoles() && uri.startsWith("/product/"))) {
			error = "Access denied!";
		}
		if (error.length() > 0) { // có lỗi
			session.setAttribute("security-uri", uri);
			response.sendRedirect("/account/login?error=" + error);
			return false;
		}
		return true;
	}
}
