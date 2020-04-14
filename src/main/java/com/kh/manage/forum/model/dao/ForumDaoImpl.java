package com.kh.manage.forum.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.forum.model.vo.Notice;

@Repository
public class ForumDaoImpl implements ForumDao{

	@Override
	public int noticeInsert(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("Notice.noticeInsert",n);
	}

	@Override
	public String selectCurrval(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Notice.selectCurrval");
	}

	@Override
	public int attachInsert(SqlSessionTemplate sqlSession, Attachment at) {
		
		return sqlSession.insert("Attachment.insertAttach",at);
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Notice.getListCount");
	}

	@Override
	public List<Notice> noticeSelectAll(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Notice.selectAll", null, rowBounds);
	}

	@Override
	public Notice selectNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.selectOne("Notice.selectNotice",n);
	}
	
}
