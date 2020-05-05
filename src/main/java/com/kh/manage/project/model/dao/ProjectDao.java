package com.kh.manage.project.model.dao;

import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.adminManage.vo.ProjectHistory;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.gwManage.model.vo.Statistics;
import com.kh.manage.member.model.vo.AllDashBoard;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.*;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.HashMap;
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
	
	List<ProjectTeam> selectProjectTeamGrantorList(SqlSessionTemplate sqlSession, String pid);
	
	List<ProjectWork> selectProjectHighWorkList(SqlSessionTemplate sqlSession, HashMap<String, String> highWorkMap);
	
	int updateWork(SqlSessionTemplate sqlSession, ProjectWork work);
	
	int selectCheckWorkMemberList(SqlSessionTemplate sqlSession, Member m);
	
	int deleteProjectMember(SqlSessionTemplate sqlSession, Member m);
	
	String selectCheckWorkMemberName(SqlSessionTemplate sqlSession, Member m);
	
	List<Project> selectOutdatedProjects(SqlSessionTemplate sqlSession);
	
	int deleteWork(SqlSessionTemplate sqlSession, String workNo);
	
	int checkLowerWorks(SqlSessionTemplate sqlSession, String workNo);
	
	int updateOutdatedProject(SqlSessionTemplate sqlSession, String projectPk);
	
	List<TemplateWorkRead> selectAllTemplateWork(SqlSessionTemplate sqlSession, String project_template);
	
	int insertHighWork(SqlSessionTemplate sqlSession, TemplateWorkRead templateWorkRead);
	
	String selectCurrval(SqlSessionTemplate sqlSession);
	
	int insertDownWork(SqlSessionTemplate sqlSession, TemplateWorkRead templateWorkRead);
	
	int updateProject(SqlSessionTemplate sqlSession, Project project);
	
	List<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession, String pid);
	
	Attachment selectAttachment(SqlSessionTemplate sqlSession, String atNo);
	
	int deleteAttachment(SqlSessionTemplate sqlSession, String atNo);
	
	AllDashBoard selectOneProjectDetail(SqlSessionTemplate sqlSession, String pid);
	
	int updateProjectStatus(SqlSessionTemplate sqlSession, String pid);
	
	List<Statistics> statisticsList2(SqlSessionTemplate sqlSession, String pid);
	
	int insertPeojectHistory(SqlSessionTemplate sqlSession, Member m);
	
	List<ProjectHistory> selectHistory(SqlSessionTemplate sqlSession, String pid);
}
