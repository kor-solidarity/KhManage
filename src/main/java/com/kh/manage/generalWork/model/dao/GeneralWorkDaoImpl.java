package com.kh.manage.generalWork.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.generalWork.model.vo.GeneralWork;
import com.kh.manage.member.model.vo.Member;

@Repository
public class GeneralWorkDaoImpl implements GeneralWorkDao{

	@Override
	public int insertGeneralWork(SqlSessionTemplate sqlSession, GeneralWork work) {
		
		return sqlSession.insert("GeneralWork.insertGeneralWork", work);
	}

	@Override
	public GeneralWork selectInsertGeneralWork(SqlSessionTemplate sqlSession, GeneralWork work) {
		
		return sqlSession.selectOne("GeneralWork.selectInsertGeneralWork", work);
	}

	@Override
	public int insertGeneralWorkAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		
		return sqlSession.insert("GeneralWork.insertGeneralWorkAttachment", at);
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("GeneralWork.getListCount", m);
	}

	@Override
	public List<GeneralWork> generalWorkSelectAll(SqlSessionTemplate sqlSession, PageInfo pi, Member m) {
	
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("GeneralWork.generalWorkSelectAll", m, rowBounds);
	}

	@Override
	public GeneralWork selectOneGeneralWork(SqlSessionTemplate sqlSession, GeneralWork work) {
		
		return sqlSession.selectOne("GeneralWork.selectOneGeneralWork", work);
	}

	@Override
	public List<Attachment> attachmentList(SqlSessionTemplate sqlSession, GeneralWork work) {

		return sqlSession.selectList("GeneralWork.attachmentList", work);
	}

	@Override
	public int deleteGeneralWork(SqlSessionTemplate sqlSession, GeneralWork work) {

		return sqlSession.update("GeneralWork.deleteGeneralWork", work);
	}

	@Override
	public int deleteAttachment(SqlSessionTemplate sqlSession, GeneralWork work) {

		return sqlSession.delete("GeneralWork.deleteAttachment", work);
	}

	@Override
	public Attachment selectOneAttachment(SqlSessionTemplate sqlSession, Attachment atNo) {
		
		return sqlSession.selectOne("GeneralWork.selectOneAttachment", atNo);
	}

	@Override
	public List<Attachment> selectAllAttachment(SqlSessionTemplate sqlSession, GeneralWork work) {
		
		return sqlSession.selectList("GeneralWork.selectAllAttachment", work);
	}
	
}
