package com.kh.manage.chat.model.service;

import java.sql.Date;
import java.util.List;

import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.chat.model.vo.ChatRoom;
import com.kh.manage.chat.model.vo.Message;
import com.kh.manage.chat.model.vo.SearchKeyWord;
import com.kh.manage.member.model.vo.Member;

public interface ChatService {

	List<DepartMent> selectAllDeptList();

	List<DeptMember> selectDeptMember(DepartMent dept);

	int insertChatRoom(ChatRoom cr, List<Member> member);

	List<ChatRoom> selectAllChatRoom(Member m);

	List<ChatRoom> selectJoinChatRoom(Member m);

	int insertMessage(Message me);

	List<Message> selectAllMessage(ChatRoom cr);

	String selectDate();

	ChatRoom selectOneChatRoom(ChatRoom cr);

	int updateChatAccessDate(ChatRoom cr);

	int chatCount(ChatRoom chatRoom);

	String selectLastMessage(ChatRoom cr);

	String selectInsertDateInfo(Message me);

	ChatRoom checkChatRoom(ChatRoom cr);

	List<ChatRoom> changeMember(ChatRoom crCheck);

	int chatRoomChangeMemberNo(ChatRoom crCheck);

	int insertInfoMessage(Message me);

	int deleteChatMember(ChatRoom cr);

	int deleteChatRoom(ChatRoom cr);

	List<Member> selectAllChatMember(ChatRoom cr);

	List<Member> searchMember(SearchKeyWord sw);


}
