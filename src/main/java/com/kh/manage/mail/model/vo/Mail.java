package com.kh.manage.mail.model.vo;

import java.sql.Date;

public class Mail implements java.io.Serializable{
	
	private String mNo;
	private String mAddress;
	private String mTitle;
	private String mContent;
	private Date mEnrollDate;
	
	
	public Mail() {}


	public String getmNo() {
		return mNo;
	}


	public void setmNo(String mNo) {
		this.mNo = mNo;
	}


	public String getmAddress() {
		return mAddress;
	}


	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}


	public String getmTitle() {
		return mTitle;
	}


	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}


	public String getmContent() {
		return mContent;
	}


	public void setmContent(String mContent) {
		this.mContent = mContent;
	}


	public Date getmEnrollDate() {
		return mEnrollDate;
	}


	public void setmEnrollDate(Date mEnrollDate) {
		this.mEnrollDate = mEnrollDate;
	}


	public Mail(String mNo, String mAddress, String mTitle, String mContent, Date mEnrollDate) {
		super();
		this.mNo = mNo;
		this.mAddress = mAddress;
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mEnrollDate = mEnrollDate;
	}


	@Override
	public String toString() {
		return "Mail [mNo=" + mNo + ", mAddress=" + mAddress + ", mTitle=" + mTitle + ", mContent=" + mContent
				+ ", mEnrollDate=" + mEnrollDate + "]";
	}

	
	

}
