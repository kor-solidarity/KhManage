package com.kh.manage.infoBoard.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.infoBoard.model.vo.BoReply;
import com.kh.manage.infoBoard.model.vo.InfoBoard;

@Repository
public class InfoBoardDaoImpl implements InfoBoardDao {

	@Override
	public int insertBoard(SqlSessionTemplate sqlSession, InfoBoard ib) {
		
		return sqlSession.insert("InfoBoard.insertBoard", ib);
	}
	
	@Override
	public String selectCurrval(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("InfoBoard.selectCurrval");
	}

	@Override
	public int insertAttach(SqlSessionTemplate sqlSession, Attachment at) {
	
		return sqlSession.insert("Attachment.insertAttach", at);
	}

	@Override
	public int boardListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("InfoBoard.boardListCount");
	}

	@Override
	public List<InfoBoard> boardSelectAll(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("InfoBoard.boardSelectAll", null, rowBounds);
	}

	@Override
	public InfoBoard selectOneBoard(SqlSessionTemplate sqlSession, InfoBoard ib) {

		return sqlSession.selectOne("InfoBoard.selectOneBoard", ib);
	}

	@Override
	public void countPlus(SqlSessionTemplate sqlSession, InfoBoard ib) {
	
		sqlSession.update("InfoBoard.countPlus", ib);
		
	}

	@Override
	public int insertReply(SqlSessionTemplate sqlSession, BoReply rp) {

		return sqlSession.insert("InfoBoard.insertReply", rp);
	}

	@Override
	public List<BoReply> selectAllReply(SqlSessionTemplate sqlSession, InfoBoard ib) {

		return sqlSession.selectList("InfoBoard.selectAllReply", ib);
	}

	@Override
	public int updateBoard(SqlSessionTemplate sqlSession, InfoBoard ib) {

		return sqlSession.update("InfoBoard.updateBoard", ib);
	}

	@Override
	public int deleteBoard(SqlSessionTemplate sqlSession, String boardNo) {

		return sqlSession.update("InfoBoard.deleteBoard", boardNo);
	}

	@Override
	public int deleteReply(SqlSessionTemplate sqlSession, String replyNo) {

		return sqlSession.update("InfoBoard.deleteReply", replyNo);
	}

	@Override
	public int updateReply(SqlSessionTemplate sqlSession, BoReply rp) {

		return sqlSession.update("InfoBoard.updateReply", rp);
	}

	@Override
	public Attachment selectAttachment(SqlSessionTemplate sqlSession, Attachment at) {

		return sqlSession.selectOne("Attachment.selectAttach",at);
	}

	@Override
	public Attachment downAttachment(SqlSessionTemplate sqlSession, String no) {

		return sqlSession.selectOne("Attachment.downAttach", no);
	}










}
