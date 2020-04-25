package com.kh.manage.member.model.service;

import java.util.List;

import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.adminManage.vo.Menu;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.rank.model.vo.Rank;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.member.model.exception.LoginException;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.Project;

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	int insertMember(Member m);

	List<Dept> selectDeptList();

	List<Rank> selectRankList();

	List<Dept> selectDeptList2();

	List<DepartMent> selectTeam(DepartMent dm);

	int checkMemberId(Member m);

	int updatePassword(Member m);

	int updateMemberInfo(Member member);

	int insertProfileImage(Attachment at);

	Attachment selectProfileImg(Member m);

	List<Member> selectMemberList(PageInfo pi);

	Attachment selectAttachment(Member loginUser);

	int updateProfileImage(Attachment at);

	List<Menu> selectAllMenu();

	List<Menu> noAccessMenu(Member loginUser);

	int memberListCount();

	List<Member> searchMemberName(Member member);

	List<Project> selectProjectList();



	
}
