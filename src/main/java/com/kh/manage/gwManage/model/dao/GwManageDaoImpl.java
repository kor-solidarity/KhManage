package com.kh.manage.gwManage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.gwManage.model.vo.GWork;

@Repository
public class GwManageDaoImpl implements GwManageDao{

	@Override
	public List<GWork> selectAllList(SqlSessionTemplate sqlSession, String memberNo) {

		return sqlSession.selectList("GWork.selectAllList", memberNo);
	}

	@Override
	public int insertGw(SqlSessionTemplate sqlSession, GWork g) {

		return sqlSession.insert("GWork.insertGw", g);
	}

	@Override
	public int updateGw(SqlSessionTemplate sqlSession, GWork g) {

		System.out.println("asdasdads");
		return sqlSession.update("GWork.updateGw", g);
	}
	
	

}
