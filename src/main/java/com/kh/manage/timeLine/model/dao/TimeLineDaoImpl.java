package com.kh.manage.timeLine.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.common.Attachment;
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

}
