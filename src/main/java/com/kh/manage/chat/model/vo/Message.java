package com.kh.manage.chat.model.vo;

import java.sql.Date;

public class Message {
	private String messageNo;
	private String chatRoomNo;
	private String sender;
	private String status;
	private String contentType;
	private Date sendDate;
	private String content;
	
	public Message() {}

	public Message(String messageNo, String chatRoomNo, String sender, String status, String contentType, Date sendDate,
			String content) {
		super();
		this.messageNo = messageNo;
		this.chatRoomNo = chatRoomNo;
		this.sender = sender;
		this.status = status;
		this.contentType = contentType;
		this.sendDate = sendDate;
		this.content = content;
	}

	public String getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(String messageNo) {
		this.messageNo = messageNo;
	}

	public String getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(String chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", chatRoomNo=" + chatRoomNo + ", sender=" + sender + ", status="
				+ status + ", contentType=" + contentType + ", sendDate=" + sendDate + ", content=" + content + "]";
	}
	
	
}
