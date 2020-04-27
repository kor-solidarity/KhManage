package com.kh.manage.gwManage.model.service;

import java.util.List;

import com.kh.manage.forum.model.vo.Mwork;
import com.kh.manage.gwManage.model.vo.GWork;
import com.kh.manage.gwManage.model.vo.GwRepeat;
import com.kh.manage.gwManage.model.vo.Statistics;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.Project;

public interface GwManageService {

	List<GWork> selectAllList(String memberNo);

	int insertGw(GWork g, GwRepeat gr);

	int updateGw(GWork g);

	int deleteGw(GWork g);

	List<Member> memberList();

	List<Project> projectList(Member loginUser);

	Project selectProject(String pNo);

	List<Statistics> statisticsList(String pNo);

	List<Statistics> statisticsList2(String pNo);

	List<Mwork> selectListWork(Mwork w);

	List<Statistics> statisticsList3(String pNo);

}
