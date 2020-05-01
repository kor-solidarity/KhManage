package com.kh.manage.work.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class WorkAttachment {
	private String atNo;
	private String productNo;
	private String workNo;
	private String productType;
	private String productTitle;
	private String productContent;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date enrollDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date modifyDate;
	private String originName;
	private String changeName;
	private String filePath;
	private String ext;
	
	public WorkAttachment() {}

	public WorkAttachment(String productNo, String workNo, String productType, String productTitle,
			String productContent, Date enrollDate, Date modifyDate, String atNo, String originName, String changeName,
			String filePath, String ext) {
		super();
		this.productNo = productNo;
		this.workNo = workNo;
		this.productType = productType;
		this.productTitle = productTitle;
		this.productContent = productContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.atNo = atNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.ext = ext;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getWorkNo() {
		return workNo;
	}

	public void setWorkNo(String workNo) {
		this.workNo = workNo;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getAtNo() {
		return atNo;
	}

	public void setAtNo(String atNo) {
		this.atNo = atNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	@Override
	public String toString() {
		return "WorkAttachment [productNo=" + productNo + ", workNo=" + workNo + ", productType=" + productType
				+ ", productTitle=" + productTitle + ", productContent=" + productContent + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", atNo=" + atNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", ext=" + ext + "]";
	}

	
	
}
