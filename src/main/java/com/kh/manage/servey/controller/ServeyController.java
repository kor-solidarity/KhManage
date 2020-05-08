package com.kh.manage.servey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ServeyController {

	
	@RequestMapping("serveyMain.se")
	public String serveyMain() {
		
		return "user/servey/serveyMain"; 
	}
	
	
	
}
