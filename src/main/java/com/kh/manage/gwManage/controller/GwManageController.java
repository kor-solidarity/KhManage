package com.kh.manage.gwManage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.manage.gwManage.model.service.GwManageService;
import com.kh.manage.gwManage.model.vo.GWork;

@Controller
public class GwManageController {
	
	@Autowired
	private GwManageService gs;
	
	@RequestMapping("gwManageMain.gwm")
	public String gwManageMain(Model m) {
		
		List<GWork> list = gs.selectAllList();
		
		System.out.println(list);
		
		m.addAttribute("list", list);
		
		return "user/gwManage/gwManageMain";
	}
	
}
