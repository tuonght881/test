package com.poly.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poly.DAO.ThongKeDAO;
import com.poly.entity.ThongKe;

@Controller
public class ThongKeController {
ThongKeDAO tkDao;
	@RequestMapping("/admin/thongke")
//	@ResponseBody
	public String showTK(Model m) {
		List<ThongKe> listTK = tkDao.getListTK();
		m.addAttribute("listTK", listTK);
		
		return "/admin/statistic";
	}
}
