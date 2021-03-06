package com.kh.manage.admin.template.controller;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.manage.admin.template.model.service.TemplateService;
import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.admin.template.model.vo.TemplateWork;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.member.model.vo.Member;

@Controller
public class TemplateController {
	
	@Autowired
	private TemplateService ts; 
	
	@Autowired
	private Template tmp;
	
//	@Autowired
//	private Attachment at;
	
	//템플릿 메인화면 리스트 메소드
	@RequestMapping("/templateManage.am")
	public String templateMain(Model m , HttpServletRequest request) {
		
		int currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int listCount = ts.getListCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		List<Template> list = ts.templateSelectAll(pi);

		m.addAttribute("list", list);
		m.addAttribute("pi",pi);
		
		return "admin/templateManage/templatePage";
	}
	
	//템플릿 상세보기 메소드
	@RequestMapping("selectOneTemplate.am")
	public String selectOneTemplate(Model m, HttpServletRequest request) {
		
		String tm = request.getParameter("tm");
		
		System.out.println(tm);
		
		tmp.setTemplatePk(tm);
		
		Template tem = ts.selectOneTemplate(tmp);
		
		System.out.println(tem);
		
		m.addAttribute("tem",tem);
		
		return "admin/templateManage/templateManage";
	}
	
	
	@RequestMapping("/insertTemplate.am")
	public String InsertTemplate() {
		
		return "admin/templateManage/insertTemplate";
	}
	@RequestMapping("/templateManagePage.am")
	public String templateManage() {
		
		return "admin/templateManage/templateManage";
	}
	
	
	
	@RequestMapping("/templateExcel.am")
	public String templateExcel(HttpServletRequest request, Model m) {
		
		
		String tm = request.getParameter("tm");
		System.out.println(tm);
		
		List<TemplateWork> list = ts.selectTwList(tm);
		
		System.out.println("list : " +list);
		
		m.addAttribute("list", list);
		m.addAttribute("tm", tm);
		
		return "admin/templateManage/templateExcel";
	}
	
	//템플릿 등록 메소드
	@RequestMapping(value="/tempInsert.am", method=RequestMethod.POST)
	public String templateInsert(Template tmp,HttpServletRequest request,@RequestParam MultipartFile upfile , Model m) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");//web밑에있는 resources이다.

		System.out.println("root : " + root);
		
		String filePath = root + "\\uploadFiles"; 
		
		String originFileName = upfile.getOriginalFilename();//원본 파일 이름
		String ext = originFileName.substring(originFileName.lastIndexOf("."));//.png , .jpg 
		String changeName = CommonsUtils.getRandomString();
		
		Attachment at = new Attachment();
		at.setChangeName(changeName);
		at.setOriginName(originFileName);
		at.setFilePath(filePath);
		at.setExt(ext);
		
		System.out.println(tmp.getDetail());
		System.out.println(tmp.getProjectTypePk());
		System.out.println(tmp.getTemplateName());
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		System.out.println(loginUser);
		
		
		tmp.setMemberPk(loginUser.getMemberNo());
		
		
		try {
			int result = ts.tempInsert(tmp,at);
			System.out.println("controller : " + result);
			upfile.transferTo(new File(filePath + "\\" +  changeName + ext));
			
			int result2 = ts.excelInsert(tmp,at);
			
		} catch (Exception e) {
			
			new File(filePath + "\\" + changeName + ext).delete();
		}
		
		
		return "redirect:/templateManage.am";
	}
	
	
	@RequestMapping(value="/tempUpdate.am", method=RequestMethod.POST)
	public String templateUpdate(Template tmp) {
		
		System.out.println(tmp);
		
		int result = ts.tempUpdate(tmp);
		
		System.out.println("result : " + result);
			
		return "redirect:/templateManage.am";
	}
	
	@RequestMapping("templateDelete.am")
	public String templateDelete(HttpServletRequest request) {
		
		System.out.println("들어옴");
		String tNo = request.getParameter("tNo");
		
		ts.temDelete(tNo);
		
		
		return "redirect:/templateManage.am";
	}
	
	

}











