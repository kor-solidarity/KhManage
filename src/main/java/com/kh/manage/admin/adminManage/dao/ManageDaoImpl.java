package com.kh.manage.admin.adminManage.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.common.PageInfo;

@Repository
public class ManageDaoImpl implements ManageDao {

	@Override
	public int insertAccessGroup(SqlSessionTemplate sqlSession, Access ac) {
		
		return sqlSession.insert("Admin.insertAccessGroup", ac);
	}

	@Override
	public List<Access> accessSelectAll(SqlSessionTemplate sqlSession,  PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		
		return sqlSession.selectList("Admin.selectAll", null, rowBounds);
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Admin.getListCount");
	}

	@Override
	public List<Access> searchAccess(SqlSessionTemplate sqlSession, Access access) {
		
		return sqlSession.selectList("Admin.searchAccess", access);
	}

	@Override
	public List<DepartMent> departSelectAll(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("Admin.departSelectAll");
	}


}
