package com.kh.manage.work.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.vo.Work;
import com.kh.manage.work.model.vo.WorkProjectTeam;

public interface WorkService {

	int insertWork(Work work);

	List<Work> selectWorkList(Member member);

	Work selectWork(String workNo);

	HashMap<String, List> selectWorkMap(Member member);

	List<WorkProjectTeam> selectTeamWork(Member member);

	

}
