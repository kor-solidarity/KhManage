package com.kh.manage.member.model.dao;

import java.sql.Date;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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


public interface MemberDao {

	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException ;
	
	int insertMember(SqlSessionTemplate sqlSession, Member m);
	
	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	Member selectMember(SqlSessionTemplate sqlSession, Member m);

	List<Dept> selectDeptList(SqlSessionTemplate sqlSession);

	List<Rank> selectRankList(SqlSessionTemplate sqlSession);

	List<Dept> selectDeptList2(SqlSessionTemplate sqlSession);

	List<DepartMent> selectTeam(SqlSessionTemplate sqlSession, DepartMent dm);

	int checkMemberId(SqlSessionTemplate sqlSession, Member m);

	int updatePassword(SqlSessionTemplate sqlSession, Member m);

	int updateMemberInfo(SqlSessionTemplate sqlSession, Member member);

	int insertProfileImage(SqlSessionTemplate sqlSession, Attachment at);

	Attachment selectProfileImg(SqlSessionTemplate sqlSession, Member m);

	List<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi);

	Attachment selectAttachment(SqlSessionTemplate sqlSession, Member loginUser);

	int updateProfileImage(SqlSessionTemplate sqlSession, Attachment at);

	List<Menu> selectAllMenu(SqlSessionTemplate sqlSession);

	List<Menu> noAccessMenu(SqlSessionTemplate sqlSession, Member loginUser);

	int memberListCount(SqlSessionTemplate sqlSession);

	List<Member> searchMemberName(SqlSessionTemplate sqlSession, Member member);

	List<Project> selectProjectList(SqlSessionTemplate sqlSession);

	int insertCustomerTable(SqlSessionTemplate sqlSession, Member m);

	int insertCustomer(SqlSessionTemplate sqlSession, Member m);

	int insertCustomerProjectTeam(SqlSessionTemplate sqlSession, Member m);

	String selectCurrval(SqlSessionTemplate sqlSession);

	int resetPassword(SqlSessionTemplate sqlSession, Member m);

	List<AllDashBoard> selectAllDashBoard(SqlSessionTemplate sqlSession, AllDashBoard ad);

	List<DeptProjectCount> selectDeptProjectCount(SqlSessionTemplate sqlSession);

	Date selectSysdate(SqlSessionTemplate sqlSession);

	AllDashBoard selectAllProjectCount(SqlSessionTemplate sqlSession);

	List<ProjectDetail> selectAllProjectType(SqlSessionTemplate sqlSession);

	int myWorkCount(SqlSessionTemplate sqlSession, Member m);

	List<AllDashBoard> selectAllType(SqlSessionTemplate sqlSession, Date date);

	AllDashBoard searchChartKind(SqlSessionTemplate sqlSession, Date date);

	AllDashBoard selectStatusIssue(SqlSessionTemplate sqlSession);

	AllDashBoard selectIssueTypeCount(SqlSessionTemplate sqlSession);

	int myProjectCount(SqlSessionTemplate sqlSession, Member m);

	int myIssueCount(SqlSessionTemplate sqlSession, Member m);

	MyStatic selectMyStatic(SqlSessionTemplate sqlSession, Member member);
	
	AllDashBoard selectIssueStatus(SqlSessionTemplate sqlSession, Member member);

	int myChangeCount(SqlSessionTemplate sqlSession, Member m);

	int myWorkProductCount(SqlSessionTemplate sqlSession, Member m);

	AllDashBoard selectIssueType(SqlSessionTemplate sqlSession, Member member);

	ProjectRank selectAllRankCount(SqlSessionTemplate sqlSession, ProjectRank pr);

	List<MemberWorkProduct> myWorkProductList(SqlSessionTemplate sqlSession, Member member);

	List<MemberWorkProduct> myWorkList(SqlSessionTemplate sqlSession, Member member);

	MyStatic selectMonthlyProjectCount(SqlSessionTemplate sqlSession);

	List<Dept> selectDeptListChart(SqlSessionTemplate sqlSession);

	


}
