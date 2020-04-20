package com.kh.manage.gwManage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.gwManage.model.vo.GWork;

public interface GwManageDao {

	List<GWork> selectAllList(SqlSessionTemplate sqlSession, String memberNo);

	int insertGw(SqlSessionTemplate sqlSession, GWork g);

}
