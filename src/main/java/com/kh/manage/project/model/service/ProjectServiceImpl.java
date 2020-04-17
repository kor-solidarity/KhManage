package com.kh.manage.project.model.service;

import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.common.PageInfo;
import com.kh.manage.project.model.vo.*;
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
	
	@Override
	public List<Template> selectTemplateList() {
		return pd.selectMemberList(sqlSession);
	}
	
	@Override
	public String insertProject(Project project) {
		int result = 0;
		String pkResult = null;
		
		result = pd.insertProject(sqlSession, project);
		if (result > 0) {
			// sqlSession.commit();
			// pk 값 반환.
			String seqInt = pd.getSeq(sqlSession);
			System.out.println("seqInt: " + seqInt);
			if (seqInt != null) {
				pkResult = "P" + seqInt;
			}
		}
		
		return pkResult;
	}
	
	@Override
	public int insertProjectTeam(ProjectTeam team) {
		return pd.insertProjectTeam(sqlSession, team);
	}
	
	@Override
	public List<ProjectList> selectProjectList(PageInfo pi) {
		return pd.selectProjectList(sqlSession, pi);
	}
	
	@Override
	public int getProjectListCount() {
		return pd.getProjectListCount(sqlSession);
	}
	
	// 프로젝트 작업 목록 첫 조회시
	@Override
	public List<ProjectWork> selectProjectWorkList(String pid) {
		return pd.selectProjectWorkList(sqlSession, pid);
	}
}
