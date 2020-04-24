package com.kh.manage.report.model.service;

import java.util.List;

import com.kh.manage.member.model.vo.Member;
import com.kh.manage.report.model.vo.Report;

public interface ReportService {

	List<Report> issueSelectList(Member m);

}
