package com.kh.manage.generalWork.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.generalWork.model.vo.GeneralWork;
import com.kh.manage.member.model.vo.Member;

public interface GeneralWorkDao {

	int insertGeneralWork(SqlSessionTemplate sqlSession, GeneralWork work);

	GeneralWork selectInsertGeneralWork(SqlSessionTemplate sqlSession, GeneralWork work);

	int insertGeneralWorkAttachment(SqlSessionTemplate sqlSession, Attachment at);

	int getListCount(SqlSessionTemplate sqlSession, Member m);

	List<GeneralWork> generalWorkSelectAll(SqlSessionTemplate sqlSession, PageInfo pi, Member m);

	GeneralWork selectOneGeneralWork(SqlSessionTemplate sqlSession, GeneralWork work);

	List<Attachment> attachmentList(SqlSessionTemplate sqlSession, GeneralWork work);

	int deleteGeneralWork(SqlSessionTemplate sqlSession, GeneralWork work);

	int deleteAttachment(SqlSessionTemplate sqlSession, GeneralWork work);

	Attachment selectOneAttachment(SqlSessionTemplate sqlSession, Attachment atNo);

	List<Attachment> selectAllAttachment(SqlSessionTemplate sqlSession, GeneralWork work);

}
