package com.kh.manage.chat.model.dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.chat.model.vo.ChatRoom;
import com.kh.manage.chat.model.vo.Message;
import com.kh.manage.member.model.vo.Member;

public interface ChatDao {

	List<DepartMent> selectAllDeptList(SqlSessionTemplate sqlSession);

	List<DeptMember> selectDeptMember(SqlSessionTemplate sqlSession, DepartMent dept);

	int insertChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr);

	int insertChatMember(SqlSessionTemplate sqlSession, List<Member> member);

	List<ChatRoom> selectAllChatRoom(SqlSessionTemplate sqlSession, Member m);

	List<ChatRoom> selectJoinChatRoom(SqlSessionTemplate sqlSession, Member m);

	int insetMainMessage(SqlSessionTemplate sqlSession, Message me);

	int insertMessageContent(SqlSessionTemplate sqlSession, Message me);

	int updateRecentMessage(SqlSessionTemplate sqlSession, Message me);

	List<Message> selectAllMessage(SqlSessionTemplate sqlSession, ChatRoom cr);

	String selectDate(SqlSessionTemplate sqlSession);

	ChatRoom selectOneChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr);

	int updateChatAccessDate(SqlSessionTemplate sqlSession, ChatRoom cr);

	int chatCount(SqlSessionTemplate sqlSession, ChatRoom chatRoom);

	String selectLastMessage(SqlSessionTemplate sqlSession, ChatRoom cr);

	String selectInsertDateInfo(SqlSessionTemplate sqlSession, Message message);

	ChatRoom checkChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr);

	String changeMember(SqlSessionTemplate sqlSession, ChatRoom crCheck);

	int chatRoomChangeMemberNo(SqlSessionTemplate sqlSession, ChatRoom crCheck);

	int insertInfoMessage(SqlSessionTemplate sqlSession, Message me);

	int deleteChatMember(SqlSessionTemplate sqlSession, ChatRoom cr);



}
