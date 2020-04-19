package com.kh.manage.chat.model.dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.chat.model.vo.ChatRoom;
import com.kh.manage.chat.model.vo.Message;
import com.kh.manage.member.model.vo.Member;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Override
	public List<DepartMent> selectAllDeptList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Chat.selectAllDeptList");
	}

	@Override
	public List<DeptMember> selectDeptMember(SqlSessionTemplate sqlSession, DepartMent dept) {
		
		return sqlSession.selectList("Chat.selectDeptMember", dept);
	}

	@Override
	public int insertChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.insert("Chat.insertChatRoom", cr);
	}

	@Override
	public int insertChatMember(SqlSessionTemplate sqlSession, List<Member> member) {
		
		return sqlSession.insert("Chat.insertChatMember", member);
	}

	@Override
	public List<ChatRoom> selectAllChatRoom(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectList("Chat.selectAllChatRoom", m);
	}

	@Override
	public List<ChatRoom> selectJoinChatRoom(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectList("Chat.selectJoinChatRoom", m);
	}

	@Override
	public int insetMainMessage(SqlSessionTemplate sqlSession, Message me) {
		
		return sqlSession.insert("Chat.insertMainMessage", me);
	}

	@Override
	public int insertMessageContent(SqlSessionTemplate sqlSession, Message me) {
		
		return sqlSession.insert("Chat.insertMessageContent", me);
	}

	@Override
	public int updateRecentMessage(SqlSessionTemplate sqlSession, Message me) {
		
		return sqlSession.update("Chat.updateRecentMessage", me);
		
	}

	@Override
	public List<Message> selectAllMessage(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.selectList("Chat.selectAllMessage", cr);
	}

	@Override
	public String selectDate(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Chat.selectDate");
	}

	@Override
	public ChatRoom selectOneChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.selectOne("Chat.selectOneChatRoom", cr);
	}

}