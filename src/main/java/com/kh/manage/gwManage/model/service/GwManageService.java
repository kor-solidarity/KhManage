package com.kh.manage.gwManage.model.service;

import java.util.List;


import com.kh.manage.gwManage.model.vo.GWork;
import com.kh.manage.gwManage.model.vo.GwRepeat;
import com.kh.manage.member.model.vo.Member;

public interface GwManageService {

	List<GWork> selectAllList(String memberNo);

	int insertGw(GWork g, GwRepeat gr);

	int updateGw(GWork g);

	int deleteGw(GWork g);

	List<Member> memberList();

}
