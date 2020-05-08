package com.kh.manage.timeLine.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.common.Attachment;
import com.kh.manage.timeLine.model.vo.TimeLine;

public interface TimeLineDao {

	int insertTimeLine(SqlSessionTemplate sqlSession, TimeLine tm);

	int insertTimeAttachment(SqlSessionTemplate sqlSession, Attachment at);

	TimeLine selectOneTag(SqlSessionTemplate sqlSession, String tagName);

	int insertTag(SqlSessionTemplate sqlSession, String tagName);

	int insertTimeLineTag(SqlSessionTemplate sqlSession);

}
