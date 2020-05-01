package com.kh.manage.mail.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.common.PageInfo;
import com.kh.manage.mail.model.vo.AttachmentMail;
import com.kh.manage.mail.model.vo.Mail;

@Repository
public class MailDaoImpl implements MailDao{

	@Override
	public int insertMail(SqlSessionTemplate sqlSession, Mail m) {

		return sqlSession.insert("Mail.insertMail", m);
	}

	@Override
	public int insertAttachment(SqlSessionTemplate sqlSession, List<AttachmentMail> fileList) {
		
		int result = 0;
		
		for(int i =0; i < fileList.size(); i++) {
			result =sqlSession.insert("Mail.insertAt", fileList.get(i));
		}
		
		return result;
	}

	@Override
	public int insertMailBox(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.insert("Mail.insertMailBox", m);
	}

	@Override
	public int insertReceiver(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.insert("Mail.insertReceiver", m);
	}

	@Override
	public List<Mail> sentMailList(SqlSessionTemplate sqlSession, Mail mail, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		//return sqlSession.selectList("Notice.selectAll", null, rowBounds);
		
		return sqlSession.selectList("Mail.sentMailList" ,mail , rowBounds);
	}

	@Override
	public Mail selectMailOne(SqlSessionTemplate sqlSession, String no) {

		return sqlSession.selectOne("Mail.selectMailOne" ,no);
	}

	@Override
	public AttachmentMail downAttachment(SqlSessionTemplate sqlSession, String no) {

		return sqlSession.selectOne("Mail.downAttach", no);
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession, Mail mail) {

		return sqlSession.selectOne("Mail.listCount", mail);
	}

	@Override
	public void insertReciveMail(SqlSessionTemplate sqlSession, Mail reciveMail) {

		sqlSession.insert("Mail.insertReciveMail", reciveMail);
	}

	@Override
	public void insertReciveMailBox(SqlSessionTemplate sqlSession, Mail reciveMail) {

		sqlSession.insert("Mail.insertReciveMailBox", reciveMail);
	}

}
