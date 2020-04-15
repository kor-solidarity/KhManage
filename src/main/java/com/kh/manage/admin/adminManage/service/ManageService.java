package com.kh.manage.admin.adminManage.service;

import java.util.List;
import java.util.Map;

import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.admin.adminManage.vo.AccessMember;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptHistory;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.adminManage.vo.Menu;
import com.kh.manage.admin.adminManage.vo.MenuAccess;
import com.kh.manage.admin.adminManage.vo.SelectAccessMember;
import com.kh.manage.admin.rank.model.vo.Rank;
import com.kh.manage.common.PageInfo;
import com.kh.manage.member.model.vo.Member;

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

	DepartMent highSelectOne(DepartMent dept);

	int insertHighDept(DepartMent dm);

	DepartMent newDeptNo(DepartMent dept);

	int inserChildrenDept(DepartMent dept);

	List<Member> selectMemberList(DepartMent dept);

	List<Member> selectHighMemberList(DepartMent dept);

	int insertDeptHistory(DeptHistory dh);

	List<Rank> selectRankList();

	int deleteDept(DepartMent dept);

	List<Menu> selectAllMenu();

	List<Access> selectAllAccess();

	Menu selectOneMenu(Menu menu);

	int insertMenuAccess(Map<String, Object> map);

	List<Access> selectUseAccessList(Menu menu);

	int cleanMenuAccess(MenuAccess ma); 
}
