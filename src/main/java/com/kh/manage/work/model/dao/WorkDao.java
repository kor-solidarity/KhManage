package com.kh.manage.work.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.work.model.vo.Work;

public interface WorkDao {

	int insertWork(SqlSessionTemplate sqlSession, Work work);

}
