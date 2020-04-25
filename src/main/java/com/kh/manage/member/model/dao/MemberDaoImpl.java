package com.kh.manage.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.Menu;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.rank.model.vo.Rank;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.member.model.exception.LoginException;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.Project;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginException {
		
		Member loginUser = sqlSession.selectOne("Member.loginCheck", m);
		
		System.out.println("memberDao : " + loginUser);
		
		if(loginUser == null) {
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
		}
		
		return loginUser;
	}

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("Member.insertMember", m);
	}
	
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectPwd", m.getMemberId());
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("Member.selectLoginUser", m);
	}

	@Override
	public List<Dept> selectDeptList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Dept.selectDeptList");
	}

	@Override
	public List<Rank> selectRankList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Rank.selectRankList");
	}

	@Override
	public List<Dept> selectDeptList2(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Dept.selectDeptList2");
	}

	@Override
	public List<DepartMent> selectTeam(SqlSessionTemplate sqlSession, DepartMent dm) {
		
		return sqlSession.selectList("Admin.selectTeam", dm);
	}

	@Override
	public int checkMemberId(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("Member.checkMemberId", m);
	}

	@Override
	public int updatePassword(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("Member.updatePassword", m);
	}

	@Override
	public int updateMemberInfo(SqlSessionTemplate sqlSession, Member member) {

		return sqlSession.update("Member.updateMemberInfo", member);
	}

	@Override
	public int insertProfileImage(SqlSessionTemplate sqlSession, Attachment at) {

		return sqlSession.insert("Member.insertProfileImage", at);
	}

	@Override
	public Attachment selectProfileImg(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectProfileImg", m);
	}

	@Override
	public List<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		return sqlSession.selectList("Member.selectMemberList", null, rowBounds);
	}

	@Override
	public Attachment selectAttachment(SqlSessionTemplate sqlSession, Member loginUser) {

		return sqlSession.selectOne("Member.selectProfileImg", loginUser);
	}

	@Override
	public int updateProfileImage(SqlSessionTemplate sqlSession, Attachment at) {

		return sqlSession.update("Member.updateProfileImage", at);
	}

	@Override
	public List<Menu> selectAllMenu(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("Admin.selectAllMenu");
	}

	@Override
	public List<Menu> noAccessMenu(SqlSessionTemplate sqlSession, Member loginUser) {
		
		return sqlSession.selectList("Admin.noAccessMenu", loginUser);
	}

	@Override
	public int memberListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("Member.memberListCount");
	}

	@Override
	public List<Member> searchMemberName(SqlSessionTemplate sqlSession, Member member) {

		return sqlSession.selectList("Member.searchMemberName", member);
	}

	@Override
	public List<Project> selectProjectList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("Project.selectProjectList");
	}




	



}
