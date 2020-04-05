package com.kh.manage.member.model.service;

import com.kh.manage.member.model.exception.LoginException;
import com.kh.manage.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	int insertMember(Member m);
	
}
