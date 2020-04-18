package com.kh.manage.issue.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.issue.model.vo.IssueWPT;
import com.kh.manage.member.model.vo.Member;

public interface IssueDao {

	List<IssueWPT> selectProjectName(SqlSessionTemplate sqlSession, Member member);

}
