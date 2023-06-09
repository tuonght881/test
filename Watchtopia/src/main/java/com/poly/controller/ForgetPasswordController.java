package com.poly.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.DAO.UsersDAO;
import com.poly.entity.Users;
import com.poly.service.EmailSenderService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;


@Controller
public class ForgetPasswordController {

	@Autowired
	EmailSenderService emailSer;

	@Autowired
	ParamService paramSer;
	
	@Autowired
	SessionService ssSer;

	@Autowired
	UsersDAO dao;

	@GetMapping("/account/forgetPassword")
	public String index() {
		return "/account/forgetPassword";
	}

	@PostMapping("/account/forgetPassword")
	public String SendOTP(Model m) {

		String email = paramSer.getString("email", "");
		Users u = dao.findByUsersEmailObject(email);

		if (u == null) {
			m.addAttribute("errorNull", true);
			return "/account/forgetPassword";
		} else {

			try {
				int min = 1000;
				int max = 9999;
				int randomNumber = (int) (Math.floor(Math.random() * (max - min + 1)) + min);
				emailSer.sendSimpleEmail(email, 
				"Xác thực tài khoản email từ Watchtopia Shop",
				"Xin Chào,                                                                                                                                                                                                                    "
				
				+ "Bạn hoặc ai đó đã dùng email này để nhận mã xác thực. Để tiếp tục xử lý tài khoản, vui lòng nhập mã OTP là: " + randomNumber);
				
				ssSer.setAttribute("user", u);
				ssSer.setAttribute("OTP",String.valueOf(randomNumber));
				ssSer.setAttribute("pass", u.getPasswords());
				return "/account/OTP";
			} catch (Exception e) {
				return "/account/forgetPassword";
			}

		}

	}
	
	// Send Email Contact
	@PostMapping("/account/sendEmail")
	public String SendEmail(Model m) {
		try {
			String email = paramSer.getString("email", "");
			String fullname = paramSer.getString("fullname", "");
			String phone = paramSer.getString("phone", "");
			String content = paramSer.getString("content", "");
			
			emailSer.sendSimpleEmail(email, 
			"Feedback Email From Customer",
			"Xin Chào,                                                                                                                                                                                                                    "
			
			+ "Họ và Tên : " + fullname + " "
			+ content + " - thông tin liên hệ : " + phone);
			
			
			return "redirect:/home/watch";
		} catch (Exception e) {
			return "redirect:/home/watch";
		}
	}
}
