package com.kh.manage.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("/showChatPage.ct")
	public String showChatPage() {
		return "user/chat/chatMainPage";
	}
	
	@RequestMapping("/showCreatChat.ct")
	public String showCreateChatPage() {
		return "user/chat/chatCreate";
	}
	
	@RequestMapping("/chatRoom.ct")
	public String showChatRoomPage() {
		return "user/chat/chatRoom";
	}
}
