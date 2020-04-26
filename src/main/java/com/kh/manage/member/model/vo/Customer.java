package com.kh.manage.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Customer implements Serializable {

	private String customerNo;
	private String customerName;
	
	public Customer() {}

	public Customer(String customerNo, String customerName) {
		super();
		this.customerNo = customerNo;
		this.customerName = customerName;
	}

	public String getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	@Override
	public String toString() {
		return "Customer [customerNo=" + customerNo + ", customerName=" + customerName + "]";
	}

	
	
}
