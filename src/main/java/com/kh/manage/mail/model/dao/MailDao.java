package com.kh.manage.mail.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.mail.model.vo.AttachmentMail;
import com.kh.manage.mail.model.vo.Mail;

public interface MailDao {

	int insertMail(SqlSessionTemplate sqlSession, Mail m);

	int insertAttachment(SqlSessionTemplate sqlSession, List<AttachmentMail> fileList);

	int insertMailBox(SqlSessionTemplate sqlSession, Mail m);

	int insertReceiver(SqlSessionTemplate sqlSession, Mail m);

	List<Mail> sentMailList(SqlSessionTemplate sqlSession, Mail mail, PageInfo pi);

	Mail selectMailOne(SqlSessionTemplate sqlSession, String no);

	AttachmentMail downAttachment(SqlSessionTemplate sqlSession, String no);

	int getListCount(SqlSessionTemplate sqlSession, Mail mail);

	void insertReciveMail(SqlSessionTemplate sqlSession, Mail reciveMail);

	void insertReciveMailBox(SqlSessionTemplate sqlSession, Mail reciveMail);

	int getListCount2(SqlSessionTemplate sqlSession, Mail m);

	List<Mail> selectReciveMail(SqlSessionTemplate sqlSession, Mail m, PageInfo pi);

	Mail reciveMailOne(SqlSessionTemplate sqlSession, String mNo);

	int updateImportant(SqlSessionTemplate sqlSession, Mail mail);

	int updateImportant2(SqlSessionTemplate sqlSession, Mail mail);

	int updateTrash(SqlSessionTemplate sqlSession, String mNo);

	int getListCount3(SqlSessionTemplate sqlSession, Mail mail);

	List<Mail> selectImportList(SqlSessionTemplate sqlSession, Mail mail, PageInfo pi);

	int getListCount4(SqlSessionTemplate sqlSession, Mail mail);

	List<Mail> selectTrashList(SqlSessionTemplate sqlSession, Mail mail, PageInfo pi);

	int insertMailBox2(SqlSessionTemplate sqlSession, Mail m);

	int insertMailBox3(SqlSessionTemplate sqlSession, Mail m);

	int updateRead(SqlSessionTemplate sqlSession, Mail mail);

	void deleteMail(SqlSessionTemplate sqlSession, String mNo);

	int getListCount5(SqlSessionTemplate sqlSession, Mail mail);

	List<Mail> nReadMailList(SqlSessionTemplate sqlSession, Mail mail, PageInfo pi);


}
