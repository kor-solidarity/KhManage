package com.kh.manage.forum.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.forum.model.dao.ForumDao;
import com.kh.manage.forum.model.vo.Mwork;
import com.kh.manage.forum.model.vo.Notice;
import com.kh.manage.forum.model.vo.Reply;
import com.kh.manage.project.model.vo.ProjectDetail;

@Service
public class ForumServiceImpl implements ForumService{

	@Autowired
	private ForumDao fd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int noticeInsert(Notice n, Attachment at) {
		
		System.out.println("service");
		int result = 0;
		
		int result1 = fd.noticeInsert(sqlSession,n);
		
		System.out.println("result1 : " + result1);
		
		String nNo = fd.selectCurrval(sqlSession);
		String nNo2 = "";
		int no = Integer.parseInt(nNo);
		
		if(no < 10) {
			nNo2 = "NOT00" + nNo;
		}else {
			nNo2 = "NOT0" + nNo;
		}
		
		at.setDivision(nNo2);
		
		System.out.println(nNo2);
		
		int result2 = fd.attachInsert(sqlSession,at);
		
		
		System.out.println("result2 : " + result2);
		
		if(result1 > 0 && result2 > 0) {
			
			result = 1;
		}
		
		return result;
		
	}

	@Override
	public int getListCount() {
		
		return fd.getListCount(sqlSession);
	}

	@Override
	public List<Notice> noticeSelectAll(PageInfo pi) {
		
		return fd.noticeSelectAll(sqlSession, pi);
	}
	
	
	@Override
	public Notice selectNotice(Notice n) {
		
		Notice notice =fd.selectNotice(sqlSession, n);
		fd.countPlus(sqlSession, notice);
		
		return notice;
	}

	@Override
	public Attachment selectAttachment(Attachment at) {
		
		
		return fd.selectAttachment(sqlSession, at);
	}

	@Override
	public Attachment downAttachment(String no) {
		
		return fd.downAttachment(sqlSession, no);
	}

	@Override
	public int replyInsert(Reply rp) {
		
		return fd.replyInsert(sqlSession, rp);
	}

	@Override
	public List<Reply> selectAllReply(String no) {
		
		return fd.selectAllReply(sqlSession, no);
	}

	@Override
	public int deleteNotice(String nNo) {
		
		return fd.deleteNotice(sqlSession, nNo);
	}

	@Override
	public Notice updateNoticeSelect(String nNo) {

		return fd.updateNoticeSelect(sqlSession,nNo);
	}

	@Override
	public int deleteReply(String no) {
		
		return fd.deleteReply(sqlSession, no);
	}

	@Override
	public int replyUpdate(Reply rp) {
		
		return fd.replyUpdate(sqlSession, rp);
	}

	@Override
	public int noticeUpdate(Notice n, Attachment at) {
		int result = 0;
		
		int result1 = fd.noticeUpdate(sqlSession,n);
		
		System.out.println("result1 : " + result1);
		
		at.setDivision(n.getNoticeNo());
		
		int result2 = fd.attachUpdate(sqlSession,at);
		
		System.out.println("result2 : " + result2);
		
		if(result1 > 0 && result2 > 0) {
			
			result = 1;
		}
		
		return result;
	}

	@Override
	public int noticeUpdate2(Notice n) {
		
		return fd.noticeUpdate(sqlSession, n);
	}


	@Override
	public List<Mwork> selectListWork(Mwork w) {

		return fd.selectListWork(sqlSession, w);
	}


}
