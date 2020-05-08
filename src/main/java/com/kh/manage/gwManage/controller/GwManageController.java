package com.kh.manage.gwManage.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kh.manage.forum.model.vo.Mwork;
import com.kh.manage.gwManage.model.service.GwManageService;
import com.kh.manage.gwManage.model.vo.GWork;
import com.kh.manage.gwManage.model.vo.GwRepeat;
import com.kh.manage.gwManage.model.vo.Statistics;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.project.model.vo.Project;
import com.kh.manage.work.model.vo.Work;

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
	public String insertGw(GWork g, GwRepeat gr, Model m, HttpServletRequest request, HttpServletResponse response) {
		
		String bDate = request.getParameter("bDate");
		String bTime = request.getParameter("bTime");
		String eDate = request.getParameter("eDate");
		String eTime = request.getParameter("eTime");
		//String repeat = request.getParameter("repeat");
		
		String bDate2 = bDate + bTime;
		String eDate2 = eDate + eTime;
		g.setStatus(bDate2);
		g.setTo(eDate2);
		System.out.println("bDate2 : " + bDate2);
		System.out.println("eDate : " + eDate2);
		
		
		
		if(!gr.getGwrCycle().equals("없음")) {
			g.setRepeatStatus("Y");
			if(gr.getEndOptionDay().equals("")) {
				gr.setEndOptionDay(null);
			}
		}else {
			g.setRepeatStatus("N");
		}
		
		
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		String memberNo = loginUser.getMemberNo();
		g.setMemberNo(memberNo);
		
		System.out.println(g);
		System.out.println("Gwr" + gr);
		
		
		int result = gs.insertGw(g,gr);
		
//		int result = gs.insertGw(g);
//		
//		request.setAttribute("result", result);
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
////		
////		
//		String gson = new Gson().toJson(result);
////
//		try {
//			response.getWriter().write(gson);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		return "redirect:gwManageMain.gwm";
		
	}
	
	@RequestMapping("update.gwm")
	public String updateGw(GWork g, Model m, HttpServletRequest request) throws ParseException {
		
		System.out.println("update : " +g);
		String bg = request.getParameter("beginDate2");
		System.out.println(bg);
		
		String bDate = request.getParameter("bDate");
		String bTime = request.getParameter("bTime");
		String eDate = request.getParameter("eDate");
		String eTime = request.getParameter("eTime");
		String repeat = request.getParameter("repeat");
		
		String bDate2 = bDate + bTime;
		String eDate2 = eDate + eTime;
		g.setStatus(bDate2);
		g.setTo(eDate2);
		System.out.println("bDate2 : " + bDate2);
		System.out.println("eDate : " + eDate2);
		
		java.sql.Date bd = java.sql.Date.valueOf(bDate);

		System.out.println(bd);
		System.out.println(bTime);
		
		
		int result = gs.updateGw(g);
		System.out.println(result);
		
		System.out.println("1개의 행이 업데이트 되었습니다.^^");
		return "redirect:gwManageMain.gwm";
	}
	
	
	@RequestMapping("delete.gwm")
	public String deleteGw(GWork g) {
		
		System.out.println("삭제?" + g);
		
		
		
		int result = gs.deleteGw(g);
			
		return "redirect:gwManageMain.gwm";
	}
	
	
	@RequestMapping("selectMember.gwm")
	public void memberList(HttpServletRequest request, HttpServletResponse response) {
		
		List<Member> list = gs.memberList();
		
		System.out.println(list);
		
		request.setAttribute("result", list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		
		String gson = new Gson().toJson(list);

		try {
			response.getWriter().write(gson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("detailDashboard.gwm")
	public String projectList(HttpServletRequest request, Model m) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		List<Project> list = gs.projectList(loginUser);
		
		System.out.println(list);
		String pNo = list.get(0).getProjectPk();
		
		System.out.println("pno" + pNo);
		
		Project pro = gs.selectProject(pNo);
		
		List<Statistics> list2 = gs.statisticsList(pNo);
		
		List<Statistics> list3 = gs.statisticsList2(pNo);
		
		List<Statistics> list4 = gs.statisticsList3(pNo);
		
		Mwork w = new Mwork();
		w.setProjectNo(pNo);
		
		List<Mwork> list5 = gs.selectListWork(w);
		
		
		m.addAttribute("list", list);
		m.addAttribute("pNo", pNo);
		m.addAttribute("pro",pro);
		m.addAttribute("list2", list2);
		m.addAttribute("list3", list3);
		m.addAttribute("list4", list4);
		m.addAttribute("list5", list5);
		
		
		return "user/main/detailDashboard";
		
	}
	
	@RequestMapping("selectDashBoard.gwm")
	public String selectProjectList(HttpServletRequest request, Model m) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		List<Project> list = gs.projectList(loginUser);
		
		String pNo = request.getParameter("pNo");
		
		Project pro = gs.selectProject(pNo);
		
		List<Statistics> list2 = gs.statisticsList(pNo);
		
		List<Statistics> list3 = gs.statisticsList2(pNo);
		
		List<Statistics> list4 = gs.statisticsList3(pNo);
		
		Mwork w = new Mwork();
		w.setProjectNo(pNo);
		
		List<Mwork> list5 = gs.selectListWork(w);
		
		
		m.addAttribute("list", list);
		m.addAttribute("pNo", pNo);
		m.addAttribute("pro",pro);
		m.addAttribute("list2", list2);
		m.addAttribute("list3", list3);
		m.addAttribute("list4", list4);
		m.addAttribute("list5", list5);
		
		return "user/main/detailDashboard2";
	}
	
	
}
