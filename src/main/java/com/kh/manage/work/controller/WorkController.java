package com.kh.manage.work.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.service.WorkService;
import com.kh.manage.work.model.vo.Work;

@Controller
public class WorkController {

	@Autowired
	private WorkService ws;
	
	
	@RequestMapping("/myWorkList.wk")
	public String myWorkList(Model m, HttpServletRequest request) {
		
		Member member = (Member) request.getSession().getAttribute("loginUser");
		List<Work> list = ws.selectWorkList(member);
		
		if(list != null) {
			request.setAttribute("list", list);
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
}
