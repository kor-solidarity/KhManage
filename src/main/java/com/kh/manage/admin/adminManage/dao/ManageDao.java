package com.kh.manage.admin.adminManage.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.admin.adminManage.vo.AccessMember;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptHistory;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.adminManage.vo.Menu;
import com.kh.manage.admin.adminManage.vo.MenuAccess;
import com.kh.manage.admin.adminManage.vo.ProjectHistory;
import com.kh.manage.admin.adminManage.vo.SelectAccessMember;
import com.kh.manage.admin.rank.model.vo.Rank;
import com.kh.manage.common.PageInfo;
import com.kh.manage.member.model.vo.AllDashBoard;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.ProjectDetail;

public interface ManageDao {
	int insertAccessGroup(SqlSessionTemplate sqlSession, Access ac);

	List<Access> accessSelectAll(SqlSessionTemplate sqlSession, PageInfo pi);

	int getListCount(SqlSessionTemplate sqlSession);

	List<Access> searchAccess(SqlSessionTemplate sqlSession, Access access);

	List<DepartMent> departSelectAll(SqlSessionTemplate sqlSession);

	DepartMent deptSelectOne(SqlSessionTemplate sqlSession, DepartMent dept);

	Access accessSelectOne(SqlSessionTemplate sqlSession, Access ac);

	List<DeptMember> searchDeptMember(SqlSessionTemplate sqlSession, DepartMent dept);

	int insertAccessMember(SqlSessionTemplate sqlSession, Map<String, Object> map);

	List<String> selectAccessMember(SqlSessionTemplate sqlSession, AccessMember am);

	List<SelectAccessMember> selectAccessMemberList(SqlSessionTemplate sqlSession, Access ac);

	int deleteAccessMember(SqlSessionTemplate sqlSession, AccessMember am);

	List<DepartMent> selectDeptList(SqlSessionTemplate sqlSession);

	int updateAccess(SqlSessionTemplate sqlSession, AccessMember am);

	DepartMent highSelectOne(SqlSessionTemplate sqlSession, DepartMent dept);

	int insertHighDept(SqlSessionTemplate sqlSession, DepartMent dm);

	DepartMent newDeptNo(SqlSessionTemplate sqlSession, DepartMent dept);

	int insertChildrenDept(SqlSessionTemplate sqlSession, DepartMent dept);

	List<Member> selectMemberList(SqlSessionTemplate sqlSession, DepartMent dept);

	List<Member> selectHighMemberList(SqlSessionTemplate sqlSession, DepartMent dept);

	int insertDeptHistory(SqlSessionTemplate sqlSession, DeptHistory dh);

	int updateDeptMember(SqlSessionTemplate sqlSession, DeptHistory dh);

	List<Rank> selectRankList(SqlSessionTemplate sqlSession);

	int updateDeleteDeptMember(SqlSessionTemplate sqlSession, DepartMent dept);

	int deleteDept(SqlSessionTemplate sqlSession, DepartMent dept);

	List<Menu> selectAllMenu(SqlSessionTemplate sqlSession);

	List<Access> selectAllAccess(SqlSessionTemplate sqlSession);

	Menu selectOneMenu(SqlSessionTemplate sqlSession, Menu menu);

	int insertMenuAccess(SqlSessionTemplate sqlSession, Map<String, Object> map);

	List<Access> selectUseAccessList(SqlSessionTemplate sqlSession, Menu menu);

	int cleanMenuAccess(SqlSessionTemplate sqlSession, MenuAccess ma);

	List<Menu> checkMenuAccessMember(SqlSessionTemplate sqlSession, MenuAccess menu);

	int updateMenuInfo(SqlSessionTemplate sqlSession, MenuAccess ma);

	List<AllDashBoard> selectAllProjectList(SqlSessionTemplate sqlSession, PageInfo pi);

	int getProjectListCount(SqlSessionTemplate sqlSession);

	AllDashBoard  selectOneProject(SqlSessionTemplate sqlSession, String pid);

	List<ProjectHistory> selectHistory(SqlSessionTemplate sqlSession, String pid);

	String selectEnrollDate(SqlSessionTemplate sqlSession, String pid);
}
