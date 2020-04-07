package com.kh.manage.admin.access.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.admin.access.vo.Access;

@Repository
public class AccessDaoImpl implements AccessDao {

	@Override
	public int insertAccessGroup(SqlSessionTemplate sqlSession, Access ac) {
		
		return sqlSession.insert("Access.insertAccessGroup", ac);
	}

	@Override
	public List<Access> accessSelectAll(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("Access.selectAll");
	}


}
