package com.kh.manage.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("/showChatPage.ct")
	public String showChatPage() {
		return "user/chat/chatMainPage";
	}
}
