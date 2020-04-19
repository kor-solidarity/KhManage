package com.kh.manage.gwManage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.gwManage.model.dao.GwManageDao;
import com.kh.manage.gwManage.model.vo.GWork;

@Service
public class GwManageServiceImpl implements GwManageService{
	
	@Autowired
	private GwManageDao gd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<GWork> selectAllList() {
		
		return gd.selectAllList(sqlSession);
	}

}