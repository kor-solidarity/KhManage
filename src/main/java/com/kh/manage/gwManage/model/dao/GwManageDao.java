package com.kh.manage.gwManage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.forum.model.vo.Mwork;
import com.kh.manage.gwManage.model.vo.GWork;
import com.kh.manage.gwManage.model.vo.GwRepeat;
import com.kh.manage.gwManage.model.vo.Statistics;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.Project;

public interface GwManageDao {

	List<GWork> selectAllList(SqlSessionTemplate sqlSession, String memberNo);

	int insertGw(SqlSessionTemplate sqlSession, GWork g);

	int updateGw(SqlSessionTemplate sqlSession, GWork g);

	int deleteGw(SqlSessionTemplate sqlSession, GWork g);

	List<Member> MemberList(SqlSessionTemplate sqlSession);

	String selectCurrval(SqlSessionTemplate sqlSession, GWork g);

	int insertGwWeek(SqlSessionTemplate sqlSession, GwRepeat gr);

	int insertGwDay(SqlSessionTemplate sqlSession, GwRepeat gr);

	List<Project> projectList(SqlSessionTemplate sqlSession, Member loginUser);

	Project selectProject(SqlSessionTemplate sqlSession, String pNo);

	List<Statistics> statisticsList(SqlSessionTemplate sqlSession, String pNo);

	List<Statistics> statisticsList2(SqlSessionTemplate sqlSession, String pNo);

	List<Mwork> selectListWork(SqlSessionTemplate sqlSession, Mwork w);

	List<Statistics> selectList3(SqlSessionTemplate sqlSession, String pNo);

}
