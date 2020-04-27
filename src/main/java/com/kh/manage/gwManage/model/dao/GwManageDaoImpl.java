package com.kh.manage.gwManage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.forum.model.vo.Mwork;
import com.kh.manage.gwManage.model.vo.GWork;
import com.kh.manage.gwManage.model.vo.GwRepeat;
import com.kh.manage.gwManage.model.vo.Statistics;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.Project;

@Repository
public class GwManageDaoImpl implements GwManageDao{

	@Override
	public List<GWork> selectAllList(SqlSessionTemplate sqlSession, String memberNo) {

		return sqlSession.selectList("GWork.selectAllList2", memberNo);
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

	@Override
	public int deleteGw(SqlSessionTemplate sqlSession, GWork g) {

		return sqlSession.update("GWork.deleteGw",g);
	}

	@Override
	public List<Member> MemberList(SqlSessionTemplate sqlSession) {
	
		return sqlSession.selectList("Member.selectMemberList");
	}

	@Override
	public String selectCurrval(SqlSessionTemplate sqlSession, GWork g) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("GWork.selectCurrval");
	}

	@Override
	public int insertGwWeek(SqlSessionTemplate sqlSession, GwRepeat gr) {

		return sqlSession.insert("GWork.insertGwRepeat",gr);
	}

	@Override
	public int insertGwDay(SqlSessionTemplate sqlSession, GwRepeat gr) {
		
		return sqlSession.insert("GWork.insertGwRepeat2",gr);
	}

	@Override
	public List<Project> projectList(SqlSessionTemplate sqlSession, Member loginUser) {

		return sqlSession.selectList("GWork.selectProjectList",loginUser);
	}

	@Override
	public Project selectProject(SqlSessionTemplate sqlSession, String pNo) {

		return sqlSession.selectOne("GWork.selectProject", pNo);
	}

	@Override
	public List<Statistics> statisticsList(SqlSessionTemplate sqlSession, String pNo) {

		return sqlSession.selectList("GWork.statisticsList", pNo);
	}

	@Override
	public List<Statistics> statisticsList2(SqlSessionTemplate sqlSession, String pNo) {

		return sqlSession.selectList("GWork.statisticList2",pNo);
	}

	@Override
	public List<Mwork> selectListWork(SqlSessionTemplate sqlSession, Mwork w) {

		return sqlSession.selectList("GWork.selectListWork",w);
	}

	@Override
	public List<Statistics> selectList3(SqlSessionTemplate sqlSession, String pNo) {

		return sqlSession.selectList("GWork.statisticList3", pNo);
	}
	
	

}
