package com.kh.manage.infoBoard.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.common.PageInfo;
import com.kh.manage.forum.model.vo.Reply;
import com.kh.manage.infoBoard.model.vo.InfoBoard;

@Repository
public class InfoBoardDaoImpl implements InfoBoardDao {

	@Override
	public int insertBoard(SqlSessionTemplate sqlSession, InfoBoard ib) {
		
		return sqlSession.insert("InfoBoard.insertBoard", ib);
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


}
