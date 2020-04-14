package com.kh.manage.forum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ForumController {

	@RequestMapping("/noticeMain.fo")
	public String noticeMain() {
		
		System.out.println("sdadsd");
		
		return "user/forum/noticeMain";
	}
	
	@RequestMapping("insertNotice.fo")
	public String insertNotice() {
		
		
		return "user/forum/insertNotice";
	}
	
}
