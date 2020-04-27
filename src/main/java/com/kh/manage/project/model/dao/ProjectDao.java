package com.kh.manage.project.model.dao;

import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.*;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.List;

public interface ProjectDao {
	
	List<ProjectType> selectProjectTypeList(SqlSessionTemplate sqlSession);
	
	List<Dept> selectDeptList(SqlSessionTemplate sqlSession);
	
	List<DeptMember> selectMemberList(SqlSessionTemplate sqlSession, String deptNo);
	
	List<Template> selectMemberList(SqlSessionTemplate sqlSession);
	
	int insertProject(SqlSessionTemplate sqlSession, Project project);
	
	int insertProjectTeam(SqlSessionTemplate sqlSession, ProjectTeam team);
	
	String getSeq(SqlSessionTemplate sqlSession);
	
	int getProjectListCount(SqlSessionTemplate sqlSession);
	
	List<ProjectList> selectProjectList(SqlSessionTemplate sqlSession, PageInfo pi, Member loginUser);
	
	List<ProjectWork> selectProjectWorkList(SqlSessionTemplate sqlSession, String pid);
	
	int insertProjectWork(SqlSessionTemplate sqlSession, ProjectWork projectWork);
	
	List<ProjectTeam> selectProjectTeamList(SqlSessionTemplate sqlSession, String pid);
	
	ProjectDetail selectOneProject(SqlSessionTemplate sqlSession, String pid);
	
	int insertAttachment(SqlSessionTemplate sqlSession, Attachment at);
	
	List<ProjectWork> selectOutdatedWorks(SqlSessionTemplate sqlSession, String pid);
	
	int updateOutdatedWork(SqlSessionTemplate sqlSession, String workNo);
	
	int insertWorkHistory(SqlSessionTemplate sqlSession, WorkHistory workHistory);
	
	List<DeptMember> selectMemberListResource(SqlSessionTemplate sqlSession, String deptNo);
	
	String selectWorkSeq(SqlSessionTemplate sqlSession);
	
	String selectProjectTeamNo(SqlSessionTemplate sqlSession, ProjectTeam team);
	
	int insertResource(SqlSessionTemplate sqlSession, Member member);
	
	List<Member> teamMemberList(SqlSessionTemplate sqlSession, String pid);
	
	ProjectWork selectProjectWork(SqlSessionTemplate sqlSession, String workNo);
	
	List<WorkProduct> selectWorkProductList(SqlSessionTemplate sqlSession, String workNo);
	
	List<WorkHistory> selectWorkHistoryList(SqlSessionTemplate sqlSession, String workNo);
}
