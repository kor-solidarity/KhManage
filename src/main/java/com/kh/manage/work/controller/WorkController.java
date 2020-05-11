package com.kh.manage.work.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.kh.manage.work.model.vo.WorkProjectName;
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
		
		List<WorkProjectName> list8 = null;
		System.out.println("작업출력확인" + wp);
		for(int i = 0; i < wp.size(); i++) {
			if(wp.get(i).getRole().equals("PM") || wp.get(i).getRole().equals("PSM")) {
				list8 = ws.selectWorkGrantorList(member);
			}
		}
		
		map.put("list8", list8);
		
		
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
			WorkProjectTeam wp = ws.selectWorkProjectTeam(work);
			
			HashMap<String, Object> map = new HashMap();
			map.put("work", work);
			map.put("wp", wp);
			
			if(work.getWorkType().equals("프로젝트")) {
				int result1 = ws.insertWorkHistory(map);
			}
			
			return "redirect:myWorkList.wk";
		}else {
			return "redirect:index.jsp";
		}
	}
	
	@RequestMapping("/selectWork.wk")
	public ModelAndView selectWork(String workNo, ModelAndView mv, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		Work w = ws.selectWork(workNo);
		System.out.println(w);
		
		HashMap<String, String> map = new HashMap();
		int wL = Integer.parseInt(w.getWorkLevel());
		
		String workLevel1 = String.valueOf(wL - 1);
		
		map.put("workLevel", workLevel1);
		map.put("pno", w.getProjectNo());
		
		List<Grantor> gt = ws.selectGrantorList(w.getProjectNo());
		List<Grantor> gt1 = ws.selectGrantorList(w.getProjectNo());
		List<Grantor> mn = ws.selectGrantorList2(w.getProjectNo());
		List<Grantor> mn1 = ws.selectGrantorList2(w.getProjectNo());
		List<Work> hw = ws.selectHighWorkNoList(map);
		
		
		
		mv.addObject("gt", gt);
		mv.addObject("mn", mn);
		mv.addObject("gt1", gt1);
		mv.addObject("mn1", mn1);
		mv.addObject("work", w);
		mv.addObject("loginUser", member);
		mv.addObject("hw", hw);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	
	@RequestMapping("/myWorkChange.wk")
	public String myWorkChange(Model model, Work work, HttpServletRequest request) {
		System.out.println("변경 " + work);
		
		int result = ws.updateMyWork(work);
		
		
		if(result > 0) {
			WorkProjectTeam wp = ws.selectWorkProjectTeam(work);
			HashMap<String, Object> map = new HashMap();
			map.put("work", work);
			map.put("wp", wp);
			
			if(work.getWorkType().equals("프로젝트")) {
				int result1 = ws.insertWorkHistory2(map);
			}
			
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
	
	@RequestMapping("/highWorkNoList.wk")
	public ModelAndView highWorkNoList(String workLevel, String pno, ModelAndView mv) {
		HashMap<String, String> map = new HashMap();
		int wL = Integer.parseInt(workLevel);
		
		String workLevel1 = String.valueOf(wL - 1);
		
		map.put("workLevel", workLevel1);
		map.put("pno", pno);
		
		
		List<Work> hw = ws.selectHighWorkNoList(map);
		
		mv.addObject("hw", hw);
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
	
	@RequestMapping("/download.wk")
	public void download(Model m, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String no = request.getParameter("atNo");
		System.out.println("파일 no : " + no);
		
		Attachment file = ws.downAttachment(no);
		System.out.println("file : " + file);
		
		
		//폴더에서 파일을 읽을 스트림 생성
		BufferedInputStream buf = null;
		
		//클라이언트로 내보낼 출력 스트림 생성
		ServletOutputStream downOut = response.getOutputStream();
		
		//스트림으로 전송할 파일 객체 생성
		File downFile = new File(file.getFilePath() +"\\"+ file.getChangeName() + file.getExt());
		
		//응당 헤더 설정
		response.setContentType("text/plain; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(file.getOriginName().getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int) downFile.length());
		
		FileInputStream fin = new FileInputStream(downFile);
		buf = new BufferedInputStream(fin);
		
		int readBytes = 0;
		while((readBytes = buf.read()) != -1){
			downOut.write(readBytes);
		}
		
		downOut.close();
		buf.close();
		
	}
}
