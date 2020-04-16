package com.kh.manage.forum.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.forum.model.vo.Notice;
import com.kh.manage.forum.model.vo.Reply;

public interface ForumDao {

	int noticeInsert(SqlSessionTemplate sqlSession, Notice n);

	String selectCurrval(SqlSessionTemplate sqlSession);

	int attachInsert(SqlSessionTemplate sqlSession, Attachment at);

	int getListCount(SqlSessionTemplate sqlSession);

	List<Notice> noticeSelectAll(SqlSessionTemplate sqlSession, PageInfo pi);

	Notice selectNotice(SqlSessionTemplate sqlSession, Notice n);

	Attachment selectAttachment(SqlSessionTemplate sqlSession, Attachment at);

	Attachment downAttachment(SqlSessionTemplate sqlSession, String no);

	void countPlus(SqlSessionTemplate sqlSession, Notice n);

	int replyInsert(SqlSessionTemplate sqlSession, Reply rp);

	List<Reply> selectAllReply(SqlSessionTemplate sqlSession, String no);

	int deleteNotice(SqlSessionTemplate sqlSession, String nNo);

	Notice updateNoticeSelect(SqlSessionTemplate sqlSession, String nNo);


}
