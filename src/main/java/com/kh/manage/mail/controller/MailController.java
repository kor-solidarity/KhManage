package com.kh.manage.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class MailController {
	
	@RequestMapping("/mailMain.ma")
	public String mailMain() {
		
		return "user/mail/mailMain";
	}
	
	@RequestMapping("/mailReceived.ma")
	public String mailReceived() {
		
		return "user/mail/mailReceived";
	}
	
	@RequestMapping("/mailSend.ma")
	public String mailSend() {
		
		return "user/mail/mailSend";
	}
	
	
}
