package com.kh.manage.member.model.service;

import java.sql.Date;

import java.util.List;

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

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	int insertMember(Member m);

	List<Dept> selectDeptList();

	List<Rank> selectRankList();

	List<Dept> selectDeptList2();

	List<DepartMent> selectTeam(DepartMent dm);

	int checkMemberId(Member m);

	int updatePassword(Member m);

	int updateMemberInfo(Member member);

	int insertProfileImage(Attachment at);

	Attachment selectProfileImg(Member m);

	List<Member> selectMemberList(PageInfo pi);

	Attachment selectAttachment(Member loginUser);

	int updateProfileImage(Attachment at);

	List<Menu> selectAllMenu();

	List<Menu> noAccessMenu(Member loginUser);

	int memberListCount();

	List<Member> searchMemberName(Member member);

	List<Project> selectProjectList();

	int insertCustomerTable(Member m);

	int insertCustomer(Member m);

	int insertCustomerProjectTeam(Member m);

	int resetPassword(Member m);

	List<AllDashBoard> selectAllDashBoard(AllDashBoard ad);

	List<DeptProjectCount> selectDeptProjectCount();

	Date selectSysdate();

	AllDashBoard selectAllProjectCount();

	List<ProjectDetail> selectAllProjectType();

	int myWorkCount(Member m);

	List<AllDashBoard> selectAllType(Date date);

	AllDashBoard searchChartKind(Date date);

	AllDashBoard selectStatusIssue();

	AllDashBoard selectIssueTypeCount();

	MyStatic selectMyStatic(Member member);

	int myProjectCount(Member m);

	int myIssueCount(Member m);

	AllDashBoard selectIssueStatus(Member member);

	AllDashBoard selectIssueType(Member member);
	
	int myChangeCount(Member m);

	int myWorkProductCount(Member m);

	ProjectRank selectAllRankCount(ProjectRank pr);

	List<MemberWorkProduct> myWorkProductList(Member member);

	List<MemberWorkProduct> myWorkList(Member member);

	MyStatic selectMonthlyProjectCount();

	List<Dept> selectDeptListChart();

	int myRequestApprovalCount(Member m);


	
}
