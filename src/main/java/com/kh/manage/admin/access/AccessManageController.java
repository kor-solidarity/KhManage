package com.kh.manage.admin.access;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.manage.admin.access.service.AccessService;
import com.kh.manage.admin.access.vo.Access;


@Controller
public class AccessManageController {
	
	@Autowired
	private AccessService as;
	
	@RequestMapping("/accessManage.am")
	public String showAccessPage(Model model) {
		
		List<Access> list = as.accessSelectAll();
		
		model.addAttribute("list", list);
		
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
	
	@RequestMapping("insertAccessGroup.am")
	public String insertAccessGroup(Access ac, Model model) {
		
		int result = as.insertAccessGroup(ac);
		
		return "redirect:accessManage.am";

	}
}
