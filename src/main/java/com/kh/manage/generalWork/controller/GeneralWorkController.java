package com.kh.manage.generalWork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GeneralWorkController {
	
	@RequestMapping("/showGeneralWorkMain.gw")
	public String showGeneralWorkMain() {
		
		return "user/generalWork/generalWorkList";
	}
	
	@RequestMapping("/showInsertGeneralWorkPage.gw")
	public String showInsertGeneralWorkPage() {
		
		return "user/generalWork/generalWorkInsert";
	}
}
