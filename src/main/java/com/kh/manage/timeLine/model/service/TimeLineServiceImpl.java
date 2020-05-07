package com.kh.manage.timeLine.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.common.Attachment;
import com.kh.manage.timeLine.model.dao.TimeLineDao;
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

}
