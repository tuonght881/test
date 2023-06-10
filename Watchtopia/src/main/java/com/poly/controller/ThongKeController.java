package com.poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ThongKeController {

	@RequestMapping("/admin/thongke")
//	@ResponseBody
	public String showTK() {
		return "/admin/statistic";
	}
}
