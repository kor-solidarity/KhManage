package com.kh.manage.timeLine.model.vo;

public class Tag {
	private String tagNo;
	private String tagName;
	
	public Tag() {}

	public Tag(String tagNo, String tagName) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
	}

	public String getTagNo() {
		return tagNo;
	}

	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	@Override
	public String toString() {
		return "Tag [tagNo=" + tagNo + ", tagName=" + tagName + "]";
	}
	
	
}
