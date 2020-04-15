package com.kh.manage.work.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.work.model.vo.Work;

@Repository
public class WorkDaoImpl implements WorkDao{

	@Override
	public int insertWork(SqlSessionTemplate sqlSession, Work work) {
		
		return sqlSession.insert("Work.insertWork", work);
	}

}
