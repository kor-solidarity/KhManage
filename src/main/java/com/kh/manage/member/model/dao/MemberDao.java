package com.kh.manage.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.member.model.exception.LoginException;
import com.kh.manage.member.model.vo.Member;


public interface MemberDao {

	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException ;
	
	int insertMember(SqlSessionTemplate sqlSession, Member m);
	
	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	Member selectMember(SqlSessionTemplate sqlSession, Member m);


}
