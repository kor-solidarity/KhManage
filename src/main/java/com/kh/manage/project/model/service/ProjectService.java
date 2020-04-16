package com.kh.manage.project.model.service;

import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.common.PageInfo;
import com.kh.manage.project.model.vo.Project;
import com.kh.manage.project.model.vo.ProjectList;
import com.kh.manage.project.model.vo.ProjectTeam;
import com.kh.manage.project.model.vo.ProjectType;

import java.util.List;

public interface ProjectService {
	
	// 프로젝트 형태 목록 반환
	List<ProjectType> selectProjectTypeList();
	
	List<Dept> selectDeptList();
	
	List<DeptMember> selectMemberList(String deptNo);
	
	List<Template> selectTemplateList();
	
	String  insertProject(Project project);
	
	int insertProjectTeam(ProjectTeam team);
	
	List<ProjectList> selectProjectList(PageInfo pi);
	
	int getProjectListCount();
}
