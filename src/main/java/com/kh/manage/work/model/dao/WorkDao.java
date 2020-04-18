package com.kh.manage.work.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.vo.Work;
import com.kh.manage.work.model.vo.WorkProjectTeam;

public interface WorkDao {

	int insertWork(SqlSessionTemplate sqlSession, Work work);

	List<Work> selectWorkList(SqlSessionTemplate sqlSession, Member member);

	Work selectWork(SqlSessionTemplate sqlSession, String workNo);

	HashMap<String, List> selectWorkMap(SqlSessionTemplate sqlSession, Member member);

	List<WorkProjectTeam> selectTeamWork(SqlSessionTemplate sqlSession, Member member);

	int updateMyWork(SqlSessionTemplate sqlSession, Work work);

}
