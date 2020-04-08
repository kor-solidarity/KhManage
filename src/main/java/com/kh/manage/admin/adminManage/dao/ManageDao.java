package com.kh.manage.admin.adminManage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.common.PageInfo;

public interface ManageDao {
	int insertAccessGroup(SqlSessionTemplate sqlSession, Access ac);

	List<Access> accessSelectAll(SqlSessionTemplate sqlSession, PageInfo pi);

	int getListCount(SqlSessionTemplate sqlSession);

	List<Access> searchAccess(SqlSessionTemplate sqlSession, Access access);

	List<DepartMent> departSelectAll(SqlSessionTemplate sqlSession);

	DepartMent deptSelectOne(SqlSessionTemplate sqlSession, DepartMent dept);
}
