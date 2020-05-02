package com.kh.manage.work.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.manage.common.Attachment;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.vo.Grantor;
import com.kh.manage.work.model.vo.Work;
import com.kh.manage.work.model.vo.WorkAttachment;
import com.kh.manage.work.model.vo.WorkProductw;
import com.kh.manage.work.model.vo.WorkProjectTeam;

public interface WorkService {

	int insertWork(Work work);

	List<Work> selectWorkList(Member member);

	Work selectWork(String workNo);

	HashMap<String, List> selectWorkMap(Member member);

	List<WorkProjectTeam> selectTeamWork(Member member);

	int updateMyWork(Work work);

	List<Grantor> selectGrantorList(String pk);

	int insertWorkProduct(WorkProductw wp);

	int insertWorkAttachment(Attachment at);

	List<WorkAttachment> selectWorkAttachment(String workNo);

	int deleteWorkProduct(String atNo);

	int insertWorkHistory(HashMap<String, Object> map);

	WorkProjectTeam selectWorkProjectTeam(Work work);

	int insertWorkHistory2(HashMap<String, Object> map);

	

}
