package com.kh.manage.project.model.service;

import com.kh.manage.project.model.vo.ProjectType;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.manage.project.model.dao.ProjectDao;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {
	// Autowired 가 하는 역할?????
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ProjectDao pd;
	
	// 프로젝트 형태 전체목록 불러오기.
	@Override
	public List<ProjectType> selectProjectTypeList() {
		
		return pd.selectAllProjectTypes(sqlSession);
	}
}
