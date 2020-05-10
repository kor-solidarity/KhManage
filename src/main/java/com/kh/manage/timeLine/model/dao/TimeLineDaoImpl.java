package com.kh.manage.timeLine.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.common.Attachment;
import com.kh.manage.timeLine.model.vo.Comment;
import com.kh.manage.timeLine.model.vo.Tag;
import com.kh.manage.timeLine.model.vo.TimeLine;

@Repository
public class TimeLineDaoImpl implements TimeLineDao {

	@Override
	public int insertTimeLine(SqlSessionTemplate sqlSession, TimeLine tm) {
		
		return sqlSession.insert("TimeLine.insertTimeLine", tm);
	}

	@Override
	public int insertTimeAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		
		return sqlSession.insert("TimeLine.insertTimeAttachment", at);
	}

	@Override
	public TimeLine selectOneTag(SqlSessionTemplate sqlSession, String tagName) {
		
		return sqlSession.selectOne("TimeLine.selectOneTag", tagName);
	}

	@Override
	public int insertTag(SqlSessionTemplate sqlSession, String tagName) {
		
		return sqlSession.insert("TimeLine.insertTag", tagName);
	}

	@Override
	public int insertTimeLineTag(SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("TimeLine.insertTimeLineTag");
	}

	@Override
	public int insertTagName(SqlSessionTemplate sqlSession, String tagNo) {
		
		return sqlSession.insert("TimeLine.insertTagName", tagNo);
	}

	@Override
	public int insertTimeListHart(SqlSessionTemplate sqlSession, TimeLine tl) {
		
		return sqlSession.insert("TimeLine.insertTimeListHart", tl);
	}

	@Override
	public int deleteHart(SqlSessionTemplate sqlSession, TimeLine tl) {
		
		return sqlSession.delete("TimeLine.deleteHart", tl);
	}

	@Override
	public int insertHighComment(SqlSessionTemplate sqlSession, Comment comm) {
		
		return sqlSession.insert("TimeLine.insertHighComment", comm);
	}

	@Override
	public String selectOneTimeLineNo(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("TimeLine.selectOneTimeLineOne");
	}

	@Override
	public String selectSysdate(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("TimeLine.selectSysdate");
	}

	@Override
	public int deleteHighComment(SqlSessionTemplate sqlSession, Comment comm) {
		
		return sqlSession.update("TimeLine.deleteHighComment", comm);
	}

}
