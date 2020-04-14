package com.kh.manage.project.model.dao;

import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.project.model.vo.ProjectType;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.List;

public interface ProjectDao {
	
	List<ProjectType> selectProjectTypeList(SqlSessionTemplate sqlSession);
	
	List<Dept> selectDeptList(SqlSessionTemplate sqlSession);
	
	List<DeptMember> selectMemberList(SqlSessionTemplate sqlSession, String deptNo);
	
	List<Template> selectMemberList(SqlSessionTemplate sqlSession);
}
