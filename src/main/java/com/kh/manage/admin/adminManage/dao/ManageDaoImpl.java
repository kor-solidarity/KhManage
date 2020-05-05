package com.kh.manage.admin.adminManage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

	@Override
	public DepartMent highSelectOne(SqlSessionTemplate sqlSession, DepartMent dept) {
		
		return sqlSession.selectOne("Admin.highSelectOne", dept);
	}

	@Override
	public int insertHighDept(SqlSessionTemplate sqlSession, DepartMent dm) {
	
		return sqlSession.insert("Admin.insertHighDept", dm);
	}

	@Override
	public DepartMent newDeptNo(SqlSessionTemplate sqlSession, DepartMent dept) {
		
		return sqlSession.selectOne("Admin.newDeptNo", dept);
	}

	@Override
	public int insertChildrenDept(SqlSessionTemplate sqlSession, DepartMent dept) {
	
		return sqlSession.insert("Admin.insertChildrenDept", dept);
	}

	@Override
	public List<Member> selectMemberList(SqlSessionTemplate sqlSession, DepartMent dept) {
		
		return sqlSession.selectList("Admin.selectMemberList", dept);
	}

	@Override
	public List<Member> selectHighMemberList(SqlSessionTemplate sqlSession, DepartMent dept) {
		
		return sqlSession.selectList("Admin.selectHighListMember", dept);
	}

	@Override
	public int insertDeptHistory(SqlSessionTemplate sqlSession, DeptHistory dh) {
		
		return sqlSession.insert("Admin.insertDeptHistory", dh);
	}

	@Override
	public int updateDeptMember(SqlSessionTemplate sqlSession, DeptHistory dh) {
		
		return sqlSession.update("Admin.updateDeptMember", dh);
	}

	@Override
	public List<Rank> selectRankList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("Admin.selectRankList");
	}

	@Override
	public int updateDeleteDeptMember(SqlSessionTemplate sqlSession, DepartMent dept) {
		
		return sqlSession.update("Admin.updateDeleteDeptMember", dept);
	}

	@Override
	public int deleteDept(SqlSessionTemplate sqlSession, DepartMent dept) {
		return sqlSession.update("Admin.deleteDept", dept);
	}

	@Override
	public List<Menu> selectAllMenu(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("Admin.selectAllMenuMage");
	}

	@Override
	public List<Access> selectAllAccess(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("Admin.selectAllAccess");
	}

	@Override
	public Menu selectOneMenu(SqlSessionTemplate sqlSession, Menu menu) {
	
		return sqlSession.selectOne("Admin.selectOneMenu", menu);
	}

	@Override
	public int insertMenuAccess(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		return sqlSession.insert("Admin.insertMenuAccess", map);
	}

	@Override
	public List<Access> selectUseAccessList(SqlSessionTemplate sqlSession, Menu menu) {
		
		return sqlSession.selectList("Admin.selectUseAccessList", menu);
	}

	@Override
	public int cleanMenuAccess(SqlSessionTemplate sqlSession, MenuAccess ma) {
		
		return sqlSession.delete("Admin.cleanMenuAccess", ma);
	}

	@Override
	public List<Menu> checkMenuAccessMember(SqlSessionTemplate sqlSession, MenuAccess menu) {
	
		return sqlSession.selectList("Admin.checkMenuAccessMember", menu);
	}

	@Override
	public int updateMenuInfo(SqlSessionTemplate sqlSession, MenuAccess ma) {
		
		return sqlSession.update("Admin.updateMenuInfo", ma);
	}

	@Override
	public List<AllDashBoard> selectAllProjectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		return sqlSession.selectList("Admin.selectAllProjectList", null, rowBounds);
	}

	@Override
	public int getProjectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Admin.getProjectListCount");
	}

	@Override
	public AllDashBoard selectOneProject(SqlSessionTemplate sqlSession, String pid) {
	
		return sqlSession.selectOne("Admin.selectOneProject", pid);
	}

	@Override
	public List<ProjectHistory> selectHistory(SqlSessionTemplate sqlSession, String pid) {
		
		return sqlSession.selectList("Admin.selectHistory", pid);
	}

	@Override
	public String selectEnrollDate(SqlSessionTemplate sqlSession, String pid) {
		
		return sqlSession.selectOne("Admin.selectEnrollDate", pid);
	}

	@Override
	public int updateCompleteProject(SqlSessionTemplate sqlSession, String pid) {
		
		return sqlSession.update("Admin.updateCompleteProject", pid);
	}

	@Override
	public int insertCompleteProjectHistory(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("Admin.insertCompleteProjectHistory", m);
	}

}
