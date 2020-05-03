package com.kh.manage.project.model.service;

import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.*;

import java.util.HashMap;
import java.util.List;

public interface ProjectService {
	
	// 프로젝트 형태 목록 반환
	List<ProjectType> selectProjectTypeList();
	
	List<Dept> selectDeptList();
	
	List<DeptMember> selectMemberList(String deptNo);
	
	List<Template> selectTemplateList();
	
	String insertProject(Project project);
	
	int insertProjectTeam(ProjectTeam team);
	
	List<ProjectList> selectProjectList(PageInfo pi, Member loginUser);
	
	int getProjectListCount();
	
	List<ProjectWork> selectProjectWorkList(String pid);
	
	int insertProjectWork(ProjectWork projectWork);
	
	List<ProjectTeam> selectProjectTeamList(String pid);
	
	ProjectDetail selectOneProject(String pid);
	
	int insertAttachment(Attachment at);
	
	List<ProjectWork> selectOutdatedWorks(String pid);
	
	int updateOutdatedWork(String workNo);
	
	int insertWorkHistory(WorkHistory workHistory);
	
	List<DeptMember> selectMemberListResource(String deptNo);
	
	String selectWorkSeq();
	
	String selectProjectTeamNo(ProjectTeam team);
	
	int insertResource(Member member);
	
	List<Member> selectTeamMemberList(String pid);
	
	ProjectWork selectProjectWork(String workNo);
	
	List<WorkProduct> selectWorkProductList(String workNo);
	
	List<WorkHistory> selectWorkHistoryList(String workNo);
	
	List<ProjectTeam> selectProjectTeamGrantorList(String pid);
	
	List<ProjectWork> selectProjectHighWorkList(HashMap<String, String> highWorkMap);
	
	int updateWork(ProjectWork work);
	
	int selectCheckWorkMemberList(Member m);
	
	int deleteProjectMember(Member m);

	String selectCheckWorkMemberName(Member m);
	
	List<Project> selectOutdatedProjects();
	
	int deleteWork(String workNo);
	
	int checkLowerWorks(String workNo);
	
	int updateOutdatedProject(String projectPk);
	List<TemplateWorkRead> selectAllTemplateWork(String project_template);
	
	int insertHighWork(TemplateWorkRead templateWorkRead);
	
	String selectCurrval();
	
	int insertDownWork(TemplateWorkRead templateWorkRead);
	
	String selectProjectCurrval();
}
