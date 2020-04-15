package com.kh.manage.work.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.work.model.dao.WorkDao;
import com.kh.manage.work.model.vo.Work;

@Service
public class WorkServiceImpl implements WorkService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private WorkDao wd;
	
	@Override
	public int insertWork(Work work) {
		
		return wd.insertWork(sqlSession, work);
	}

}
