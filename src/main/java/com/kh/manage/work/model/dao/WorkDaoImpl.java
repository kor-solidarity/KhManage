package com.kh.manage.work.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.common.Attachment;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.vo.Grantor;
import com.kh.manage.work.model.vo.Work;
import com.kh.manage.work.model.vo.WorkAttachment;
import com.kh.manage.work.model.vo.WorkProductw;
import com.kh.manage.work.model.vo.WorkProjectName;
import com.kh.manage.work.model.vo.WorkProjectTeam;

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

	@Override
	public HashMap<String, List> selectWorkMap(SqlSessionTemplate sqlSession, Member member) {
		
		HashMap<String, List> map = new HashMap();
		
		List<WorkProjectName> list1 = sqlSession.selectList("Work.selectWorkList1", member);
		List<WorkProjectName> list2 = sqlSession.selectList("Work.selectWorkList2", member);
		List<WorkProjectName> list3 = sqlSession.selectList("Work.selectWorkList3", member);
		List<WorkProjectName> list4 = sqlSession.selectList("Work.selectWorkList4", member);
		List<WorkProjectName> list5 = sqlSession.selectList("Work.selectWorkList5", member);
		List<WorkProjectName> list6 = sqlSession.selectList("Work.selectWorkList6", member);
		List<WorkProjectName> list7 = sqlSession.selectList("Work.selectWorkList7", member);
		
		map.put("list1", list1);
		map.put("list2", list2);
		map.put("list3", list3);
		map.put("list4", list4);
		map.put("list5", list5);
		map.put("list6", list6);
		map.put("list7", list7);
		
		
		return map;
	}

	@Override
	public List<WorkProjectTeam> selectTeamWork(SqlSessionTemplate sqlSession, Member member) {
		
		return sqlSession.selectList("Work.selectTeamWork", member);
	}

	@Override
	public int updateMyWork(SqlSessionTemplate sqlSession, Work work) {
		return sqlSession.update("Work.updateMyWork", work);
	}

	@Override
	public List<Grantor> selectGrantorList(SqlSessionTemplate sqlSession, String pk) {
		return sqlSession.selectList("Work.selectGrantorList", pk);
	}

	@Override
	public int insertWorkProduct(SqlSessionTemplate sqlSession, WorkProductw wp) {
		return sqlSession.insert("Work.insertWorkProduct", wp);
	}

	@Override
	public int insertWorkAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("Work.insertWorkAttachment", at);
	}

	@Override
	public List<WorkAttachment> selectWorkAttachment(SqlSessionTemplate sqlSession, String workNo) {
		return sqlSession.selectList("Work.selectWorkAttachment", workNo);
	}

	@Override
	public int deleteWorkProduct(SqlSessionTemplate sqlSession, String atNo) {
		return sqlSession.delete("Work.deleteWorkProduct", atNo);
	}

	@Override
	public WorkProjectTeam selectWorkProjectTeam(SqlSessionTemplate sqlSession, Work work) {
		return sqlSession.selectOne("Work.selectWorkProjectTeam", work);
	}

	@Override
	public int insertWorkHistory(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("Work.insertWorkHistory", map);
	}

	@Override
	public int insertWorkHistory2(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("Work.insertWorkHistory2", map);
	}

	@Override
	public List<WorkProjectName> selectWorkGrantorList(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectList("Work.selectWorkGrantorList", member);
	}

	@Override
	public List<Work> selectHighWorkNoList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectList("Work.selectHighWorkNoList", map);
	}

	@Override
	public List<Work> selectHighWorkNoList2(SqlSessionTemplate sqlSession, Work w) {
		return sqlSession.selectList("Work.selectHighWorkNoList2", w);
	}

	@Override
	public List<Grantor> selectGrantorList2(SqlSessionTemplate sqlSession, String projectNo) {
		return sqlSession.selectList("Work.selectGrantorList2", projectNo);
	}

	

}
