package com.kh.manage.gwManage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.gwManage.model.dao.GwManageDao;
import com.kh.manage.gwManage.model.vo.GWork;
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
	public int insertGw(GWork g) {
		
		return gd.insertGw(sqlSession, g);
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
