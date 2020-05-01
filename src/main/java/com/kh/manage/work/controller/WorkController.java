package com.kh.manage.work.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.service.WorkService;
import com.kh.manage.work.model.vo.Grantor;
import com.kh.manage.work.model.vo.Work;
import com.kh.manage.work.model.vo.WorkAttachment;
import com.kh.manage.work.model.vo.WorkProductw;
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
			return "user/work/myWorkList2";
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
	public ModelAndView selectWork(String workNo, ModelAndView mv) {
		
		Work w = ws.selectWork(workNo);
		System.out.println(w);
		List<Grantor> gt = ws.selectGrantorList(w.getProjectNo());
		
		mv.addObject("gt", gt);
		mv.addObject("work", w);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	
	@RequestMapping("/myWorkChange.wk")
	public String myWorkChange(Model model, Work work, HttpServletRequest request) {
		System.out.println("변경 " + work);
		
		int result = ws.updateMyWork(work);
		
		
		if(result > 0) {
			
			return "redirect:myWorkList.wk";
		}else {
			
			request.setAttribute("msg", "작업 업데이트 오류");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("/projectGrantorList.wk")
	public ModelAndView projectGrantorList(String pno, ModelAndView mv) {
		System.out.println("값 출력 확인 : " + pno);
		List<Grantor> gt = ws.selectGrantorList(pno);
		
		mv.addObject("gt", gt);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	
	@RequestMapping("/myWorkFile.wk")
	public String workFileInsert(WorkProductw wp, HttpServletRequest request, HttpSession session, @RequestParam MultipartFile[] file) {
		int result = 0;
		System.out.println("산출물 확인 " +  wp);
		for(int i = 0; i < file.length; i++) {
			System.out.println("파일 확인" + file[i]);
		}
		List<Attachment> aList =  new ArrayList<Attachment>();
		
		if(file.length > 0) {
			for(int i = 0; i < file.length; i++) {
				if(file[i].getSize() > 0) {
					String root = request.getSession().getServletContext().getRealPath("resources");
					String filePath = root + "\\uploadfiles";
					String originFileName = file[i].getOriginalFilename();
					String ext = originFileName.substring(originFileName.lastIndexOf("."));
					String changeName = CommonsUtils.getRandomString();
					
					try {
						file[i].transferTo(new File(filePath + "\\" + changeName + ext));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					Attachment at = new Attachment();
					at.setChangeName(changeName);
					at.setOriginName(originFileName);
					at.setFilePath(filePath);
					at.setExt(ext);
					
					aList.add(at);
					
				}
			}
			  result = ws.insertWorkProduct(wp);
			System.out.println(aList);
			if(result > 0) {
				for(int i = 0; i < aList.size(); i++) {
					int result1 = ws.insertWorkAttachment(aList.get(i));
				}
			}
			
		}else {
			result = ws.insertWorkProduct(wp);
		}
		
		if(result > 0) {
			return "redirect:myWorkList.wk";
		}else {
			request.setAttribute("msg", "산출물 등록 오류");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("/deleteWorkProduct.wk")
	public ModelAndView deleteWorkProduct(String atNo, String workNo, String changeName, String filePath, String ext, ModelAndView mv) {
		System.out.println("출력" + atNo);
		System.out.println("테스트" + workNo);
		System.out.println("바뀐이름 :" + changeName);
		System.out.println("경로 : " + filePath);
		System.out.println("확장자 : " + ext);
		
		
		int result = ws.deleteWorkProduct(atNo);
		
		if(result > 0) {
			new File(filePath + "\\" + changeName + ext).delete();
			
			Work w = ws.selectWork(workNo);
			
			mv.addObject("work", w);
			
			mv.setViewName("jsonView");
		}
		
		return mv;
	}
}
