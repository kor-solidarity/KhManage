package com.kh.manage.report.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.member.model.vo.Member;
import com.kh.manage.report.model.dao.ReportDao;
import com.kh.manage.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ReportDao rd;

	@Override
	public List<Report> issueSelectList(Member m) {

		return rd.issueSelectList(sqlSession, m);
	}

	@Override
	public int checkAllReport(Member m) {
		
		return rd.checkAllReport(sqlSession, m);
	}

}
