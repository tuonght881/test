package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.DAO.UsersDAO;
import com.poly.entity.Users;
import com.poly.service.CookieService;
import com.poly.service.EmailSenderService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

@Controller
public class AccountController {
//tr thien dep traii
	@Autowired
	ParamService paramSer;

	@Autowired
	CookieService cookieSer;

	@Autowired
	SessionService ssSer;
	
	@Autowired
	EmailSenderService emailSer;

	@Autowired
	UsersDAO dao;

	@GetMapping("/account/login")
	public String getLogin(Model m) {

		String user = cookieSer.getValue("user");
		if (user != null) {
			String pass = cookieSer.getValue("pass");
			m.addAttribute("user", user);
			m.addAttribute("pass", pass);
		}

		return "/account/login";
	}

	@PostMapping("/account/login")
	public String postLogin(Model m) {
		String username = paramSer.getString("email", "");
		String password = paramSer.getString("password", "");
		boolean remember = paramSer.getBoolea("remember", false);

		Users u = dao.findByUsersEmailObject(username);
		if (u != null) {
			if (password.equalsIgnoreCase(u.getPasswords())) {

				if (u.isRoles() != true) {
					ssSer.setAttribute("username", u);
					if (remember) {
						cookieSer.create("user", username, 10);
						cookieSer.create("pass", password, 10);
					} else {
						cookieSer.delete("user");
						cookieSer.delete("pass");
					}

					return "redirect:/home/watch";
				} else {
					ssSer.setAttribute("username", u);
					if (remember) {
						cookieSer.create("user", username, 10);
						cookieSer.create("pass", password, 10);
					} else {
						cookieSer.delete("user");
						cookieSer.delete("pass");
					}
					return "redirect:/product/addproduct";
				}

			} else {

				m.addAttribute("errorPassword", true);
				return "/account/login";
			}

		} else {
			m.addAttribute("errorEmail", true);
			return "/account/login";
		}

	}
	
	// Đăng Ký
	@GetMapping("/account/register")
	public String getRegister() {

		
		return "/account/register";
	}
	
	
	public boolean kiemTra(Model m) {
		
		
		String fullname = paramSer.getString("fullname", "");
		String email = paramSer.getString("email", "");
		String password = paramSer.getString("passwords", "");
		
		if(fullname.equalsIgnoreCase("")) {
			m.addAttribute("errorNull", true);
			return false;
		}
		if(email.equalsIgnoreCase("")) {
			m.addAttribute("errorNull", true);
			return false;
		}
		if(password.equalsIgnoreCase("")) {
			m.addAttribute("errorNull", true);
			return false;
		}
		
		return true;
	}
	
	@PostMapping("/account/register")
	public String CreateAccount(Users u, Model m) {
		String username = paramSer.getString("email", "");
		Users ukt = dao.findByUsersEmailObject(username);
		
		if(kiemTra(m)) {
			if(ukt != null) {
				m.addAttribute("errorEmail", true);
			}else
			{
				dao.save(u);
				m.addAttribute("succ", true);
			}
		}
		
		return "/account/register";
	}
	
	// Lấy mã xác thực
	@PostMapping("/account/OTP")
	public String checkOTP(Model m) {
		String number1 = paramSer.getString("numberOne", "");
		String number2 = paramSer.getString("numberTwo", "");
		String number3 = paramSer.getString("numberThree", "");
		String number4 = paramSer.getString("numberFour", "");
		String OTP = number1 + number2 + number3 + number4;
		
		String ssOTP = ssSer.getAttribute("OTP");
		if(ssOTP.equalsIgnoreCase(OTP)) {
			return "/account/changePassword";
		}else {
			m.addAttribute("errorNull", true);
			return "/account/OTP";
		}
	}
	
	// Đổi mật khẩu mới
	
	@PostMapping("/account/changePassword")
	public String changePassword(Model m, Users user) {
		
		String pass = paramSer.getString("passwords", "");
		String pass2 = paramSer.getString("passwordsTwo", "");
		Users u = ssSer.getAttribute("user");
		
		if(pass2.equalsIgnoreCase(pass)) {
			user.setUsers_id(u.getUsers_id());
			user.setActive(u.isActive());
			user.setBlocked(u.isBlocked());
			user.setCreatedate(u.getCreatedate());
			user.setEmail(u.getEmail());
			user.setFailed_login_attempts(u.getFailed_login_attempts());
			user.setFullname(u.getFullname());
			user.setPasswords(pass2);
			user.setPhone(u.getPhone());
			user.setRoles(u.isRoles());
			
			dao.save(user);
			m.addAttribute("succ", true);
		}else {
			m.addAttribute("errorNull", true);
		}
		
		return "/account/changePassword";
	}
	
	// Quên mật khẩu
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
