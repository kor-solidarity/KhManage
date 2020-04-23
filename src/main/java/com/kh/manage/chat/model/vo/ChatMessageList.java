package com.kh.manage.chat.model.vo;

public class ChatMessageList {
	private String messageNo;
	private String memberName;
	private String memberNo;
	private String chatRoomNo;
	private String status;
	private String changeName;
	private String ext;
	private String sendDate;
	private String content;
	private String contentType;
	
	public ChatMessageList() {}

	public ChatMessageList(String messageNo, String memberName, String memberNo, String chatRoomNo, String status,
			String changeName, String ext, String sendDate, String content, String contentType) {
		super();
		this.messageNo = messageNo;
		this.memberName = memberName;
		this.memberNo = memberNo;
		this.chatRoomNo = chatRoomNo;
		this.status = status;
		this.changeName = changeName;
		this.ext = ext;
		this.sendDate = sendDate;
		this.content = content;
		this.contentType = contentType;
	}
	
	public String getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(String messageNo) {
		this.messageNo = messageNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(String chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	@Override
	public String toString() {
		return "ChatMessageList [messageNo=" + messageNo + ", memberName=" + memberName + ", memberNo=" + memberNo
				+ ", chatRoomNo=" + chatRoomNo + ", status=" + status + ", changeName=" + changeName + ", ext=" + ext
				+ ", sendDate=" + sendDate + ", content=" + content + ", contentType=" + contentType + "]";
	}

	
	
}
