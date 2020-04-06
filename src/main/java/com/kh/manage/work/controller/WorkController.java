package com.kh.manage.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkController {

	@RequestMapping("/myWorkList.wk")
	public String myWorkList() {
		
		return "user/work/myWorkList";
	}
}
