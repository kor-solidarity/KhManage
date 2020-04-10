package com.kh.manage.admin.adminManage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.admin.adminManage.vo.AccessMember;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.adminManage.vo.SelectAccessMember;
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

	@Override
	public DepartMent deptSelectOne(SqlSessionTemplate sqlSession, DepartMent dept) {
		
		return sqlSession.selectOne("Admin.deptSelectOne", dept);
	}

	@Override
	public Access accessSelectOne(SqlSessionTemplate sqlSession, Access ac) {
		
		return sqlSession.selectOne("Admin.accessSelectOne", ac);
	}

	@Override
	public List<DeptMember> searchDeptMember(SqlSessionTemplate sqlSession, DepartMent dept) {
	
		return sqlSession.selectList("Admin.searchDeptMember", dept);
	}

	@Override
	public int insertAccessMember(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		return sqlSession.insert("Admin.insertAccessMember", map);

	}

	@Override
	public List<String> selectAccessMember(SqlSessionTemplate sqlSession, AccessMember am) {
		
		return sqlSession.selectList("Admin.selectAccessMember", am);

	}

	@Override
	public List<SelectAccessMember> selectAccessMemberList(SqlSessionTemplate sqlSession, Access ac) {
		
		return sqlSession.selectList("Admin.selectAccessMemberList", ac);
	}

	@Override
	public int deleteAccessMember(SqlSessionTemplate sqlSession, AccessMember am) {
		
		return sqlSession.delete("Admin.deleteAccessMember", am);
	}

	@Override
	public List<DepartMent> selectDeptList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Admin.selectDeptList");
	}

	@Override
	public int updateAccess(SqlSessionTemplate sqlSession, AccessMember am) {

		return sqlSession.update("Admin.updateAccess", am);
	}

}
