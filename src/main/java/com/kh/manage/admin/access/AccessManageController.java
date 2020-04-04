package com.kh.manage.admin.access;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccessManageController {
	
	@RequestMapping("/accessManage.am")
	public String showAccessPage() {
		
		return "admin/accessManage/accessPage";
	}
	
	@RequestMapping("/insertaccessPage.am")
	public String showInsertAccessPage() {
		return "admin/accessManage/accessInsertForm";
	}
	
	@RequestMapping("/accessDetailPage.am")
	public String showAccessDetailPage() {
		return "admin/accessManage/accessDetail";
	}
}
