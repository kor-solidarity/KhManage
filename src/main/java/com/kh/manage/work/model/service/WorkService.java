package com.kh.manage.work.model.service;

import java.util.List;

import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.vo.Work;

public interface WorkService {

	int insertWork(Work work);

	List<Work> selectWorkList(Member member);

	Work selectWork(String workNo);

	

}
