package com.kh.manage.generalWork.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.generalWork.model.service.GeneralWorkService;
import com.kh.manage.generalWork.model.vo.GeneralWork;
import com.kh.manage.member.model.vo.Member;

@Controller
public class GeneralWorkController {
	@Autowired
	private GeneralWorkService gs;
	
	
	@RequestMapping("/showGeneralWorkMain.gw")
	public String showGeneralWorkMain(Model model, HttpSession session, HttpServletRequest request) {
		
		int currentPage = 1;
		Member m = (Member) session.getAttribute("loginUser");
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		

		int listCount = gs.getListCount(m);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		List<GeneralWork> list = gs.generalWorkSelectAll(pi, m);
		
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		
		return "user/generalWork/generalWorkList";
	}
	
	@RequestMapping("/showInsertGeneralWorkPage.gw")
	public String showInsertGeneralWorkPage() {
		
		return "user/generalWork/generalWorkInsert";
	}
	
	@RequestMapping("/insertGeneralWork.gw")
	public String insertGeneralWork(GeneralWork work, HttpServletRequest request, HttpSession session, @RequestParam MultipartFile file) {
		Member m = (Member) session.getAttribute("loginUser");
		
		work.setMemberNo(m.getMemberNo());
		
		if(file.getSize() >  0) {
			
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		
		String filePath = root + "\\uploadfiles";
		String originFileName = file.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String changeName = CommonsUtils.getRandomString();
		
		Attachment at = new Attachment();
		at.setChangeName(changeName);
		at.setOriginName(originFileName);
		at.setFilePath(filePath);
		at.setExt(ext);
		try {
			file.transferTo(new File(filePath + "\\" + changeName + ext));
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		GeneralWork insertWork = gs.insertGeneralWork(work);
		
		if(insertWork.getGwNo() != null) {
			at.setDivision(insertWork.getGwNo());
			int result = gs.insertGeneralWorkAttachment(at);
		}
		
		}else {
			GeneralWork insertWork = gs.insertGeneralWork(work);
			
		}
		
		return "redirect:showGeneralWorkMain.gw";
	}
	
	@RequestMapping("/generalWorkDetailPage.gw")
	public String generalWorkDetailPage(Model model, GeneralWork work) {
		
		GeneralWork generalWork = gs.selectOneGeneralWork(work);
		
		List<Attachment> list = gs.attachmentList(work);
		if(list.size() >0) {
			model.addAttribute("list", list);
		}else {
			model.addAttribute("list", null);
		}
		
		model.addAttribute("work", generalWork);
		
		return "user/generalWork/generalWorkDetail";
	}
	
}
