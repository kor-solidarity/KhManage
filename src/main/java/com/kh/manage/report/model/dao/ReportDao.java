package com.kh.manage.report.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.member.model.vo.Member;
import com.kh.manage.report.model.vo.Report;

public interface ReportDao {

	List<Report> issueSelectList(SqlSessionTemplate sqlSession, Member m);

	int checkAllReport(SqlSessionTemplate sqlSession, Member m);

	int checkReportPopup(SqlSessionTemplate sqlSession, Report re);

	List<Member> selectPsmPm(SqlSessionTemplate sqlSession, Report re);

}
