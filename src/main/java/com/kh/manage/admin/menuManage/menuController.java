package com.kh.manage.admin.menuManage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class menuController {
	
	@RequestMapping("/menuManege.am")
	public String showMenuManagePage() {
		
		
		return "admin/menuManage/menuManage";
	}
}
