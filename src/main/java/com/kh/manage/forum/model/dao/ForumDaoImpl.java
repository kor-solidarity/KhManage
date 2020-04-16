package com.kh.manage.forum.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.forum.model.vo.Notice;
import com.kh.manage.forum.model.vo.Reply;

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

	@Override
	public Attachment selectAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		
		
		return sqlSession.selectOne("Attachment.selectAttach",at);
	}

	@Override
	public Attachment downAttachment(SqlSessionTemplate sqlSession, String no) {

		return sqlSession.selectOne("Attachment.downAttach",no);
	}

	@Override
	public void countPlus(SqlSessionTemplate sqlSession, Notice n) {
		
		sqlSession.update("Notice.countPlus",n);
		
	}

	@Override
	public int replyInsert(SqlSessionTemplate sqlSession, Reply rp) {
		
		return sqlSession.insert("Reply.replyInsert",rp);
	}

	@Override
	public List<Reply> selectAllReply(SqlSessionTemplate sqlSession, String no) {
		
		return sqlSession.selectList("Reply.replySelectAll",no);
	}

	@Override
	public int deleteNotice(SqlSessionTemplate sqlSession, String nNo) {
		
		return sqlSession.update("Notice.deleteNotice", nNo);
	}

	@Override
	public Notice updateNoticeSelect(SqlSessionTemplate sqlSession, String nNo) {
		
		System.out.println("nno:"+nNo);

		return sqlSession.selectOne("Notice.updateNoticeSelect",nNo);
	}

	@Override
	public int deleteReply(SqlSessionTemplate sqlSession, String no) {
		
		return sqlSession.update("Reply.deleteReply",no);
	}

	
}
