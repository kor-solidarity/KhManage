package com.kh.manage.infoBoard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.common.PageInfo;
import com.kh.manage.infoBoard.model.vo.InfoBoard;
import com.kh.manage.infoBoard.model.vo.Reply;

public interface InfoBoardDao {

	int insertBoard(SqlSessionTemplate sqlSession, InfoBoard ib);

	int boardListCount(SqlSessionTemplate sqlSession);

	List<InfoBoard> boardSelectAll(SqlSessionTemplate sqlSession, PageInfo pi);

	InfoBoard selectOneBoard(SqlSessionTemplate sqlSession, InfoBoard ib);

	void countPlus(SqlSessionTemplate sqlSession, InfoBoard ib);

	int insertReply(SqlSessionTemplate sqlSession, Reply rp);


}
