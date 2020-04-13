package com.kh.manage.project.model.service;

import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.department.model.vo.Dept;
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
		
		// ProjectDao 로 보내기.
		return pd.selectProjectTypeList(sqlSession);
	}
	
	@Override
	public List<Dept> selectDeptList() {
		
		return pd.selectDeptList(sqlSession);
	}
	
	@Override
	public List<DeptMember> selectMemberList(String deptNo) {
		return pd.selectMemberList(sqlSession, deptNo);
	}
}