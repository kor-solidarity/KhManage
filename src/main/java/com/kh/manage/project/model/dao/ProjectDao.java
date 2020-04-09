package com.kh.manage.project.model.dao;

import com.kh.manage.project.model.vo.ProjectType;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.List;

public interface ProjectDao {
	
	List<ProjectType> selectAllProjectTypes(SqlSessionTemplate sqlSession);
}
