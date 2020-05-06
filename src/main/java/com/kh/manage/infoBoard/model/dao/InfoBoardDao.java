package com.kh.manage.infoBoard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.infoBoard.model.vo.BoReply;
import com.kh.manage.infoBoard.model.vo.InfoBoard;

public interface InfoBoardDao {

	int insertBoard(SqlSessionTemplate sqlSession, InfoBoard ib);

	String selectCurrval(SqlSessionTemplate sqlSession);
	
	int insertAttach(SqlSessionTemplate sqlSession, Attachment at);

	int boardListCount(SqlSessionTemplate sqlSession);

	List<InfoBoard> boardSelectAll(SqlSessionTemplate sqlSession, PageInfo pi);

	InfoBoard selectOneBoard(SqlSessionTemplate sqlSession, InfoBoard ib);

	void countPlus(SqlSessionTemplate sqlSession, InfoBoard ib);

	int insertReply(SqlSessionTemplate sqlSession, BoReply rp);

	List<BoReply> selectAllReply(SqlSessionTemplate sqlSession, InfoBoard ib);

	int updateBoard(SqlSessionTemplate sqlSession, InfoBoard ib);

	int deleteBoard(SqlSessionTemplate sqlSession, String boardNo);

	int deleteReply(SqlSessionTemplate sqlSession, String replyNo);

	int updateReply(SqlSessionTemplate sqlSession, BoReply rp);





}
