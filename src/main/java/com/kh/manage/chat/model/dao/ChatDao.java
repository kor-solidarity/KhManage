package com.kh.manage.chat.model.dao;

import java.sql.Date;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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

	List<ChatMessageList> selectAllMessage(SqlSessionTemplate sqlSession, ChatRoom cr);

	String selectDate(SqlSessionTemplate sqlSession);

	ChatRoom selectOneChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr);

	int updateChatAccessDate(SqlSessionTemplate sqlSession, ChatRoom cr);

	int chatCount(SqlSessionTemplate sqlSession, ChatRoom chatRoom);

	String selectLastMessage(SqlSessionTemplate sqlSession, ChatRoom cr);

	String selectInsertDateInfo(SqlSessionTemplate sqlSession, Message message);

	ChatRoom checkChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr);

	List<ChatRoom> changeMember(SqlSessionTemplate sqlSession, ChatRoom crCheck);

	int chatRoomChangeMemberNo(SqlSessionTemplate sqlSession, ChatRoom crCheck);

	int insertInfoMessage(SqlSessionTemplate sqlSession, Message me);

	int deleteChatMember(SqlSessionTemplate sqlSession, ChatRoom cr);

	int deleteChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr);

	List<Member> selectAllChatMember(SqlSessionTemplate sqlSession, ChatRoom cr);

	List<Member> searchMember(SqlSessionTemplate sqlSession, SearchKeyWord sw);

	int inviteMember(SqlSessionTemplate sqlSession, ChatRoom cr);

	Member selectMember(SqlSessionTemplate sqlSession, ChatRoom cr);

	int inviteMemberUpdate(SqlSessionTemplate sqlSession, ChatRoom cr);

	ChatRoom selectChatMember(SqlSessionTemplate sqlSession, ChatRoom cr);

	int insertAttMessage(SqlSessionTemplate sqlSession, Message me);

	int insertAttChat(SqlSessionTemplate sqlSession, Attachment at);

	Attachment selectChatAtt(SqlSessionTemplate sqlSession, ChatMessageList chatMessageList);

	List<Member> selectAllMember(SqlSessionTemplate sqlSession);

	List<TimeLine> selectAllTimeLine(SqlSessionTemplate sqlSession);

	List<Tag> selectOneTag(SqlSessionTemplate sqlSession, String timeLineNo);

	List<TimeLine> selectOneHart(SqlSessionTemplate sqlSession, String timeLineNo);

	List<Comment> selectOneComment(SqlSessionTemplate sqlSession, String timeLineNo);

	List<TimeLine> selectTagTimeLine(SqlSessionTemplate sqlSession, Tag tg);

	List<TimeLine> searchTimeLineNo(SqlSessionTemplate sqlSession, TimeLine tl);



}
