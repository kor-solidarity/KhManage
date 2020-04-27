package com.kh.manage.gwManage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.forum.model.vo.Mwork;
import com.kh.manage.gwManage.model.dao.GwManageDao;
import com.kh.manage.gwManage.model.vo.GWork;
import com.kh.manage.gwManage.model.vo.GwRepeat;
import com.kh.manage.gwManage.model.vo.Statistics;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.Project;

@Service
public class GwManageServiceImpl implements GwManageService{
	
	@Autowired
	private GwManageDao gd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<GWork> selectAllList(String memberNo) {
		
		return gd.selectAllList(sqlSession, memberNo);
	}

	@Override
	public int insertGw(GWork g, GwRepeat gr) {
		
		int result = gd.insertGw(sqlSession, g);
		
		if(g.getRepeatStatus().equals("Y")) {
		
		String gNo = gd.selectCurrval(sqlSession,g);
		String gNo2 = "";
		
		int no = Integer.parseInt(gNo);
		
		if(no > 9) {
			
			gNo2 = "GW0" +gNo;
		}else {
			gNo2 = "GW00" +gNo;
		}
		
		gr.setGwNo(gNo2);
		System.out.println(gNo2);
				
		int result2 = gd.insertGwWeek(sqlSession, gr);
		}
				
		
		return result;
	}

	@Override
	public int updateGw(GWork g) {
		
		return gd.updateGw(sqlSession, g);
	}

	@Override
	public int deleteGw(GWork g) {
		
		return gd.deleteGw(sqlSession, g);
	}

	@Override
	public List<Member> memberList() {

		return gd.MemberList(sqlSession);
	}

	@Override
	public List<Project> projectList(Member loginUser) {

		return gd.projectList(sqlSession, loginUser);
	}

	@Override
	public Project selectProject(String pNo) {

		return gd.selectProject(sqlSession, pNo);
	}

	@Override
	public List<Statistics> statisticsList(String pNo) {

		return gd.statisticsList(sqlSession, pNo);
	}

	@Override
	public List<Statistics> statisticsList2(String pNo) {

		return gd.statisticsList2(sqlSession, pNo);
	}

	@Override
	public List<Mwork> selectListWork(Mwork w) {

		return gd.selectListWork(sqlSession, w);
	}

	@Override
	public List<Statistics> statisticsList3(String pNo) {

		return gd.selectList3(sqlSession, pNo);
	}

}
