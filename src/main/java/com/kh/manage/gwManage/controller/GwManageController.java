package com.kh.manage.gwManage.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kh.manage.gwManage.model.service.GwManageService;
import com.kh.manage.gwManage.model.vo.GWork;
import com.kh.manage.member.model.vo.Member;

@Controller
public class GwManageController {
	
	@Autowired
	private GwManageService gs;
	
	@RequestMapping("gwManageMain.gwm")
	public String gwManageMain(Model m, HttpServletRequest request) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		String memberNo = loginUser.getMemberNo();
		
		List<GWork> list = gs.selectAllList(memberNo);
			
		
		System.out.println(list);
		
		m.addAttribute("list", list);
		
		
		return "user/gwManage/gwManageMain";
	}
	
	@RequestMapping("insertGw.gwm")
	public void insertGw(GWork g, Model m, HttpServletRequest request, HttpServletResponse response) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		String memberNo = loginUser.getMemberNo();
		g.setMemberNo(memberNo);
		
		System.out.println(g);
		
		int result = gs.insertGw(g);
		
		request.setAttribute("result", result);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		
		String gson = new Gson().toJson(result);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("update.gwm")
	public String updateGw(GWork g, Model m, HttpServletRequest request) throws ParseException {
		
		System.out.println("update : " +g);
		String bg = request.getParameter("beginDate2");
		System.out.println(bg);
		
		String bDate = request.getParameter("bDate");
		String bTime = request.getParameter("bTime");
		String bDate2 = bDate + bTime;
		g.setStatus(bDate2);
		System.out.println("bDate2 : " + bDate2);
		
		java.sql.Date bd = java.sql.Date.valueOf(bDate);

		System.out.println(bd);
		System.out.println(bTime);
		
		int result = gs.updateGw(g);
		System.out.println(result);
		
		System.out.println("1개의 행이 업데이트 되었습니다.^^");
		return "redirect:gwManageMain.gwm";
	}
	
	
}
