package com.kh.manage.admin.template.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.manage.admin.template.model.service.TemplateService;
import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.CommonsUtils;
import com.kh.manage.common.PageInfo;
import com.kh.manage.common.Pagination;
import com.kh.manage.member.model.vo.Member;

@Controller
public class TemplateController {
	
	@Autowired
	private TemplateService ts; 
	
//	@Autowired
//	private Attachment at;
	
	
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
	
	@RequestMapping("/insertTemplate.am")
	public String InsertTemplate() {
		
		return "admin/templateManage/insertTemplate";
	}
	@RequestMapping("/templateManagePage.am")
	public String templateManage() {
		
		return "admin/templateManage/templateManage";
	}
	@RequestMapping("/templateExcel.am")
	public String templateExcel() {
		
		return "admin/templateManage/templateExcel";
	}
	
	
	@RequestMapping(value="/tempInsert.am", method=RequestMethod.POST)
	public String templateInsert(Template tmp,HttpServletRequest request,@RequestParam MultipartFile upfile , Model m) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");//web밑에있는 resources이다.

		System.out.println("root : " + root);
		//root : C:\dev\6_Framework\Spring\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\testSpringProject\resources
		
		
		String filePath = root + "\\uploadFiles"; 
		
		//-----------------------------------------------------------------------
		//파일명 변경
		String originFileName = upfile.getOriginalFilename();//원본 파일 이름
		String ext = originFileName.substring(originFileName.lastIndexOf("."));//.png , .jpg 
		String changeName = CommonsUtils.getRandomString();
		
		Attachment at = new Attachment();
		at.setChangeName(changeName);
		at.setOriginName(originFileName);
		at.setFilePath(filePath);
		
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
			
		} catch (Exception e) {
			
			new File(filePath + "\\" + changeName + ext).delete();
		}
		
		
		return "admin/templateManage/templatePage";
	}

}
