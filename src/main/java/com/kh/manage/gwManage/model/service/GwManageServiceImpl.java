package com.kh.manage.gwManage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.gwManage.model.dao.GwManageDao;
import com.kh.manage.gwManage.model.vo.GWork;
import com.kh.manage.gwManage.model.vo.GwRepeat;
import com.kh.manage.member.model.vo.Member;

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

}
