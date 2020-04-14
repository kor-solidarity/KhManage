package com.kh.manage.work.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.manage.work.model.vo.Work;

@Controller
public class WorkController {

	@RequestMapping("/myWorkList.wk")
	public String myWorkList() {
		
		return "user/work/myWorkList";
	}
	
	
	@RequestMapping("/myWorkReg.wk")
	public String myWorkReg(Model model, Work work, HttpServletRequest request) {
		
		System.out.println(work);
		
		return "user/work/myWorkList";
	}
}
