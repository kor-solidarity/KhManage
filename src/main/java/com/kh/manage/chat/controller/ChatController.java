package com.kh.manage.chat.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.chat.model.service.ChatService;
import com.kh.manage.chat.model.vo.ChatMessageList;
import com.kh.manage.chat.model.vo.ChatRoom;
import com.kh.manage.chat.model.vo.Message;
import com.kh.manage.chat.model.vo.SearchKeyWord;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.timeLine.model.vo.TimeLine;

@Controller
public class ChatController {
	@Autowired
	private ChatService cs;
	
	@RequestMapping("/showChatPage.ct")
	public String showChatPage(Model model, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		
		List<ChatRoom> list = cs.selectAllChatRoom(m);
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setMemberNo(m.getMemberNo());
			int count = cs.chatCount(list.get(i));
			list.get(i).setCount(count);
		}
		
		model.addAttribute("list", list);
		
		return "user/chat/chatMainPage";
	}
	@RequestMapping("/showTimeLine.ct")
	public String showTimeLine(Model model) {
		
		List<Member> mList = cs.selectAllMember();
		List<TimeLine> tList = cs.selectAllTimeLine();
		
		model.addAttribute("mList", mList);
		model.addAttribute("tList", tList);
		
		return "user/chat/timeLine";
	}
	
	@RequestMapping("/selectAllMessageCount.ct")
	public void selectAllMessageCount(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Member m = (Member) session.getAttribute("loginUser");
		
		List<ChatRoom> list = cs.selectAllChatRoom(m);
		int num = 0;
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setMemberNo(m.getMemberNo());
			int count = cs.chatCount(list.get(i));
			num += count;
		}
		
		
		request.setAttribute("num", num);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(num);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/showCreatChat.ct")
	public String showCreateChatPage(Model model) {
		
		List<DepartMent> list = cs.selectAllDeptList();
		
		model.addAttribute("dList", list);
		return "user/chat/chatCreate";
	}
	
	@RequestMapping("/chatRoom.ct")
	public String showChatRoomPage(ChatRoom cr, Model model, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		cr.setMemberNo(m.getMemberNo());
		int result = cs.updateChatAccessDate(cr);
		
		List<ChatMessageList> mList = cs.selectAllMessage(cr);
		
		
		System.out.println("========================"+ mList);
		
//		for(int i = 0; i < mList.size(); i++) {
//			mList.get(i).setReadCount(cs.getReadCount(mList.get(i)));
//		}
		ChatRoom crm = cs.selectOneChatRoom(cr);
		
		List<Member> list = cs.selectAllChatMember(cr);
		System.out.println(list);
		
		model.addAttribute("cr", crm);
		model.addAttribute("list", mList);
		model.addAttribute("m", list);
		
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
		String[] str = message.split("`");
    	
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
	
	@RequestMapping("/selectLastMessage.ct")
	public void selectLastMessage(ChatRoom cr, HttpServletRequest request, HttpServletResponse response) {
		String day = cs.selectLastMessage(cr);
		
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
	
	@RequestMapping("/selectChatList.ct")
	public void selectChatList(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Member m = (Member) session.getAttribute("loginUser");
		
		List<ChatRoom> list = cs.selectAllChatRoom(m);
		
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
	
	@RequestMapping("/insertInfoMessage.ct")
	public void insertInfoMessage(String message, HttpServletRequest request, HttpServletResponse response) {
		String[] str = message.split("`");
    	
    	Message me = new Message();
    	me.setContent(str[0]);
    	me.setChatRoomNo(str[1]);
    	me.setSender("M999");
    	me.setContentType(str[3]);
    	me.setStatus(str[5]);
		System.out.println("메세지 객체~~~~~~~~~~~~~~~~~~: " + me);
    	String date = cs.selectInsertDateInfo(me);
    	me.setContent(date);
    	System.out.println("값~~~~~~~~~~~~~~~~~~: " + date);
    	
    	int result = cs.insertMessage(me);  
    	

		request.setAttribute("date", date);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(date);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/selectImg.ct")
	public void selectImg(Member m) {
		
		System.out.println("회원정보 : " + m);
	}
	
	@RequestMapping("/leaveChatRoom.ct")
	public String leaveChatRoom(ChatRoom cr, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		
		cr.setMemberNo(m.getMemberNo());
		
		ChatRoom crCheck = cs.checkChatRoom(cr);
		if(crCheck != null) {
			List<ChatRoom> changeMember = cs.changeMember(crCheck);
			
			if(changeMember != null) {
			crCheck.setMemberNo(changeMember.get(0).getMemberNo());

			int result = cs.chatRoomChangeMemberNo(crCheck);
			
			if(result > 0) {
				int result2 = cs.deleteChatMember(cr);
				}
			
			}else {
				int result2 = cs.deleteChatMember(cr);
				if(result2 > 0) {
					int result3 = cs.deleteChatRoom(cr);
				}
			}
		}else {
			int result2 = cs.deleteChatMember(cr);
		}
		
		return "redirect:showChatPage.ct";
	}
	
	@RequestMapping("/deleteInfo.ct")
	public void deletInfo(String text) {
		String[] str = text.split("`");
		System.out.println(str);
		
		
		Message me = new Message();
    	me.setContent(str[0]);
    	me.setChatRoomNo(str[1]);
    	me.setSender("M999");
    	me.setContentType(str[3]);
    	me.setStatus(str[5]);
    	
    	int result = cs.insertInfoMessage(me);
	}
	
	@RequestMapping("/plusSearchMember.ct")
	public void plusSearchMember(SearchKeyWord sw, HttpServletRequest request, HttpServletResponse response) {
		
		if(sw.getKeyWord().equals("")) {
			sw.setKeyWord(null);
		}
		List<Member> list = cs.searchMember(sw);
		
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
	
	@RequestMapping("/inviteMember.ct")
	public void inviteMember(ChatRoom cr, String text, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(text);
		String[] str = text.split("`");
		Member m = cs.inviteMember(cr);
		
		Message me = new Message();
    	me.setContent(m.getMemberName() +"님이 초대되었습니다.");
    	me.setChatRoomNo(str[1]);
    	me.setSender("M999");
    	me.setContentType(str[3]);
    	me.setStatus(str[5]);
    	
    	int result = cs.insertInfoMessage(me);
    	
    	request.setAttribute("member", m);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(m);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/insertChatAtt.ct")
	public void insertChatAtt(MultipartHttpServletRequest request, HttpSession session, HttpServletRequest rq, HttpServletResponse response) {
		
		List<MultipartFile> fileList = request.getFiles("file");
		Member m = (Member) session.getAttribute("loginUser");
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		
		System.out.println("root : " + root);
		
		String filePath = root + "\\uploadfiles";
		//---------파일명 변경---------------------------------------
		//파일의 원본이름 originFileName
		String originFileName = fileList.get(0).getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeName = CommonsUtils.getRandomString();
		//--------------------------------------------------------
		
		Attachment at = new Attachment();
		at.setChangeName(changeName + ext);
		at.setOriginName(originFileName);
		at.setFilePath(filePath);
		at.setExt(ext);
		System.out.println("========================================================");
		System.out.println(at);
		System.out.println(rq.getParameter("chatRoomNo"));
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		at.setDivision(loginUser.getMemberNo());
		
		Message me = new Message();
    	me.setContent("");
    	me.setChatRoomNo(rq.getParameter("chatRoomNo"));
    	me.setSender(m.getMemberNo());
    	me.setContentType("첨부파일");
    	
    	int result = cs.insertAttMessage(me);   
    	if(result > 0) {
    		int result2 = cs.insertAttChat(at);
    		
    		try {
				fileList.get(0).transferTo(new File(filePath + "\\" + changeName + ext));
				
				request.setAttribute("attachment", at);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");

				String gson = new Gson().toJson(at);

				try {
					response.getWriter().write(gson);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
    		} catch (Exception e) {
    			//실패 시 파일 삭제
    			new File(filePath + "\\" + changeName + ext).delete();
    		}
        
    	}
    
	}

        
}
