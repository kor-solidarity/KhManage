package com.kh.manage.member.model.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.Menu;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.rank.model.vo.Rank;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.member.model.exception.LoginException;
import com.kh.manage.member.model.vo.AllDashBoard;
import com.kh.manage.member.model.vo.DeptProjectCount;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.member.model.vo.MemberWorkProduct;
import com.kh.manage.member.model.vo.MyStatic;
import com.kh.manage.member.model.vo.ProjectRank;
import com.kh.manage.project.model.vo.Project;
import com.kh.manage.project.model.vo.ProjectDetail;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException {
		
		Member loginUser = sqlSession.selectOne("Member.loginCheck", m);
		
		System.out.println("memberDao : " + loginUser);
		
		if(loginUser == null) {
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
		}
		
		return loginUser;
	}

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("Member.insertMember", m);
	}
	
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectPwd", m.getMemberId());
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("Member.selectLoginUser", m);
	}

	@Override
	public List<Dept> selectDeptList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Dept.selectDeptList");
	}

	@Override
	public List<Rank> selectRankList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Rank.selectRankList");
	}

	@Override
	public List<Dept> selectDeptList2(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Dept.selectDeptList2");
	}

	@Override
	public List<DepartMent> selectTeam(SqlSessionTemplate sqlSession, DepartMent dm) {
		
		return sqlSession.selectList("Admin.selectTeam", dm);
	}

	@Override
	public int checkMemberId(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("Member.checkMemberId", m);
	}

	@Override
	public int updatePassword(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("Member.updatePassword", m);
	}

	@Override
	public int updateMemberInfo(SqlSessionTemplate sqlSession, Member member) {

		return sqlSession.update("Member.updateMemberInfo", member);
	}

	@Override
	public int insertProfileImage(SqlSessionTemplate sqlSession, Attachment at) {

		return sqlSession.insert("Member.insertProfileImage", at);
	}

	@Override
	public Attachment selectProfileImg(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectProfileImg", m);
	}

	@Override
	public List<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		return sqlSession.selectList("Member.selectMemberList", null, rowBounds);
	}

	@Override
	public Attachment selectAttachment(SqlSessionTemplate sqlSession, Member loginUser) {

		return sqlSession.selectOne("Member.selectProfileImg", loginUser);
	}

	@Override
	public int updateProfileImage(SqlSessionTemplate sqlSession, Attachment at) {

		return sqlSession.update("Member.updateProfileImage", at);
	}

	@Override
	public List<Menu> selectAllMenu(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("Admin.selectAllMenu");
	}

	@Override
	public List<Menu> noAccessMenu(SqlSessionTemplate sqlSession, Member loginUser) {
		
		return sqlSession.selectList("Admin.noAccessMenu", loginUser);
	}

	@Override
	public int memberListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Member.memberListCount");
	}

	@Override
	public List<Member> searchMemberName(SqlSessionTemplate sqlSession, Member member) {

		return sqlSession.selectList("Member.searchMemberName", member);
	}

	@Override
	public List<Project> selectProjectList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Member.selectProjectList");
	}

	@Override
	public int insertCustomerTable(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("Member.insertCustomerTable", m);
	}

	@Override
	public int insertCustomer(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("Member.insertCustomer", m);
	}

	@Override
	public int insertCustomerProjectTeam(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("Member.insertCustomerProjectTeam", m);
	}

	@Override
	public String selectCurrval(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Member.selectCurrval");
	}

	@Override
	public int resetPassword(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("Member.resetPassword", m);
	}

	@Override
	public List<AllDashBoard> selectAllDashBoard(SqlSessionTemplate sqlSession, AllDashBoard ad) {
		
		return sqlSession.selectList("Member.selectAllDashBoard", ad);
	}

	@Override
	public List<DeptProjectCount> selectDeptProjectCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("Member.selectDeptProjectCount");
	}

	@Override
	public Date selectSysdate(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Member.selectSysdate");
	}

	@Override
	public AllDashBoard selectAllProjectCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Member.selectAllProjectCount");
	}

	@Override
	public List<ProjectDetail> selectAllProjectType(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("Member.selectAllProjectType");
	}
	
	@Override
	   public int myWorkCount(SqlSessionTemplate sqlSession, Member m) {

	      return sqlSession.selectOne("Member.myWorkCount", m);
	}

	@Override
	public List<AllDashBoard> selectAllType(SqlSessionTemplate sqlSession, Date date) {
		
		return sqlSession.selectList("Member.selectAllType", date);
	}

	@Override
	public AllDashBoard searchChartKind(SqlSessionTemplate sqlSession, Date date) {
		
		return sqlSession.selectOne("Member.searchChartKind", date);
	}

	@Override
	public AllDashBoard selectStatusIssue(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Member.selectStatusIssue");
	}

	@Override
	public AllDashBoard selectIssueTypeCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Member.selectIssueTypeCount");
	}
	
	@Override
	public int myProjectCount(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("Member.myProjectCount", m);
	}

	@Override
	public int myIssueCount(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("Member.myIssueCount", m);
	}
	
	@Override
	public MyStatic selectMyStatic(SqlSessionTemplate sqlSession, Member member) {

		return sqlSession.selectOne("Member.selectMyStatic", member);
	}
	
	@Override
	public AllDashBoard selectIssueStatus(SqlSessionTemplate sqlSession, Member member) {

		return sqlSession.selectOne("Member.selectIssueStatus", member);
	}

	@Override
	public int myChangeCount(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("Member.myChangeCount", m);
	}

	@Override
	public int myWorkProductCount(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("Member.myWorkProductCount", m);
	}

	@Override
	public AllDashBoard selectIssueType(SqlSessionTemplate sqlSession, Member member) {

		return sqlSession.selectOne("Member.selectIssueType", member);
	}

	@Override
	public ProjectRank selectAllRankCount(SqlSessionTemplate sqlSession, ProjectRank pr) {
		
		return sqlSession.selectOne("Member.selectAllRankCount", pr);
	}

	@Override
	public List<MemberWorkProduct> myWorkProductList(SqlSessionTemplate sqlSession, Member member) {

		return sqlSession.selectList("Member.myWorkProductList", member);
	}

	@Override
	public List<MemberWorkProduct> myWorkList(SqlSessionTemplate sqlSession, Member member) {

		return sqlSession.selectList("Member.myWorkList", member);
	}

	@Override
	public MyStatic selectMonthlyProjectCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Member.selectMonthlyProjectCount");
	}

	@Override
	public List<Dept> selectDeptListChart(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Dept.selectDeptListChart");
	}



	



}
