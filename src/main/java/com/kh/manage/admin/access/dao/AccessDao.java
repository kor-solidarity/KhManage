package com.kh.manage.admin.access.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.admin.access.vo.Access;
import com.kh.manage.common.PageInfo;

public interface AccessDao {
	int insertAccessGroup(SqlSessionTemplate sqlSession, Access ac);

	List<Access> accessSelectAll(SqlSessionTemplate sqlSession, PageInfo pi);

	int getListCount(SqlSessionTemplate sqlSession);

	List<Access> searchAccess(SqlSessionTemplate sqlSession, Access access);
}
