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

}
