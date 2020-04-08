package com.kh.manage.admin.adminManage.service;

import java.util.List;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.admin.adminManage.dao.ManageDao;
import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.admin.adminManage.vo.DepartMent;
import com.kh.manage.common.PageInfo;

@Service
public class ManageServiceImpl implements ManageService{
	@Autowired
	private ManageDao ad;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertAccessGroup(Access ac) {
		
		return ad.insertAccessGroup(sqlSession, ac);
	}

	@Override
	public List<Access> accessSelectAll(PageInfo pi) {
		
		return ad.accessSelectAll(sqlSession, pi);
	}

	@Override
	public int getListCount() {
		
		return ad.getListCount(sqlSession);
	}

	@Override
	public List<Access> searchAccess(Access access) {

		return ad.searchAccess(sqlSession, access);
	}

	@Override
	public List<DepartMent> departSelectAll() {
		
		return ad.departSelectAll(sqlSession);
	}
	
}
