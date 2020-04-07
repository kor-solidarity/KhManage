package com.kh.manage.mail.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.manage.mail.model.vo.Mail;

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
	@RequestMapping("/mailComplete.ma")
	public String mailComplete() {
		
		return "user/mail//mailComplete";
	}
	
	
	
	@RequestMapping("/sendMail")
	public String sendMail(Mail m) {
		
		System.out.println(m);
		
		
		
		
		return "";
	}
	
	
	
}
























