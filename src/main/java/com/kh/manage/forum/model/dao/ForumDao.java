package com.kh.manage.forum.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.forum.model.vo.Notice;

public interface ForumDao {

	int noticeInsert(SqlSessionTemplate sqlSession, Notice n);

	String selectCurrval(SqlSessionTemplate sqlSession);

	int attachInsert(SqlSessionTemplate sqlSession, Attachment at);

	int getListCount(SqlSessionTemplate sqlSession);

	List<Notice> noticeSelectAll(SqlSessionTemplate sqlSession, PageInfo pi);

	Notice selectNotice(SqlSessionTemplate sqlSession, Notice n);

}
