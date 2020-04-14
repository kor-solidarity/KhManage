package com.kh.manage.forum.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.forum.model.dao.ForumDao;
import com.kh.manage.forum.model.vo.Notice;

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
		
		return fd.selectNotice(sqlSession, n);
	}

}
