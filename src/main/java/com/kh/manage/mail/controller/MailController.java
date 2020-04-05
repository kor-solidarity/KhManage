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
	
	@RequestMapping("/mailStorage.ma")
	public String mailStorage() {
		
		return "user/mail/mailStorage";
	}
	
	@RequestMapping("/mailImportant.ma")
	public String mailImportant() {
		
		return "user/mail//mailImportant";
	}
	
	@RequestMapping("/mailTrash.ma")
	public String mailTrash() {
		
		return "user/mail//mailTrash";
	}
	
	@RequestMapping("/mailSent.ma")
	public String mailSent() {
		
		return "user/mail//mailSent";
	}
	@RequestMapping("/mailSpam.ma")
	public String mailSpam() {
		
		return "user/mail//mailSpam";
	}
	@RequestMapping("/mailNread.ma")
	public String mailNread() {
		
		return "user/mail//mailNread";
	}
	
}
























