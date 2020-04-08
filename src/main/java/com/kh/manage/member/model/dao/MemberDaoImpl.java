package com.kh.manage.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.rank.model.vo.Rank;
import com.kh.manage.member.model.exception.LoginException;
import com.kh.manage.member.model.vo.Member;

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
	public List<Dept> selectList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Dept.selectDeptList");
	}

	@Override
	public List<Rank> selectRankList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Rank.selectRankList");
	}



}
