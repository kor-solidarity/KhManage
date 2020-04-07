package com.kh.manage.admin.access.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.admin.access.vo.Access;

public interface AccessDao {
	int insertAccessGroup(SqlSessionTemplate sqlSession, Access ac);

	List<Access> accessSelectAll(SqlSessionTemplate sqlSession);
}
