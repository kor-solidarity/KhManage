package com.kh.manage.report.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.member.model.vo.Member;
import com.kh.manage.report.model.vo.Report;

@Repository
public class ReportDaoImpl implements ReportDao{

	@Override
	public List<Report> issueSelectList(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectList("Report.issueSelectList", m);
	}

	@Override
	public int checkAllReport(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.delete("Report.checkAllReport", m);
	}

	@Override
	public int checkReportPopup(SqlSessionTemplate sqlSession, Report re) {
		
		return sqlSession.update("Report.checkReportPopup", re);
	}

	@Override
	public List<Member> selectPsmPm(SqlSessionTemplate sqlSession, Report re) {
		
		return sqlSession.selectList("Report.selectPsmPm", re);
	}
	
}
