package com.kh.manage.admin.department.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.admin.department.model.dao.DeptDao;
import com.kh.manage.admin.department.model.vo.Dept;

@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
	private DeptDao dd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Dept> selectDeptList() {
		
		return dd.selectDeptList(sqlSession);
	}

	
	
	
}
