package com.kh.manage.admin.adminManage.service;

import java.util.List;

import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.common.PageInfo;

public interface ManageService {
	 int insertAccessGroup(Access ac);

	List<Access> accessSelectAll(PageInfo pi);

	int getListCount();

	List<Access> searchAccess(Access access);

	List<DepartMent> departSelectAll(); 
}
