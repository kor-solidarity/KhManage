package com.kh.manage.member.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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
	
	
	@Override
	public int insertMember(Member m) {
		
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

		return md.selectList(sqlSession);
	}

	@Override
	public List<Rank> selectRankList() {

		return md.selectRankList(sqlSession);
	}



	
}













