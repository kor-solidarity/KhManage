package com.kh.manage.member.model.service;

import java.util.List;

import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.admin.rank.model.vo.Rank;
import com.kh.manage.member.model.exception.LoginException;
import com.kh.manage.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	int insertMember(Member m);

	List<Dept> selectDeptList();

	List<Rank> selectRankList();

	List<Dept> selectDeptList2();

	List<DepartMent> selectTeam(DepartMent dm);



	
}
