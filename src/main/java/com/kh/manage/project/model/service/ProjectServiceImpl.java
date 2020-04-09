package com.kh.manage.project.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.manage.project.model.dao.ProjectDao;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectServiceImpl implements ProjectService {
	// Autowired 가 하는 역할?????
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ProjectDao pd;
	
	
}
