package com.kh.manage.mail.model.service;

import java.util.ArrayList;
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

	@Override
	public int getListCount2(Mail m) {

		return md.getListCount2(sqlSession, m);
	}

	@Override
	public List<Mail> selectReciveMail(Mail m, PageInfo pi) {

		return md.selectReciveMail(sqlSession, m, pi);
	}

	@Override
	public Mail reciveMailOne(String mNo) {

		return md.reciveMailOne(sqlSession, mNo);
	}

	@Override
	public int updateImportant(Mail mail) {

		int result = 0;
		
		if(mail.getImportant().equals("Y")) {
			
			result = md.updateImportant(sqlSession, mail);
			
		}else {
			
			result = md.updateImportant2(sqlSession, mail);
			
		}
		
		return result;
	}

	@Override
	public int updateTrash(String mNo) {

		return md.updateTrash(sqlSession, mNo);
	}

	@Override
	public int getListCount3(Mail mail) {

		return md.getListCount3(sqlSession, mail);
	}

	@Override
	public List<Mail> selectImportList(Mail mail, PageInfo pi) {

		return md.selectImportList(sqlSession, mail ,pi);
	}

	@Override
	public int getListCount4(Mail mail) {

		return md.getListCount4(sqlSession, mail);
	}

	@Override
	public List<Mail> selectTrashList(Mail mail, PageInfo pi) {

		return md.selectTrashList(sqlSession, mail ,pi);
	}

	@Override
	public int insertRecive(Mail m, List<AttachmentMail> fileList) {
		int result = 0;
		
		int	result1 = md.insertMail(sqlSession, m);
			
		int	result2 = md.insertAttachment(sqlSession, fileList);
			
		int	result3 = md.insertMailBox2(sqlSession, m);
		
		int	result4 = md.insertReceiver(sqlSession, m);
		
		int result5 = md.insertMailBox3(sqlSession, m);
			
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			
			result = 1;
		}
		
		return result;
	}

	@Override
	public void insertOutMail(Mail mr, ArrayList<AttachmentMail> maList) {
		
		md.insertMail(sqlSession, mr);
		md.insertAttachment(sqlSession, maList);
		md.insertMailBox2(sqlSession, mr);
		md.insertReceiver(sqlSession, mr);
	}

	@Override
	public int updateRead(Mail mail) {

		return md.updateRead(sqlSession, mail);
	}

	
	

}
