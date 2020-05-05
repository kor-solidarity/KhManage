package com.kh.manage.mail.model.vo;

import java.sql.Date;
import java.util.List;

public class Mail implements java.io.Serializable{
	
	private String mailNo;
	private String memberNo;
	private String subject;
	private String content;
	private Date enrollDate;
	private String status;
	private String from;
	private String reNo;
	private String receiver;
	private String receiverType;
	private String mbNo;
	private int mailBoxType;
	private String important;
	private String temp;
	private String spam;
	private String trash;
	private String read;
	private List<AttachmentMail> atMail;
	
	public Mail() {}

	public Mail(String mailNo, String memberNo, String subject, String content, Date enrollDate, String status,
			String from, String reNo, String receiver, String receiverType, String mbNo, int mailBoxType,
			String important, String temp, String spam, String trash, String read, List<AttachmentMail> atMail) {
		super();
		this.mailNo = mailNo;
		this.memberNo = memberNo;
		this.subject = subject;
		this.content = content;
		this.enrollDate = enrollDate;
		this.status = status;
		this.from = from;
		this.reNo = reNo;
		this.receiver = receiver;
		this.receiverType = receiverType;
		this.mbNo = mbNo;
		this.mailBoxType = mailBoxType;
		this.important = important;
		this.temp = temp;
		this.spam = spam;
		this.trash = trash;
		this.read = read;
		this.atMail = atMail;
	}

	public String getMailNo() {
		return mailNo;
	}

	public void setMailNo(String mailNo) {
		this.mailNo = mailNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getReNo() {
		return reNo;
	}

	public void setReNo(String reNo) {
		this.reNo = reNo;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getReceiverType() {
		return receiverType;
	}

	public void setReceiverType(String receiverType) {
		this.receiverType = receiverType;
	}

	public String getMbNo() {
		return mbNo;
	}

	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}

	public int getMailBoxType() {
		return mailBoxType;
	}

	public void setMailBoxType(int mailBoxType) {
		this.mailBoxType = mailBoxType;
	}

	public String getImportant() {
		return important;
	}

	public void setImportant(String important) {
		this.important = important;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public String getSpam() {
		return spam;
	}

	public void setSpam(String spam) {
		this.spam = spam;
	}

	public String getTrash() {
		return trash;
	}

	public void setTrash(String trash) {
		this.trash = trash;
	}

	public String getRead() {
		return read;
	}

	public void setRead(String read) {
		this.read = read;
	}

	public List<AttachmentMail> getAtMail() {
		return atMail;
	}

	public void setAtMail(List<AttachmentMail> atMail) {
		this.atMail = atMail;
	}

	@Override
	public String toString() {
		return "Mail [mailNo=" + mailNo + ", memberNo=" + memberNo + ", subject=" + subject + ", content=" + content
				+ ", enrollDate=" + enrollDate + ", status=" + status + ", from=" + from + ", reNo=" + reNo
				+ ", receiver=" + receiver + ", receiverType=" + receiverType + ", mbNo=" + mbNo + ", mailBoxType="
				+ mailBoxType + ", important=" + important + ", temp=" + temp + ", spam=" + spam + ", trash=" + trash
				+ ", read=" + read + ", atMail=" + atMail + "]";
	}

	
	
	

}
