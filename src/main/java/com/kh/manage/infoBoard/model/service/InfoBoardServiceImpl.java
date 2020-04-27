package com.kh.manage.infoBoard.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.common.Attachment;
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
	
	
	//등록 
	@Override
	public int insertBoard(InfoBoard ib, Attachment at) {

		int result = 0;
		
		int result1 = id.insertBoard(sqlSession,ib);
		System.out.println("result1 : " + result1);
		
		
		
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



	@Override
	public int updateBoard(InfoBoard ib) {

		return id.updateBoard(sqlSession, ib);
	}



	@Override
	public int deleteBoard(String boardNo) {
		
		return id.deleteBoard(sqlSession, boardNo);
	}






	










	
	
	
	
}
