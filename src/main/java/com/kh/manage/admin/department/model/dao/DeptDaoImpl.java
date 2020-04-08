package com.kh.manage.admin.department.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.admin.department.model.vo.Dept;

@Repository
public class DeptDaoImpl implements DeptDao {

	@Override
	public List<Dept> selectDeptList(SqlSessionTemplate sqlSession) {

		
		return sqlSession.selectList("Dept.selecList");
	}

}
