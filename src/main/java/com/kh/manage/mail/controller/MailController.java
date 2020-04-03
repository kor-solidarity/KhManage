package com.kh.manage.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class MailController {
	
	@RequestMapping("/mailMain.ma")
	public String mailMain() {
		
		return "user/mail/mailMain";
	}
	
}
