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
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.adminManage.vo.SelectAccessMember;
import com.kh.manage.common.PageInfo;

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
	
}
