package com.kh.manage.generalWork.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.generalWork.model.dao.GeneralWorkDao;
import com.kh.manage.generalWork.model.vo.GeneralWork;
import com.kh.manage.member.model.vo.Member;

@Service
public class GeneralWorkServiceImpl implements GeneralWorkService {
	
	@Autowired
	private GeneralWorkDao gd;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public GeneralWork insertGeneralWork(GeneralWork work) {
		
		int result = gd.insertGeneralWork(sqlSession , work);
		
		return gd.selectInsertGeneralWork(sqlSession, work);
	}

	@Override
	public int insertGeneralWorkAttachment(Attachment at) {
		
		return gd.insertGeneralWorkAttachment(sqlSession, at);
	}

	@Override
	public int getListCount(Member m) {
		
		return gd.getListCount(sqlSession, m);
	}

	@Override
	public List<GeneralWork> generalWorkSelectAll(PageInfo pi, Member m) {
		
		return gd.generalWorkSelectAll(sqlSession, pi, m);
	}

	@Override
	public GeneralWork selectOneGeneralWork(GeneralWork work) {
		
		return gd.selectOneGeneralWork(sqlSession, work);
	}

	@Override
	public List<Attachment> attachmentList(GeneralWork work) {
		
		return gd.attachmentList(sqlSession, work);
	}

	@Override
	public int deleteGeneralWork(GeneralWork work) {

		return gd.deleteGeneralWork(sqlSession, work);
	}

	@Override
	public int deleteAttachment(GeneralWork work) {
		
		return gd.deleteAttachment(sqlSession, work);
	}

	@Override
	public Attachment selectOneAttachment(Attachment atNo) {
		
		return gd.selectOneAttachment(sqlSession, atNo);
	}

	@Override
	public List<Attachment> selectAllAttachment(GeneralWork work) {
		
		return gd.selectAllAttachment(sqlSession, work);
	}

	
}
