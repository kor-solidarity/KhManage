package com.kh.manage.project.model.service;

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
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.manage.project.model.dao.ProjectDao;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
	public List<ProjectList> selectProjectList(PageInfo pi, Member loginUser) {
		return pd.selectProjectList(sqlSession, pi, loginUser);
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
	
	@Override
	public int insertProjectWork(ProjectWork projectWork) {
		return pd.insertProjectWork(sqlSession, projectWork);
	}
	
	@Override
	public List<ProjectTeam> selectProjectTeamList(String pid) {
		return pd.selectProjectTeamList(sqlSession, pid);
	}
	
	@Override
	public ProjectDetail selectOneProject(String pid) {
		
		return pd.selectOneProject(sqlSession, pid);
	}
	
	@Override
	public int insertAttachment(Attachment at) {
		return pd.insertAttachment(sqlSession, at);
	}
	
	@Override
	public List<ProjectWork> selectOutdatedWorks(String pid) {
		return pd.selectOutdatedWorks(sqlSession, pid);
	}
	
	@Override
	public int updateOutdatedWork(String workNo) {
		return pd.updateOutdatedWork(sqlSession, workNo);
	}
	
	@Override
	public int insertWorkHistory(WorkHistory workHistory) {
		return pd.insertWorkHistory(sqlSession, workHistory);
		
	}
	
	@Override
	public List<DeptMember> selectMemberListResource(String deptNo) {
		return pd.selectMemberListResource(sqlSession, deptNo);
	}
	
	@Override
	public String selectWorkSeq() {
		return pd.selectWorkSeq(sqlSession);
	}
	
	@Override
	public String selectProjectTeamNo(ProjectTeam team) {
		return pd.selectProjectTeamNo(sqlSession, team);
	}
	
	@Override
	public int insertResource(Member member) {
		return pd.insertResource(sqlSession, member);
	}
	
	@Override
	public List<Member> selectTeamMemberList(String pid) {
		return pd.teamMemberList(sqlSession, pid);
	}
	
	@Override
	public ProjectWork selectProjectWork(String workNo) {
		return pd.selectProjectWork(sqlSession, workNo);
	}
	
	@Override
	public List<WorkProduct> selectWorkProductList(String workNo) {
		return pd.selectWorkProductList(sqlSession, workNo);
	}
	
	@Override
	public List<WorkHistory> selectWorkHistoryList(String workNo) {
		return pd.selectWorkHistoryList(sqlSession, workNo);
	}
	
	@Override
	public List<ProjectTeam> selectProjectTeamGrantorList(String pid) {
		return pd.selectProjectTeamGrantorList(sqlSession, pid);
	}
	
	@Override
	public List<ProjectWork> selectProjectHighWorkList(HashMap<String, String> highWorkMap) {
		return pd.selectProjectHighWorkList(sqlSession, highWorkMap);
	}
	
	@Override
	public int updateWork(ProjectWork work) {
		return pd.updateWork(sqlSession, work);
	}
	
	@Override
	public int selectCheckWorkMemberList(Member m) {
		return pd.selectCheckWorkMemberList(sqlSession, m);
	}
	
	@Override
	public int deleteProjectMember(Member m) {
		return pd.deleteProjectMember(sqlSession, m);
	}
	
	@Override
	public String selectCheckWorkMemberName(Member m) {
		return pd.selectCheckWorkMemberName(sqlSession, m);
	}
	
	@Override
	public List<Project> selectOutdatedProjects() {
		return pd.selectOutdatedProjects(sqlSession);
	}
	
	@Override
	public int deleteWork(String workNo) {
		return pd.deleteWork(sqlSession, workNo);
	}
	
	@Override
	public int checkLowerWorks(String workNo) {
		return pd.checkLowerWorks(sqlSession, workNo);
	}
	
	@Override
	public int updateOutdatedProject(String projectPk) {
		return pd.updateOutdatedProject(sqlSession, projectPk);
	}
	
	@Override
	public List<TemplateWorkRead> selectAllTemplateWork(String project_template) {
		
		return pd.selectAllTemplateWork(sqlSession, project_template);
	}
	
	@Override
	public int insertHighWork(TemplateWorkRead templateWorkRead) {
		
		return pd.insertHighWork(sqlSession, templateWorkRead);
	}
	
	@Override
	public String selectCurrval() {
		
		return pd.selectCurrval(sqlSession);
	}
	
	@Override
	public int insertDownWork(TemplateWorkRead templateWorkRead) {
		
		return pd.insertDownWork(sqlSession, templateWorkRead);
	}
	
	@Override
	public String selectProjectCurrval() {
		
		return "P" + pd.getSeq(sqlSession);
	}
	
	@Override
	public int updateProject(Project project) {
		return pd.updateProject(sqlSession, project);
	}
	
	@Override
	public List<Attachment> selectAttachmentList(String pid) {
		return pd.selectAttachmentList(sqlSession, pid);
	}
	
	@Override
	public Attachment selectAttachment(String atNo) {
		return pd.selectAttachment(sqlSession, atNo);
	}
	
	@Override
	public int deleteAttachment(String atNo) {
		return pd.deleteAttachment(sqlSession, atNo);
	}
	
	@Override
	public AllDashBoard selectOneProjectDetail(String pid) {
		
		return pd.selectOneProjectDetail(sqlSession, pid);
	}
	
	@Override
	public int updateProjectStatus(String pid) {
		
		return pd.updateProjectStatus(sqlSession, pid);
	}
	
	@Override
	public List<Statistics> statisticsList2(String pid) {
		
		return pd.statisticsList2(sqlSession, pid);
	}
	
	@Override
	public int insertProjectHistory(Member m) {
		
		return pd.insertPeojectHistory(sqlSession, m);
	}
	
	@Override
	public List<ProjectHistory> selectHistory(String pid) {
		
		return pd.selectHistory(sqlSession, pid);
	}
}
