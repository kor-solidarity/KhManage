package com.kh.manage.work.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.vo.Work;

public interface WorkDao {

	int insertWork(SqlSessionTemplate sqlSession, Work work);

	List<Work> selectWorkList(SqlSessionTemplate sqlSession, Member member);

	Work selectWork(SqlSessionTemplate sqlSession, String workNo);

}
