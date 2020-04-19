package com.kh.manage.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.chat.model.service.ChatService;
import com.kh.manage.chat.model.vo.ChatRoom;
import com.kh.manage.chat.model.vo.Message;
import com.kh.manage.member.model.vo.Member;

@Controller
public class ChatController {
	@Autowired
	private ChatService cs;
	
	@RequestMapping("/showChatPage.ct")
	public String showChatPage(Model model, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		
		List<ChatRoom> list = cs.selectAllChatRoom(m);
		
		model.addAttribute("list", list);
		
		return "user/chat/chatMainPage";
	}
	
	@RequestMapping("/showCreatChat.ct")
	public String showCreateChatPage(Model model) {
		
		List<DepartMent> list = cs.selectAllDeptList();
		
		model.addAttribute("dList", list);
		return "user/chat/chatCreate";
	}
	
	@RequestMapping("/chatRoom.ct")
	public String showChatRoomPage(ChatRoom cr, Model model) {
		
		List<Message> mList = cs.selectAllMessage(cr);
		ChatRoom crm = cs.selectOneChatRoom(cr);
		
		model.addAttribute("cr", cr);
		model.addAttribute("list", mList);
		
		return "user/chat/chatRoom";
	}
	
	@RequestMapping("/selectDeptMember.ct")
	public void selectDeptMember(DepartMent dept, HttpServletRequest request, HttpServletResponse response) {
		
		List<DeptMember> list = cs.selectDeptMember(dept);
		
		request.setAttribute("list", list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(list);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/chatCereate.ct")
	public String insertChatRoom(ChatRoom cr, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		
		cr.setCreateMemberNo(m.getMemberNo());
		
		String[] str = cr.getMemberNo().split(",");
		
		List<Member> member = new ArrayList<Member>();
		
		for(int i = 0; i < str.length ; i++) {
			Member me = new Member();
			me.setMemberNo(str[i]);
			
			member.add(me);
		}
		member.add(m);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", member);
		
		int result = cs.insertChatRoom(cr, member);
		
		return "redirect:showChatPage.ct";
	}
	
	@RequestMapping("/insertMessage.ct")
	public void insertMessage(String message) {
		String[] str = message.split(",");
    	
    	Message me = new Message();
    	me.setContent(str[0]);
    	me.setChatRoomNo(str[1]);
    	me.setSender(str[2]);
    	me.setContentType(str[3]);
    	
    	int result = cs.insertMessage(me);   
	}
	
	@RequestMapping("/selectDate.ct")
	public void selectDate(HttpServletRequest request, HttpServletResponse response) {
		String day = cs.selectDate();

		request.setAttribute("day", day);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(day);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
