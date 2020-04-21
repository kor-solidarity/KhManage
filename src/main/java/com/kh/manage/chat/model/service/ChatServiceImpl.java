package com.kh.manage.chat.model.service;

import java.sql.Date;
import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.chat.model.dao.ChatDao;
import com.kh.manage.chat.model.vo.ChatRoom;
import com.kh.manage.chat.model.vo.Message;
import com.kh.manage.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ChatDao cd;
	
	@Override
	public List<DepartMent> selectAllDeptList() {
		
		return cd.selectAllDeptList(sqlSession);
	}

	@Override
	public List<DeptMember> selectDeptMember(DepartMent dept) {
		
		return cd.selectDeptMember(sqlSession, dept);
	}

	@Override
	public int insertChatRoom(ChatRoom cr, List<Member> member) {
		int result2 = 0;
		int result = cd.insertChatRoom(sqlSession, cr);
		
		if(result > 0 ) {
			result2 = cd.insertChatMember(sqlSession, member);
		}
		
		return result2;
	}

	@Override
	public List<ChatRoom> selectAllChatRoom(Member m) {
		
		return cd.selectAllChatRoom(sqlSession, m);
	}

	@Override
	public List<ChatRoom> selectJoinChatRoom(Member m) {
		
		return cd.selectJoinChatRoom(sqlSession, m);
	}

	@Override
	public int insertMessage(Message me) {
		int result2 = 0;
		int result = cd.insetMainMessage(sqlSession, me);
		
		if(result > 0) {
			result2 = cd.insertMessageContent(sqlSession, me);
			int result3 = cd.updateRecentMessage(sqlSession, me);
			ChatRoom cr = new ChatRoom();
			
			cr.setChatRoomNo(me.getChatRoomNo());
			cr.setMemberNo(me.getSender());
		    cd.updateChatAccessDate(sqlSession, cr);
		}
		
		return result2;
	}

	@Override
	public List<Message> selectAllMessage(ChatRoom cr) {
		
		return cd.selectAllMessage(sqlSession, cr);
	}

	@Override
	public String selectDate() {
		
		return cd.selectDate(sqlSession);
	}

	@Override
	public ChatRoom selectOneChatRoom(ChatRoom cr) {
		
		return cd.selectOneChatRoom(sqlSession, cr);
	}

	@Override
	public int updateChatAccessDate(ChatRoom cr) {
		
		return cd.updateChatAccessDate(sqlSession, cr);
	}

	@Override
	public int chatCount(ChatRoom chatRoom) {
		
		return cd.chatCount(sqlSession, chatRoom);
	}

	@Override
	public String selectLastMessage(ChatRoom cr) {
		
		return cd.selectLastMessage(sqlSession, cr);
	}

	@Override
	public String selectInsertDateInfo(Message message) {
		
		return cd.selectInsertDateInfo(sqlSession, message);
	}

	@Override
	public ChatRoom checkChatRoom(ChatRoom cr) {
		
		return cd.checkChatRoom(sqlSession, cr);
	}

	@Override
	public List<ChatRoom> changeMember(ChatRoom crCheck) {
		
		return cd.changeMember(sqlSession, crCheck);
	}

	@Override
	public int chatRoomChangeMemberNo(ChatRoom crCheck) {
		
		return cd.chatRoomChangeMemberNo(sqlSession, crCheck);
	}

	@Override
	public int insertInfoMessage(Message me) {
		
		int result =  cd.insertInfoMessage(sqlSession, me);
		int result2 = 0;
		
		if(result > 0) {
			result2 = cd.insertMessageContent(sqlSession, me);
		}
		
		return result2;
	}

	@Override
	public int deleteChatMember(ChatRoom cr) {
		
		return cd.deleteChatMember(sqlSession, cr);
	}

	@Override
	public int deleteChatRoom(ChatRoom cr) {
		
		return cd.deleteChatRoom(sqlSession, cr);
	}



}
