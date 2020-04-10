package com.kh.manage.admin.adminManage.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.admin.adminManage.vo.AccessMember;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.adminManage.vo.SelectAccessMember;
import com.kh.manage.common.PageInfo;

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
}
