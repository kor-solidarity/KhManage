package com.kh.manage.timeLine.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.common.Attachment;
import com.kh.manage.timeLine.model.vo.Comment;
import com.kh.manage.timeLine.model.vo.Tag;
import com.kh.manage.timeLine.model.vo.TimeLine;

public interface TimeLineDao {

	int insertTimeLine(SqlSessionTemplate sqlSession, TimeLine tm);

	int insertTimeAttachment(SqlSessionTemplate sqlSession, Attachment at);

	TimeLine selectOneTag(SqlSessionTemplate sqlSession, String tagName);

	int insertTag(SqlSessionTemplate sqlSession, String tagName);

	int insertTimeLineTag(SqlSessionTemplate sqlSession);

	int insertTagName(SqlSessionTemplate sqlSession, String tagNo);

	int insertTimeListHart(SqlSessionTemplate sqlSession, TimeLine tl);

	int deleteHart(SqlSessionTemplate sqlSession, TimeLine tl);

	int insertHighComment(SqlSessionTemplate sqlSession, Comment comm);

	String selectOneTimeLineNo(SqlSessionTemplate sqlSession);

	String selectSysdate(SqlSessionTemplate sqlSession);

	int deleteHighComment(SqlSessionTemplate sqlSession, Comment comm);

	int updateHighComment(SqlSessionTemplate sqlSession, Comment comm);

	int deleteTimeLine(SqlSessionTemplate sqlSession, TimeLine tl);


}
