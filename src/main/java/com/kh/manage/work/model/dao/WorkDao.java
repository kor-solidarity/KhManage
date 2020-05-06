package com.kh.manage.work.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.common.Attachment;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.vo.Grantor;
import com.kh.manage.work.model.vo.Work;
import com.kh.manage.work.model.vo.WorkAttachment;
import com.kh.manage.work.model.vo.WorkProductw;
import com.kh.manage.work.model.vo.WorkProjectName;
import com.kh.manage.work.model.vo.WorkProjectTeam;

public interface WorkDao {

	int insertWork(SqlSessionTemplate sqlSession, Work work);

	List<Work> selectWorkList(SqlSessionTemplate sqlSession, Member member);

	Work selectWork(SqlSessionTemplate sqlSession, String workNo);

	HashMap<String, List> selectWorkMap(SqlSessionTemplate sqlSession, Member member);

	List<WorkProjectTeam> selectTeamWork(SqlSessionTemplate sqlSession, Member member);

	int updateMyWork(SqlSessionTemplate sqlSession, Work work);

	List<Grantor> selectGrantorList(SqlSessionTemplate sqlSession, String pk);

	int insertWorkProduct(SqlSessionTemplate sqlSession, WorkProductw wp);

	int insertWorkAttachment(SqlSessionTemplate sqlSession, Attachment at);

	List<WorkAttachment> selectWorkAttachment(SqlSessionTemplate sqlSession, String workNo);

	int deleteWorkProduct(SqlSessionTemplate sqlSession, String atNo);

	int insertWorkHistory(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	WorkProjectTeam selectWorkProjectTeam(SqlSessionTemplate sqlSession, Work work);

	int insertWorkHistory2(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	List<WorkProjectName> selectWorkGrantorList(SqlSessionTemplate sqlSession, Member member);

	List<Work> selectHighWorkNoList(SqlSessionTemplate sqlSession, HashMap<String, String> map);

	List<Work> selectHighWorkNoList2(SqlSessionTemplate sqlSession, Work w);

	List<Grantor> selectGrantorList2(SqlSessionTemplate sqlSession, String projectNo);

}
