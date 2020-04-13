package com.kh.manage.member.model.service;

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
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.rank.model.vo.Rank;
import com.kh.manage.member.model.dao.MemberDao;
import com.kh.manage.member.model.exception.LoginException;
import com.kh.manage.member.model.vo.Member;

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
	
	
	@Override
	public int insertMember(Member m) {
		
		int result = 0;
		
		int result1 = md.insertMember(sqlSession, m);
		
		
		return md.insertMember(sqlSession, m);
	}
	
	
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

	
	
	
}













