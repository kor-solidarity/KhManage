package com.kh.manage.admin.adminManage.service;

import java.util.List;
import java.util.Map;

import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.admin.adminManage.vo.AccessMember;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.adminManage.vo.SelectAccessMember;
import com.kh.manage.common.PageInfo;

public interface ManageService {
	 int insertAccessGroup(Access ac);

	List<Access> accessSelectAll(PageInfo pi);

	int getListCount();

	List<Access> searchAccess(Access access);

	List<DepartMent> departSelectAll();

	DepartMent deptSelectOne(DepartMent dept);

	Access selectOneAccess(Access ac);

	List<DeptMember> searchDeptMember(DepartMent dept);

	int insertAccessMember(AccessMember am, Map<String, Object> map);

	List<String> selectAccessMember(AccessMember am);

	List<SelectAccessMember> selectAccessMemberList(Access ac);

	int deleteAccessMember(AccessMember am);

	List<DepartMent> selectDeptList();

	int updateAccess(AccessMember am); 
}
