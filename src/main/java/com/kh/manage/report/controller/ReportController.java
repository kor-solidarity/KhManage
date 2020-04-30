package com.kh.manage.report.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.report.model.service.ReportService;
import com.kh.manage.report.model.vo.Report;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService rs;
	
	
	@RequestMapping("/selectIssueList.re")
	public void issueSelectList(Member m, HttpServletRequest request, HttpServletResponse response) {
		List<Report> list = rs.issueSelectList(m);       
		
		request.setAttribute("list", list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(list);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/checkAllReport.re")
	public void checkAllReport(Member m, HttpServletRequest request, HttpServletResponse response) {
		int result  = rs.checkAllReport(m);
		int i = 1;
		
		request.setAttribute("result", i);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(i);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/checkReportPopup.re")
	public void checkReportPopup(Report re) {
		
		int result = rs.checkReportPopup(re);
	}
	
	@RequestMapping("/checkProjectPl.re")
	public void checkProjectPl(Report re, HttpServletRequest request, HttpServletResponse response) {
		
		List<Member> list = rs.selectPsmPm(re);
		
		request.setAttribute("list", re);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String gson = new Gson().toJson(list);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updateStatus.re")
	public String updateStatus(Report re) {
		System.out.println("sadsdsadsadasdasdsad : " + re);
		
		
		return null;
	}
}
