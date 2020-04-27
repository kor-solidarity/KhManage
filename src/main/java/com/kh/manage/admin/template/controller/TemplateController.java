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
	public String templateExcel(HttpServletRequest request) {
		
		
		String tm = request.getParameter("tm");
		System.out.println(tm);
		
//		XSSFRow row;
//
//		XSSFCell cell;
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		DataFormatter formatter = new DataFormatter();
//		
//		
//
//		try {
//
//			FileInputStream inputStream = new FileInputStream("D:/tmp/file/test3.xlsx");
//
//			XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
//
//
//
//			//sheet수 취득
//
//			int sheetCn = workbook.getNumberOfSheets();
//
//			System.out.println("sheet수 : " + sheetCn);
//
//			
//
//			for(int cn = 0; cn < sheetCn; cn++){
//
//				System.out.println("취득하는 sheet 이름 : " + workbook.getSheetName(cn));
//
//				System.out.println(workbook.getSheetName(cn) + " sheet 데이터 취득 시작");
//
//				
//
//				//0번째 sheet 정보 취득
//
//				XSSFSheet sheet = workbook.getSheetAt(cn);
//
//				
//
//				//취득된 sheet에서 rows수 취득
//
//				int rows = sheet.getPhysicalNumberOfRows();
//
//				System.out.println(workbook.getSheetName(cn) + " sheet의 row수 : " + rows);
//
//				
//
//				//취득된 row에서 취득대상 cell수 취득
//
//				int cells = sheet.getRow(cn).getPhysicalNumberOfCells(); //
//
//				System.out.println(workbook.getSheetName(cn) + " sheet의 row에 취득대상 cell수 : " + cells);
//				
//				Map<String, String> map = null;
//
//				List<Map<String, String>> result = new ArrayList<Map<String, String>>(); 
//
//
//				
//
//				for (int r = 0; r < rows; r++) {
//
//					row = sheet.getRow(r); // row 가져오기
//
//					if (row != null) {
//						
//						map = new HashMap<String, String>();
//
//
//						for (int c = 0; c < cells; c++) {
//
//							cell = row.getCell(c);
//
//							if (cell != null) {
//
//								String value = null;
//								
//								if (HSSFDateUtil.isInternalDateFormat(cell.getCellStyle().getDataFormat())) {
//									value = sdf.format(cell.getDateCellValue());
//									
//								}
//								// 기타
//								else {
//									value = formatter.formatCellValue(cell);
//								}
//								
//									
//								
//								 switch (cell.getCellType()) {
//								  
//								 case XSSFCell.CELL_TYPE_FORMULA:
//								  
//								  value = cell.getCellFormula();
//								  
//								  break;
//								  
//								  case XSSFCell.CELL_TYPE_NUMERIC:
//									  
//							      if (HSSFDateUtil.isInternalDateFormat(cell.getCellStyle().getDataFormat())) {
//										value = sdf.format(cell.getDateCellValue());
//											
//							      }else {
//							    	  
//							    	  value = "" + cell.getNumericCellValue();
//							      }
//								  
//								  
//								  break;
//								  
//								  case XSSFCell.CELL_TYPE_STRING:
//								  
//								  value = "" + cell.getStringCellValue();
//								  
//								  break;
//								 
//								  case XSSFCell.CELL_TYPE_BLANK:
//								  
//								  value = "[null 아닌 공백]";
//								  
//								  break;
//								  
//								  case XSSFCell.CELL_TYPE_ERROR:
//								  
//								  value = "" + cell.getErrorCellValue();
//								  
//								  break;
//								 
//								  
//								  default:
//								 
//								  }
//								 
//
//								System.out.print(value + "\t");
//
//							} else {
//
//								System.out.print("[null]\t");
//
//							}
//
//						} // for(c) 문
//
//						System.out.print("새로운 줄\n");
//
//					}
//
//				} // for(r) 문
//
//			}
//
//		} catch (Exception e) {
//
//			e.printStackTrace();
//
//		}
//
//		
		
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
			
		} catch (Exception e) {
			
			new File(filePath + "\\" + changeName + ext).delete();
		}
		
		
		return "admin/templateManage/templatePage";
	}
	
	
	@RequestMapping(value="/tempUpdate.am", method=RequestMethod.POST)
	public String templateUpdate(Template tmp) {
		
		System.out.println(tmp);
		
		int result = ts.tempUpdate(tmp);
		
		System.out.println("result : " + result);
			
		return "redirect:/templateManage.am";
	}
	
	

}











