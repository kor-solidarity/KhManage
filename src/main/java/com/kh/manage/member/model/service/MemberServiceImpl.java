package com.kh.manage.member.model.service;

import java.sql.Date;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionManager;

import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.Menu;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.rank.model.vo.Rank;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.member.model.dao.MemberDao;
import com.kh.manage.member.model.exception.LoginException;
import com.kh.manage.member.model.vo.AllDashBoard;
import com.kh.manage.member.model.vo.DeptProjectCount;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.member.model.vo.MemberWorkProduct;
import com.kh.manage.member.model.vo.MyStatic;
import com.kh.manage.member.model.vo.ProjectRank;
import com.kh.manage.project.model.vo.Project;
import com.kh.manage.project.model.vo.ProjectDetail;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	/*
	 * @Autowired private DataSourceTransactionManager TransactionManager;
	 */
	
	
	//트랜젝션 적용 X
	@Override
	public int insertMember(Member m) {
		
//		int result = 0;
		
		int result = md.insertMember(sqlSession, m);
		
		
		return result;
	}
	
	//AOP 설정 후 트랜젝션 적용
//	@Override
//	public int insertMember(Member m) {
//		
//		int result = 0;
//		
//		int result1 = md.insertMember(sqlSession, m);
//		int result2 = md.insertBoard(sqlSession);
//		
//		if(result1 > 0 && result2 > 0) {
//			result = 1;
//		}
//		
//		return result;
//		
//		//System.out.println("insertMember 호출됨...");
//		
//		//return md.insertMember(sqlSession, m); 
//	}
	
	
	
	@Override
	public Member loginMember(Member m) throws LoginException {
		
//		System.out.println("loginMember 호출됨..");
		
		Member loginUser = null;
				
		String encPassword = md.selectEncPassword(sqlSession, m);
		
		if(!passwordEncoder.matches(m.getMemberPwd(), encPassword)) {
			
			throw new LoginException("로그인 실패!");
		} else {
			
			loginUser = md.selectMember(sqlSession, m);
		}
		
		return loginUser;
	}

	
	@Override
	public List<Dept> selectDeptList() {

		return md.selectDeptList(sqlSession);
	}

	@Override
	public List<Rank> selectRankList() {

		return md.selectRankList(sqlSession);
	}


	@Override
	public List<Dept> selectDeptList2() {

		return md.selectDeptList2(sqlSession);
	}


	@Override
	public List<DepartMent> selectTeam(DepartMent dm) {
		
		return md.selectTeam(sqlSession, dm);
	}


	@Override
	public int checkMemberId(Member m) {

		return md.checkMemberId(sqlSession, m);
	}


	@Override
	public int updatePassword(Member m) {

		int result = md.updatePassword(sqlSession, m); 
		
		return md.updatePassword(sqlSession, m);
	}


	@Override
	public int updateMemberInfo(Member member) {
		

		return md.updateMemberInfo(sqlSession, member);
	}


	@Override
	public int insertProfileImage(Attachment at) {

		int result = 0;
		
		int result1 = md.insertProfileImage(sqlSession, at);

		
		return result1;
	}

	@Override
	public Attachment selectProfileImg(Member m) {
		
		return md.selectProfileImg(sqlSession, m);
	}

	@Override
	public List<Member> selectMemberList(PageInfo pi) {
		
		return md.selectMemberList(sqlSession, pi);
	}

	@Override
	public Attachment selectAttachment(Member loginUser) {
		// TODO Auto-generated method stub
		return md.selectAttachment(sqlSession, loginUser);
	}

	@Override
	public int updateProfileImage(Attachment at) {

		int result = md.updateProfileImage(sqlSession, at);
		
		return result;
	}

	@Override
	public List<Menu> selectAllMenu() {
		
		return md.selectAllMenu(sqlSession);
	}

	@Override
	public List<Menu> noAccessMenu(Member loginUser) {

		return md.noAccessMenu(sqlSession, loginUser);
	}

	@Override
	public int memberListCount() {

		return md.memberListCount(sqlSession);
	}

	@Override
	public List<Member> searchMemberName(Member member) {
		// TODO Auto-generated method stub
		return md.searchMemberName(sqlSession, member);
	}

	@Override
	public List<Project> selectProjectList() {
		
		return md.selectProjectList(sqlSession);
	}

	@Override
	public int insertCustomerTable(Member m) {

		return md.insertCustomerTable(sqlSession, m);
	}

	@Override
	public int insertCustomer(Member m) {

		return md.insertCustomer(sqlSession, m);
	}

	@Override
	public int insertCustomerProjectTeam(Member m) {

		int result = md.insertCustomerProjectTeam(sqlSession, m);
		
		String memberNo = md.selectCurrval(sqlSession);
		
		return result;
	}

	@Override
	public int resetPassword(Member m) {

		int result = md.resetPassword(sqlSession, m);
		
		return result;
	}

	@Override
	public List<AllDashBoard> selectAllDashBoard(AllDashBoard ad) {
		
		return md.selectAllDashBoard(sqlSession, ad);
	}

	@Override
	public List<DeptProjectCount> selectDeptProjectCount() {
		
		return md.selectDeptProjectCount(sqlSession);
	}

	@Override
	public Date selectSysdate() {
		
		return md.selectSysdate(sqlSession);
	}

	@Override
	public AllDashBoard selectAllProjectCount() {
		
		return md.selectAllProjectCount(sqlSession);
	}

	@Override
	public List<ProjectDetail> selectAllProjectType() {
		
		return md.selectAllProjectType(sqlSession);
	}

	@Override
	   public int myWorkCount(Member m) {
	      
	      return md.myWorkCount(sqlSession, m);
	   }

	@Override
	public List<AllDashBoard> selectAllType(Date date) {
		
		return md.selectAllType(sqlSession, date);
	}

	@Override
	public AllDashBoard searchChartKind(Date date) {
		
		return md.searchChartKind(sqlSession, date);
	}

	@Override
	public AllDashBoard selectStatusIssue() {
		
		return md.selectStatusIssue(sqlSession);
	}

	@Override
	public AllDashBoard selectIssueTypeCount() {
		
		return md.selectIssueTypeCount(sqlSession);
	}
	
	@Override
	public int myProjectCount(Member m) {

		return md.myProjectCount(sqlSession, m);
	}

	@Override
	public int myIssueCount(Member m) {

		return md.myIssueCount(sqlSession, m);
	}

	@Override
	public MyStatic selectMyStatic(Member member) {

		return md.selectMyStatic(sqlSession, member);
	}
	
	@Override
	public AllDashBoard selectIssueStatus(Member member) {

		return md.selectIssueStatus(sqlSession, member);
	}

	@Override
	public int myChangeCount(Member m) {
		
		return md.myChangeCount(sqlSession, m);
	}

	@Override
	public int myWorkProductCount(Member m) {

		return md.myWorkProductCount(sqlSession, m);
	}

	@Override
	public AllDashBoard selectIssueType(Member member) {

		return md.selectIssueType(sqlSession, member);
	}

	@Override
	public ProjectRank selectAllRankCount(ProjectRank pr) {
		
		return md.selectAllRankCount(sqlSession, pr);
	}

	@Override
	public List<MemberWorkProduct> myWorkProductList(Member member) {

		return md.myWorkProductList(sqlSession, member);
	}

	@Override
	public List<MemberWorkProduct> myWorkList(Member member) {

		return md.myWorkList(sqlSession, member);
	}

//	@Override
//	public ProjectRank selectMonthlyProjectCount(ProjectRank pr) {
//
//		return md.selectMonthlyProjectCount(sqlSession, pr);
//	}

	
	
	
	
	
	
}













