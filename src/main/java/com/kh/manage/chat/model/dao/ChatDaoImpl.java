package com.kh.manage.chat.model.dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.chat.model.vo.ChatMessageList;
import com.kh.manage.chat.model.vo.ChatRoom;
import com.kh.manage.chat.model.vo.Message;
import com.kh.manage.chat.model.vo.SearchKeyWord;
import com.kh.manage.common.Attachment;
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
	public List<ChatMessageList> selectAllMessage(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
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

	@Override
	public int updateChatAccessDate(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.update("Chat.updateChatAccessDate", cr);
	}

	@Override
	public int chatCount(SqlSessionTemplate sqlSession, ChatRoom chatRoom) {

		return sqlSession.selectOne("Chat.chatCount", chatRoom);
	}

	@Override
	public String selectLastMessage(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.selectOne("Chat.selectLastMessage", cr);
	}

	@Override
	public String selectInsertDateInfo(SqlSessionTemplate sqlSession, Message message) {
		
		return sqlSession.selectOne("Chat.selectInsertDateInfo", message);
	}

	@Override
	public ChatRoom checkChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.selectOne("Chat.checkChatRoom", cr);
	}

	@Override
	public List<ChatRoom> changeMember(SqlSessionTemplate sqlSession, ChatRoom crCheck) {
		
		return sqlSession.selectList("Chat.changeMember", crCheck);
	}

	@Override
	public int chatRoomChangeMemberNo(SqlSessionTemplate sqlSession, ChatRoom crCheck) {
		
		return sqlSession.update("Chat.chatRoomChangeMemberNo", crCheck);
	}

	@Override
	public int insertInfoMessage(SqlSessionTemplate sqlSession, Message me) {
		
		return sqlSession.insert("Chat.insertInfoMessage", me);
	}

	@Override
	public int deleteChatMember(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.update("Chat.deleteChatMember", cr);
	}

	@Override
	public int deleteChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.update("Chat.deleteChatRoom", cr);
	}

	@Override
	public List<Member> selectAllChatMember(SqlSessionTemplate sqlSession, ChatRoom cr) {
	
		return sqlSession.selectList("Chat.selectAllChatMember", cr);
	}

	@Override
	public List<Member> searchMember(SqlSessionTemplate sqlSession, SearchKeyWord sw) {
		
		return sqlSession.selectList("Chat.searchMember", sw);
	}

	@Override
	public int inviteMember(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.insert("Chat.inviteMember", cr);
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.selectOne("Chat.selectMember", cr);
	}

	@Override
	public int inviteMemberUpdate(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.update("Chat.inviteMemberUpdate", cr);
	}

	@Override
	public ChatRoom selectChatMember(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.selectOne("Chat.selectChatMember", cr);
	}

	@Override
	public int insertAttMessage(SqlSessionTemplate sqlSession, Message me) {
		
		return sqlSession.insert("Chat.insertAttMessage", me);
	}

	@Override
	public int insertAttChat(SqlSessionTemplate sqlSession, Attachment at) {
		
		return sqlSession.insert("Chat.insertAttChat", at);
	}

	@Override
	public Attachment selectChatAtt(SqlSessionTemplate sqlSession, ChatMessageList message) {

		return sqlSession.selectOne("Chat.selectChatAtt", message);
	}

}
