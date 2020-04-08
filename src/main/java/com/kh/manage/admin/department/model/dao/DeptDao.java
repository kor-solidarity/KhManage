package com.kh.manage.admin.department.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.admin.department.model.vo.Dept;

public interface DeptDao {

	List<Dept> selectDeptList(SqlSessionTemplate sqlSession);

}
