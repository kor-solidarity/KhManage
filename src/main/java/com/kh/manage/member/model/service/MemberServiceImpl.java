package com.kh.manage.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.manage.member.model.dao.MemberDao;
import com.kh.manage.member.model.exception.LoginException;
import com.kh.manage.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;
//	@Autowired
//	private BCryptPasswordEncoder passwordEncoder;
	
	
	//로그인용 메소드
//	@Override
//	public Member loginMember(Member m) throws LoginException {
//		
//		Member loginUser = null;
//		
//		String encPassword = md.selectEncPassword(sqlSession, m);
//		
//		if(!passwordEncoder.matches(m.getMemberPwd(), encPassword)) {
//			throw new LoginException("로그인 실패!");
//		} else {
//			loginUser = md.selectMember(sqlSession, m);
//		}
//		
//		return loginUser;
//	}
	

	// xml에 AOP 설정 후 트랜젝션 적용
	@Override
	public int insertMember(Member m) {
		
		return md.insertMember(sqlSession, m);
	}
	
	@Override
	public Member loginMember(Member m) throws LoginException {

		Member loginUser = md.loginCheck(sqlSession, m);
		
		return loginUser;
	}	
	
	
}
