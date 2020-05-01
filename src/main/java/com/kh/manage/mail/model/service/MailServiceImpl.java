package com.kh.manage.mail.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.common.PageInfo;
import com.kh.manage.mail.model.dao.MailDao;
import com.kh.manage.mail.model.vo.AttachmentMail;
import com.kh.manage.mail.model.vo.Mail;

@Service
public class MailServiceImpl implements MailService{
	
	@Autowired
	private MailDao md;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMail(Mail m, List<AttachmentMail> fileList) {
		
		int result = 0;
		
			
			
		int	result1 = md.insertMail(sqlSession, m);
			
		int	result2 = md.insertAttachment(sqlSession, fileList);
			
		int	result3 = md.insertMailBox(sqlSession, m);
			
		int	result4 = md.insertReceiver(sqlSession, m);
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			
			result = 1;
		}
			
		
		return result;
	}

	@Override
	public List<Mail> sentMailList(Mail mail , PageInfo pi) {
		
		return md.sentMailList(sqlSession, mail, pi);
	}

	@Override
	public Mail selectMailOne(String no) {

		return md.selectMailOne(sqlSession, no);
	}

	@Override
	public AttachmentMail downAttachment(String no) {

		return md.downAttachment(sqlSession, no);
	}

	@Override
	public int getListCount(Mail mail) {

		return md.getListCount(sqlSession, mail);
	}

	@Override
	public void insertReciveMail(Mail reciveMail) {

		md.insertReciveMail(sqlSession, reciveMail);
		
		md.insertReciveMailBox(sqlSession, reciveMail);
	}
	
	

}
