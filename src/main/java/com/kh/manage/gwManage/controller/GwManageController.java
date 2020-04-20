package com.kh.manage.gwManage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void insertGw(GWork g, Model m, HttpServletRequest request) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		String memberNo = loginUser.getMemberNo();
		g.setMemberNo(memberNo);
		
		System.out.println(g);
		
		int result = gs.insertGw(g);
		
		
	}
	
	
}
