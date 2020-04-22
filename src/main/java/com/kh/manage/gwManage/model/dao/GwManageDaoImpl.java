package com.kh.manage.gwManage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.gwManage.model.vo.GWork;
import com.kh.manage.gwManage.model.vo.GwRepeat;
import com.kh.manage.member.model.vo.Member;

@Repository
public class GwManageDaoImpl implements GwManageDao{

	@Override
	public List<GWork> selectAllList(SqlSessionTemplate sqlSession, String memberNo) {

		return sqlSession.selectList("GWork.selectAllList", memberNo);
	}

	@Override
	public int insertGw(SqlSessionTemplate sqlSession, GWork g) {

		return sqlSession.insert("GWork.insertGw", g);
	}

	@Override
	public int updateGw(SqlSessionTemplate sqlSession, GWork g) {

		System.out.println("asdasdads");
		return sqlSession.update("GWork.updateGw", g);
	}

	@Override
	public int deleteGw(SqlSessionTemplate sqlSession, GWork g) {

		return sqlSession.update("GWork.deleteGw",g);
	}

	@Override
	public List<Member> MemberList(SqlSessionTemplate sqlSession) {
	
		return sqlSession.selectList("Member.selectMemberList");
	}

	@Override
	public String selectCurrval(SqlSessionTemplate sqlSession, GWork g) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("GWork.selectCurrval");
	}

	@Override
	public int insertGwWeek(SqlSessionTemplate sqlSession, GwRepeat gr) {

		return sqlSession.insert("GWork.insertGwRepeat",gr);
	}

	@Override
	public int insertGwDay(SqlSessionTemplate sqlSession, GwRepeat gr) {
		
		return sqlSession.insert("GWork.insertGwRepeat2",gr);
	}
	
	

}
