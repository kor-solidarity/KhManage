package com.kh.manage.admin.adminManage.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.admin.adminManage.dao.ManageDao;
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

@Service
public class ManageServiceImpl implements ManageService{
	@Autowired
	private ManageDao ad;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertAccessGroup(Access ac) {
		
		return ad.insertAccessGroup(sqlSession, ac);
	}

	@Override
	public List<Access> accessSelectAll(PageInfo pi) {
		
		return ad.accessSelectAll(sqlSession, pi);
	}

	@Override
	public int getListCount() {
		
		return ad.getListCount(sqlSession);
	}

	@Override
	public List<Access> searchAccess(Access access) {

		return ad.searchAccess(sqlSession, access);
	}

	@Override
	public List<DepartMent> departSelectAll() {
		
		return ad.departSelectAll(sqlSession);
	}

	@Override
	public DepartMent deptSelectOne(DepartMent dept) {
		
		return ad.deptSelectOne(sqlSession, dept);
	}

	@Override
	public Access selectOneAccess(Access ac) {
		
		return ad.accessSelectOne(sqlSession, ac);
	}

	@Override
	public List<DeptMember> searchDeptMember(DepartMent dept) {
		
		return ad.searchDeptMember(sqlSession, dept);
	}

	@Override
	public int insertAccessMember(AccessMember am, Map<String, Object> map) {
		 
		 return ad.insertAccessMember(sqlSession, map);
	}

	@Override
	public List<String> selectAccessMember(AccessMember am) {
		return ad.selectAccessMember(sqlSession, am);
	}

	@Override
	public List<SelectAccessMember> selectAccessMemberList(Access ac) {
		
		return ad.selectAccessMemberList(sqlSession, ac);
	}

	@Override
	public int deleteAccessMember(AccessMember am) {
		int result = ad.deleteAccessMember(sqlSession, am);
		
		return result;
	}

	@Override
	public List<DepartMent> selectDeptList() {

		return ad.selectDeptList(sqlSession);
	}

	@Override
	public int updateAccess(AccessMember am) {
		
		return ad.updateAccess(sqlSession, am);
		
	}

	@Override
	public DepartMent highSelectOne(DepartMent dept) {
		
		return ad.highSelectOne(sqlSession, dept);
	}

	@Override
	public int insertHighDept(DepartMent dm) {
		
		return ad.insertHighDept(sqlSession, dm);
	}

	@Override
	public DepartMent newDeptNo(DepartMent dept) {
		
		return ad.newDeptNo(sqlSession, dept);
	}

	@Override
	public int inserChildrenDept(DepartMent dept) {
		
		return ad.insertChildrenDept(sqlSession, dept);
	}

	@Override
	public List<Member> selectMemberList(DepartMent dept) {
		
		return ad.selectMemberList(sqlSession, dept);
	}

	@Override
	public List<Member> selectHighMemberList(DepartMent dept) {
		
		return ad.selectHighMemberList(sqlSession, dept);
	}

	@Override
	public int insertDeptHistory(DeptHistory dh) {
		
		int result2 = 0;
		
		int result =  ad.insertDeptHistory(sqlSession, dh);
		
		if(result > 0) {
			result2 = ad.updateDeptMember(sqlSession, dh);
		}
		
		return result2;
		
	}

	@Override
	public List<Rank> selectRankList() {
		
		return ad.selectRankList(sqlSession);
	}

	@Override
	public int deleteDept(DepartMent dept) {
		int result2 = 0;
		
		int result =  ad.updateDeleteDeptMember(sqlSession, dept);
		
			result2 = ad.deleteDept(sqlSession, dept);
		
		return result2;
	}

	@Override
	public List<Menu> selectAllMenu() {
		
		return ad.selectAllMenu(sqlSession);
	}

	@Override
	public List<Access> selectAllAccess() {
		
		return ad.selectAllAccess(sqlSession);
	}

	@Override
	public Menu selectOneMenu(Menu menu) {
		
		return ad.selectOneMenu(sqlSession, menu);
	}

	@Override
	public int insertMenuAccess(Map<String, Object> map) {
		
		return ad.insertMenuAccess(sqlSession, map);
	}

	@Override
	public List<Access> selectUseAccessList(Menu menu) {
		
		return ad.selectUseAccessList(sqlSession, menu);
	}

	@Override
	public int cleanMenuAccess(MenuAccess ma) {
		
		return ad.cleanMenuAccess(sqlSession, ma);
	}

	@Override
	public List<Menu> checkMenuAccessMember(MenuAccess menu) {
		
		return ad.checkMenuAccessMember(sqlSession, menu);
	}

	@Override
	public int updateMenuInfo(MenuAccess ma) {
		
		return ad.updateMenuInfo(sqlSession, ma);
	}

	@Override
	public List<AllDashBoard> selectAllProjectList(PageInfo pi) {
		
		return ad.selectAllProjectList(sqlSession, pi);
	}

	@Override
	public int getProjectListCount() {
		
		return ad.getProjectListCount(sqlSession);
	}

	@Override
	public AllDashBoard  selectOneProject(String pid) {
	
		return ad.selectOneProject(sqlSession, pid);
	}

	@Override
	public List<ProjectHistory> selectHistory(String pid) {
		
		return ad.selectHistory(sqlSession, pid);
	}

	@Override
	public String selectEnrollDate(String pid) {
		
		return ad.selectEnrollDate(sqlSession, pid);
	}

	@Override
	public int updateCompleteProject(String pid) {
		
		return ad.updateCompleteProject(sqlSession, pid);
	}

	@Override
	public int insertCompleteProjectHistory(Member m) {
		
		return ad.insertCompleteProjectHistory(sqlSession, m);
	}
	
}
