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
		
		String infoBoard1 = id.selectCurrval(sqlSession);
		String infoBoard2 = "";
		int no = Integer.parseInt(infoBoard1);
		
		if(no < 10) {
			infoBoard2 = "BO00" + infoBoard1;
		} else {
			infoBoard2 = "BO0" + infoBoard1;
		}
		
		at.setDivision(infoBoard2);
		
		int result2 = id.insertAttach(sqlSession, at);
		
		System.out.println("result2 : " + result2);
		
		if(result1 > 0 && result2 > 0) {
			
			result = 1;
		}
		
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
		id.countPlus(sqlSession, board);
		
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



	@Override
	public int deleteReply(String replyNo) {
		
		return id.deleteReply(sqlSession, replyNo);
	}



	@Override
	public int updateReply(BoReply rp) {

		return id.updateReply(sqlSession, rp);
	}



	






	










	
	
	
	
}
