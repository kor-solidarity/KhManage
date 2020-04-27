package com.kh.manage.work.model.vo;

import java.sql.Date;

public class WorkProductw implements java.io.Serializable{
	private String productNo;
	private String workNo;
	private String productType;
	private String productTitle;
	private String productContent;
	private Date enrollDate;
	private Date modifyDate;
	
	public WorkProductw() {}

	public WorkProductw(String productNo, String workNo, String productType, String productTitle, String productContent,
			Date enrollDate, Date modifyDate) {
		super();
		this.productNo = productNo;
		this.workNo = workNo;
		this.productType = productType;
		this.productTitle = productTitle;
		this.productContent = productContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
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

	@Override
	public String toString() {
		return "WorkProductw [productNo=" + productNo + ", workNo=" + workNo + ", productType=" + productType
				+ ", productTitle=" + productTitle + ", productContent=" + productContent + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + "]";
	}
	
	
}
