package com.kh.manage.issue.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.issue.model.vo.IssueWPT;
import com.kh.manage.member.model.vo.Member;

@Repository
public class IssueDaoImpl implements IssueDao{

	@Override
	public List<IssueWPT> selectProjectName(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectList("Issue.selectProjectName", member);
	}

}