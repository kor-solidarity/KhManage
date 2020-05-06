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

	@Override
	public int getListCount2(SqlSessionTemplate sqlSession, Mail m) {

		return sqlSession.selectOne("Mail.listCount2",m);
	}

	@Override
	public List<Mail> selectReciveMail(SqlSessionTemplate sqlSession, Mail m, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		return sqlSession.selectList("Mail.reciveMailList",m, rowBounds);
	}

	@Override
	public Mail reciveMailOne(SqlSessionTemplate sqlSession, String mNo) {

		return sqlSession.selectOne("Mail.reciveMailOne",mNo);
	}

	@Override
	public int updateImportant(SqlSessionTemplate sqlSession, Mail mail) {

		return sqlSession.update("Mail.updateImportant", mail);
	}

	@Override
	public int updateImportant2(SqlSessionTemplate sqlSession, Mail mail) {

		return sqlSession.update("Mail.updateImportant2", mail);
	}

	@Override
	public int updateTrash(SqlSessionTemplate sqlSession, String mNo) {

		return sqlSession.update("Mail.updateTrash" , mNo);
	}

	@Override
	public int getListCount3(SqlSessionTemplate sqlSession, Mail mail) {

		return sqlSession.selectOne("Mail.getListCount3", mail);
	}

	@Override
	public List<Mail> selectImportList(SqlSessionTemplate sqlSession, Mail mail, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		return sqlSession.selectList("Mail.impMailList", mail, rowBounds);
	}

	@Override
	public int getListCount4(SqlSessionTemplate sqlSession, Mail mail) {

		return sqlSession.selectOne("Mail.getListCount4", mail);
	}

	@Override
	public List<Mail> selectTrashList(SqlSessionTemplate sqlSession, Mail mail, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		return sqlSession.selectList("Mail.trashMailList", mail, rowBounds);
	}

	@Override
	public int insertMailBox2(SqlSessionTemplate sqlSession, Mail m) {

		return sqlSession.insert("Mail.insertMailBox2", m);
	}

	@Override
	public int insertMailBox3(SqlSessionTemplate sqlSession, Mail m) {

		return sqlSession.insert("Mail.insertMailBox3" , m);
	}

	@Override
	public int updateRead(SqlSessionTemplate sqlSession, Mail mail) {

		return sqlSession.update("Mail.updateRead",mail);
	}

	@Override
	public void deleteMail(SqlSessionTemplate sqlSession, String mNo) {

		sqlSession.update("Mail.deleteMail",mNo);
	}

	@Override
	public int getListCount5(SqlSessionTemplate sqlSession, Mail mail) {

		return sqlSession.insert("Mail.listCount5", mail);
	}

	@Override
	public List<Mail> nReadMailList(SqlSessionTemplate sqlSession, Mail mail, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Mail.nReadMailList" ,mail , rowBounds);
	}


}
