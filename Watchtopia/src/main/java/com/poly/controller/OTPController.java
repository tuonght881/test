package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.service.ParamService;
import com.poly.service.SessionService;

@Controller
public class OTPController {

	@Autowired
	ParamService paramSer;

	@Autowired
	SessionService ssSer;
	
	
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
}
