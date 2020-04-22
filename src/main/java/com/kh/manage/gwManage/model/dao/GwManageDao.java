package com.kh.manage.gwManage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.gwManage.model.vo.GWork;
import com.kh.manage.member.model.vo.Member;

public interface GwManageDao {

	List<GWork> selectAllList(SqlSessionTemplate sqlSession, String memberNo);

	int insertGw(SqlSessionTemplate sqlSession, GWork g);

	int updateGw(SqlSessionTemplate sqlSession, GWork g);

	int deleteGw(SqlSessionTemplate sqlSession, GWork g);

	List<Member> MemberList(SqlSessionTemplate sqlSession);

}
