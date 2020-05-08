package com.kh.manage.timeLine.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.common.Attachment;
import com.kh.manage.timeLine.model.dao.TimeLineDao;
import com.kh.manage.timeLine.model.vo.Tag;
import com.kh.manage.timeLine.model.vo.TimeLine;

@Service
public class TimeLineServiceImpl implements TimeLineService {

	@Autowired
	private TimeLineDao td;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertTimeLine(TimeLine tm) {
		
		return td.insertTimeLine(sqlSession, tm);
	}

	@Override
	public int insertTimeAttachment(Attachment at) {
		
		return td.insertTimeAttachment(sqlSession, at);
	}

	@Override
	public TimeLine selectOneTag(String tagName) {
	
		return td.selectOneTag(sqlSession, tagName);
	}

	@Override
	public int insertTag(String tagName) {
		
		return td.insertTag(sqlSession, tagName);
	}

	@Override
	public int insertTimeLineTag() {
		
		return td.insertTimeLineTag(sqlSession);
	}

	@Override
	public int insertTagName(String tagNo) {
		
		return td.insertTagName(sqlSession, tagNo);
	}

	@Override
	public int insertTimeLineHart(TimeLine tl) {
		
		return td.insertTimeListHart(sqlSession, tl);
	}

	@Override
	public int deleteHart(TimeLine tl) {
		
		return td.deleteHart(sqlSession, tl);
	}

	

}
