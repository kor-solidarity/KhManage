package com.kh.manage.mail.model.service;

import java.util.List;

import com.kh.manage.common.PageInfo;
import com.kh.manage.mail.model.vo.AttachmentMail;
import com.kh.manage.mail.model.vo.Mail;

public interface MailService {

	int insertMail(Mail m, List<AttachmentMail> fileList);

	List<Mail> sentMailList(Mail mail, PageInfo pi);

	Mail selectMailOne(String no);

	AttachmentMail downAttachment(String no);

	int getListCount(Mail mail);

	void insertReciveMail(Mail reciveMail);

	int getListCount2(Mail m);

	List<Mail> selectReciveMail(Mail m, PageInfo pi);

	Mail reciveMailOne(String mNo);

	int updateImportant(Mail mail);

	int updateTrash(String mNo);

	int getListCount3(Mail mail);

	List<Mail> selectImportList(Mail mail, PageInfo pi);

	int getListCount4(Mail mail);

	List<Mail> selectTrashList(Mail mail, PageInfo pi);


}
