package com.kh.manage.work.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.service.WorkService;
import com.kh.manage.work.model.vo.Work;
import com.kh.manage.work.model.vo.WorkProjectTeam;

@Controller
public class WorkController {

	@Autowired
	private WorkService ws;
	
	
	@RequestMapping("/myWorkList.wk")
	public String myWorkList(Model m, HttpServletRequest request) {
		
		Member member = (Member) request.getSession().getAttribute("loginUser");
		/* List<Work> list = ws.selectWorkList(member); */
		
		HashMap<String, List> map = ws.selectWorkMap(member);
		
		List<WorkProjectTeam> wp = ws.selectTeamWork(member);
		
		if(map != null || wp != null) {
			request.setAttribute("map", map);
			request.setAttribute("wp", wp);
			return "user/work/myWorkList";
		}else {
			request.setAttribute("msg", "작업 리스트 출력 오류");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("/myWorkReg.wk")
	public String myWorkReg(Model model, Work work, HttpServletRequest request) {
		
		System.out.println(work);
		
		int result = ws.insertWork(work);
		
		
		if(result > 0) {
			
			return "redirect:myWorkList.wk";
		}else {
			return "redirect:index.jsp";
		}
	}
	
	@RequestMapping("/selectWork.wk")
	public void selectWork(String workNo, HttpServletRequest request,  HttpServletResponse response) {
		
		Work w = ws.selectWork(workNo);
		
		System.out.println(w);
		request.setAttribute("work", w);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String gson = new Gson().toJson(w);
		
		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping("/myWorkChange.wk")
	public void myWorkChange(Model model, Work work, HttpServletRequest request) {
		
	}
}
