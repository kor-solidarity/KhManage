package com.kh.manage.infoBoard.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.common.PageInfo;
import com.kh.manage.infoBoard.model.dao.InfoBoardDao;
import com.kh.manage.infoBoard.model.vo.BoReply;
import com.kh.manage.infoBoard.model.vo.InfoBoard;

@Service
public class InfoBoardServiceImpl implements InfoBoardService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private InfoBoardDao id;
	
	
	
	@Override
	public int insertBoard(InfoBoard ib) {

		int result = id.insertBoard(sqlSession,ib);
		
		return result;
	}



	@Override
	public int boardListCount() {

		return id.boardListCount(sqlSession);
	}



	@Override
	public List<InfoBoard> boardSelectAll(PageInfo pi) {

		return id.boardSelectAll(sqlSession, pi);
	}



	@Override
	public InfoBoard selectOneBoard(InfoBoard ib) {

		InfoBoard board = id.selectOneBoard(sqlSession, ib);
		id.countPlus(sqlSession, ib);
		
		return board;
	}



	@Override
	public int insertReply(BoReply rp) {
		
		return id.insertReply(sqlSession, rp);
	}



	@Override
	public List<BoReply> selectAllReply(InfoBoard ib) {

		return id.selectAllReply(sqlSession, ib);
	}













	
	
	
	
}
