package com.kh.manage.chat.model.vo;

import java.sql.Date;

public class ChatRoom implements java.io.Serializable{
	private String chatRoomNo;
	private String chatRoomName;
	private String memberNo;
	private String createMemberNo;
	private String recentMessage;
	private String status;
	private Date modifyDate;
	
	public ChatRoom() {}

	public ChatRoom(String chatRoomNo, String chatRoomName, String memberNo, String createMemberNo,
			String recentMessage, String status, Date modifyDate) {
		super();
		this.chatRoomNo = chatRoomNo;
		this.chatRoomName = chatRoomName;
		this.memberNo = memberNo;
		this.createMemberNo = createMemberNo;
		this.recentMessage = recentMessage;
		this.status = status;
		this.modifyDate = modifyDate;
	}

	public String getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(String chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	public String getChatRoomName() {
		return chatRoomName;
	}

	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getCreateMemberNo() {
		return createMemberNo;
	}

	public void setCreateMemberNo(String createMemberNo) {
		this.createMemberNo = createMemberNo;
	}

	public String getRecentMessage() {
		return recentMessage;
	}

	public void setRecentMessage(String recentMessage) {
		this.recentMessage = recentMessage;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	@Override
	public String toString() {
		return "ChatRoom [chatRoomNo=" + chatRoomNo + ", chatRoomName=" + chatRoomName + ", memberNo=" + memberNo
				+ ", createMemberNo=" + createMemberNo + ", recentMessage=" + recentMessage + ", status=" + status
				+ ", modifyDate=" + modifyDate + "]";
	}


	
}
