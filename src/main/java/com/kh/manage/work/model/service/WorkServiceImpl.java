package com.kh.manage.work.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.common.Attachment;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.dao.WorkDao;
import com.kh.manage.work.model.vo.Grantor;
import com.kh.manage.work.model.vo.Work;
import com.kh.manage.work.model.vo.WorkAttachment;
import com.kh.manage.work.model.vo.WorkProductw;
import com.kh.manage.work.model.vo.WorkProjectName;
import com.kh.manage.work.model.vo.WorkProjectTeam;

@Service
public class WorkServiceImpl implements WorkService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private WorkDao wd;
	
	@Override
	public int insertWork(Work work) {
		
		return wd.insertWork(sqlSession, work);
	}

	@Override
	public List<Work> selectWorkList(Member member) {
		
		return wd.selectWorkList(sqlSession, member);
	}

	@Override
	public Work selectWork(String workNo) {
		return wd.selectWork(sqlSession, workNo);
	}

	@Override
	public HashMap<String, List> selectWorkMap(Member member) {
		return wd.selectWorkMap(sqlSession, member);
	}

	@Override
	public List<WorkProjectTeam> selectTeamWork(Member member) {
		return wd.selectTeamWork(sqlSession, member);
	}

	@Override
	public int updateMyWork(Work work) {
		return wd.updateMyWork(sqlSession, work);
	}

	@Override
	public List<Grantor> selectGrantorList(String pk) {
		return wd.selectGrantorList(sqlSession, pk);
	}

	@Override
	public int insertWorkProduct(WorkProductw wp) {
		return wd.insertWorkProduct(sqlSession, wp);
	}

	@Override
	public int insertWorkAttachment(Attachment at) {
		return wd.insertWorkAttachment(sqlSession, at);
	}

	@Override
	public List<WorkAttachment> selectWorkAttachment(String workNo) {
		return wd.selectWorkAttachment(sqlSession, workNo);
	}

	@Override
	public int deleteWorkProduct(String atNo) {
		return wd.deleteWorkProduct(sqlSession, atNo);
	}


	@Override
	public WorkProjectTeam selectWorkProjectTeam(Work work) {
		return wd.selectWorkProjectTeam(sqlSession, work);
	}

	@Override
	public int insertWorkHistory(HashMap<String, Object> map) {
		return wd.insertWorkHistory(sqlSession, map);
	}

	@Override
	public int insertWorkHistory2(HashMap<String, Object> map) {
		return wd.insertWorkHistory2(sqlSession, map);
	}

	@Override
	public List<WorkProjectName> selectWorkGrantorList(Member member) {
		return wd.selectWorkGrantorList(sqlSession, member);
	}

	@Override
	public List<Work> selectHighWorkNoList(HashMap<String, String> map) {
		return wd.selectHighWorkNoList(sqlSession, map);
	}

	@Override
	public List<Work> selectHighWorkNoList2(Work w) {
		return wd.selectHighWorkNoList2(sqlSession, w);
	}

	

	

}
