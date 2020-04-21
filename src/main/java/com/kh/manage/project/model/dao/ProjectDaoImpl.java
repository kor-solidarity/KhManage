package com.kh.manage.project.model.dao;

import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.common.PageInfo;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.*;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectDaoImpl implements ProjectDao {
	@Override
	public List<ProjectType> selectProjectTypeList(SqlSessionTemplate sqlSession) {
		
		
		// 서비스에서 보내온 SqlSessionTemplate 는 여기서 활용.
		// Statement 문은 mybatis-config 에 매퍼로 설정해둔 경로 안의
		// namespace 와 CRUD 아이디값으로 정한다.
		return sqlSession.selectList("Project.selectProjectTypeList");
	}
	
	@Override
	public List<Dept> selectDeptList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Project.selectDeptList");
	}
	
	@Override
	public List<DeptMember> selectMemberList(SqlSessionTemplate sqlSession, String deptNo) {
		return sqlSession.selectList("Project.selectActiveMember", deptNo);
	}
	
	@Override
	public List<Template> selectMemberList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Project.selectTemplateList");
	}
	
	@Override
	public int insertProject(SqlSessionTemplate sqlSession, Project project) {
		return sqlSession.insert("Project.insertProject", project);
	}
	
	@Override
	public int insertProjectTeam(SqlSessionTemplate sqlSession, ProjectTeam team) {
		return sqlSession.insert("Project.insertProjectTeam", team);
	}
	
	@Override
	public String  getSeq(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Project.getSeq");
	}
	
	@Override
	public int getProjectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Project.getProjectListCount");
	}
	
	@Override
	public List<ProjectList> selectProjectList(SqlSessionTemplate sqlSession, PageInfo pi, Member loginUser) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Project.selectProjectList", loginUser, rowBounds);
	}
	
	@Override
	public List<ProjectWork> selectProjectWorkList(SqlSessionTemplate sqlSession, String pid) {
		return sqlSession.selectList("Project.selectProjectWorkList", pid);
	}
	
	@Override
	public int insertProjectWork(SqlSessionTemplate sqlSession, ProjectWork projectWork) {
		return sqlSession.insert("Project.insertProjectWork", projectWork);
	}
	
	@Override
	public List<ProjectTeam> selectProjectTeamList(SqlSessionTemplate sqlSession, String pid) {
		return sqlSession.selectList("Project.selectProjectTeamList", pid);
	}
}
