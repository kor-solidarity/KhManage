package com.kh.manage.work.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.vo.Work;

@Repository
public class WorkDaoImpl implements WorkDao{

	@Override
	public int insertWork(SqlSessionTemplate sqlSession, Work work) {
		
		return sqlSession.insert("Work.insertWork", work);
	}

	@Override
	public List<Work> selectWorkList(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectList("Work.selectWorkList", member);
	}

	@Override
	public Work selectWork(SqlSessionTemplate sqlSession, String workNo) {
		return sqlSession.selectOne("Work.selectWork", workNo);
	}

}
