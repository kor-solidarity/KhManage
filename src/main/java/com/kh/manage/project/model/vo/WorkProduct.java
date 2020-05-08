package com.kh.manage.project.model.vo;

import com.kh.manage.common.Attachment;

import java.io.Serializable;
import java.sql.Date;

public class WorkProduct implements Serializable {
	// 산출물
	
	private String productNo;
	private String workNo;
	private String productType;
	private String productTitle;
	private String productContent;
	private Date enrollDate;
	private Date modifyDate;
	// 여기까지가 테이블
	
	// 그냥 관련 파일정보도 다 뽑아버린다. attachment
	private String atNo;
	private String division;
	private String originName;
	private String changeName;
	private String filePath;
	private String ext;
	
	// 산출물 올린사람(작업 담당자)
	private String memberName;
	
	// 프로젝트 작업 테이블 관련
	private String workName;
	
	// 프로젝트 테이블
	private String projectPk;
	private String projectName;
	
	
	public WorkProduct() {
	}
	
	public WorkProduct(String productNo, String workNo, String productType,
					   String productTitle, String productContent, Date enrollDate,
					   Date modifyDate, String atNo, String division, String originName,
					   String changeName, String filePath, String ext) {
		this.productNo = productNo;
		this.workNo = workNo;
		this.productType = productType;
		this.productTitle = productTitle;
		this.productContent = productContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.atNo = atNo;
		this.division = division;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.ext = ext;
	}
	
	@Override
	public String toString() {
		return "WorkProduct{" +
				"productNo='" + productNo + '\'' +
				", workNo='" + workNo + '\'' +
				", productType='" + productType + '\'' +
				", productTitle='" + productTitle + '\'' +
				", productContent='" + productContent + '\'' +
				", enrollDate=" + enrollDate +
				", modifyDate=" + modifyDate +
				", atNo='" + atNo + '\'' +
				", division='" + division + '\'' +
				", originName='" + originName + '\'' +
				", changeName='" + changeName + '\'' +
				", filePath='" + filePath + '\'' +
				", ext='" + ext + '\'' +
				", memberName='" + memberName + '\'' +
				", workName='" + workName + '\'' +
				", projectPk='" + projectPk + '\'' +
				", projectName='" + projectName + '\'' +
				'}';
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
	
	public String getDivision() {
		return division;
	}
	
	public void setDivision(String division) {
		this.division = division;
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
	
	public String getMemberName() {
		return memberName;
	}
	
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	public String getWorkName() {
		return workName;
	}
	
	public void setWorkName(String workName) {
		this.workName = workName;
	}
	
	public String getProjectPk() {
		return projectPk;
	}
	
	public void setProjectPk(String projectPk) {
		this.projectPk = projectPk;
	}
	
	public String getProjectName() {
		return projectName;
	}
	
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
}
