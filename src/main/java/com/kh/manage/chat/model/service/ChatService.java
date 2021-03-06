package com.kh.manage.chat.model.service;

import java.sql.Date;

import java.util.List;

import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.chat.model.vo.ChatMessageList;
import com.kh.manage.chat.model.vo.ChatRoom;
import com.kh.manage.chat.model.vo.Message;
import com.kh.manage.chat.model.vo.SearchKeyWord;
import com.kh.manage.common.Attachment;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.timeLine.model.vo.Comment;
import com.kh.manage.timeLine.model.vo.Tag;
import com.kh.manage.timeLine.model.vo.TimeLine;

public interface ChatService {

	List<DepartMent> selectAllDeptList();

	List<DeptMember> selectDeptMember(DepartMent dept);

	int insertChatRoom(ChatRoom cr, List<Member> member);

	List<ChatRoom> selectAllChatRoom(Member m);

	List<ChatRoom> selectJoinChatRoom(Member m);

	int insertMessage(Message me);

	List<ChatMessageList> selectAllMessage(ChatRoom cr);

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

	Member inviteMember(ChatRoom cr);

	int insertAttMessage(Message me);

	int insertAttChat(Attachment at);

	Attachment selectChatAtt(ChatMessageList chatMessageList);

	List<Member> selectAllMember();

	List<TimeLine> selectAllTimeLine();

	List<Tag> selectOneTag(String timeLineNo);

	List<TimeLine> selectOneHart(String timeLineNo);

	List<Comment> selectOneComment(String timeLineNo);

	List<TimeLine> selectTagTimeLine(Tag tg);

	List<TimeLine> searchTimeLineNo(TimeLine tl);


}
