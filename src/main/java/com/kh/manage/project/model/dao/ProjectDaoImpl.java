package com.kh.manage.project.model.dao;

import com.kh.manage.project.model.vo.ProjectType;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectDaoImpl implements ProjectDao {
	@Override
	public List<ProjectType> selectAllProjectTypes(SqlSessionTemplate sqlSession) {
		
		
		
		return sqlSession.selectList("Project");
	}
}
