package com.kh.manage.admin.access.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.admin.access.vo.Access;
import com.kh.manage.common.PageInfo;

@Repository
public class AccessDaoImpl implements AccessDao {

	@Override
	public int insertAccessGroup(SqlSessionTemplate sqlSession, Access ac) {
		
		return sqlSession.insert("Access.insertAccessGroup", ac);
	}

	@Override
	public List<Access> accessSelectAll(SqlSessionTemplate sqlSession,  PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		
		return sqlSession.selectList("Access.selectAll", null, rowBounds);
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Access.getListCount");
	}

	@Override
	public List<Access> searchAccess(SqlSessionTemplate sqlSession, Access access) {
		
		return sqlSession.selectList("Access.searchAccess", access);
	}


}
