package com.kh.manage.admin.template.model.service;

import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.admin.template.model.dao.TemplateDao;
import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.admin.template.model.vo.TemplateWork;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
@Service
public class TemplateServiceImpl implements TemplateService{

	@Autowired
	private TemplateDao td;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int tempInsert(Template tmp, Attachment at) {
		
		System.out.println("service");
		int result = 0;
		
		int result1 = td.tempInsert(sqlSession,tmp);
		
		System.out.println("result1 : " + result1);
		
		String tempNo = td.selectCurrval(sqlSession);
		
		at.setDivision(tempNo);
		
		System.out.println(tempNo);
		
		int result2 = td.attachInsert(sqlSession,at);
		
		
		System.out.println("result2 : " + result2);
		
		if(result1 > 0 && result2 > 0) {
			
			result = 1;
		}
		
		return result;
		
	}

	@Override
	public int getListCount() {
		
		return td.getListCount(sqlSession);
	}

	@Override
	public List<Template> templateSelectAll(PageInfo pi) {
		
		
		return td.templateSelectAll(sqlSession, pi);
	}

	@Override
	public Template selectOneTemplate(Template tmp) {
		
		return td.selectOneTemplate(sqlSession, tmp);
	}

	@Override
	public int tempUpdate(Template tmp) {
		
		return td.updateTemplate(sqlSession, tmp);
	}

	@Override
	public int excelInsert(Template tmp, Attachment at) {
		
		XSSFRow row;

		XSSFCell cell;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		DataFormatter formatter = new DataFormatter();
		int result2 = 0;
		
		String tno =td.selectCurrval(sqlSession);
		
		

		try {

			FileInputStream inputStream = new FileInputStream(at.getFilePath() + "\\" +  at.getChangeName() + at.getExt());

			XSSFWorkbook workbook = new XSSFWorkbook(inputStream);



			//sheet수 취득

			int sheetCn = workbook.getNumberOfSheets();

			System.out.println("sheet수 : " + sheetCn);

			

			for(int cn = 0; cn < sheetCn; cn++){

				System.out.println("취득하는 sheet 이름 : " + workbook.getSheetName(cn));

				System.out.println(workbook.getSheetName(cn) + " sheet 데이터 취득 시작");

				

				//0번째 sheet 정보 취득

				XSSFSheet sheet = workbook.getSheetAt(cn);

				

				//취득된 sheet에서 rows수 취득

				int rows = sheet.getPhysicalNumberOfRows();

				System.out.println(workbook.getSheetName(cn) + " sheet의 row수 : " + rows);


				//취득된 row에서 취득대상 cell수 취득

				int cells = sheet.getRow(cn).getPhysicalNumberOfCells(); //

				System.out.println(workbook.getSheetName(cn) + " sheet의 row에 취득대상 cell수 : " + cells);
				
				TemplateWork tw = null;

				for (int r = 1; r < rows; r++) {

					row = sheet.getRow(r); // row 가져오기
					
					tw = new TemplateWork();
					
					tw.settNo(tno);

					if (row != null) {
						

						for (int c = 0; c < cells; c++) {
							

							cell = row.getCell(c);

							if (cell != null) {

								String value = null;
									
								
								 switch (cell.getColumnIndex()) {
								  
								 case 0:
									 
									 value = ""+ cell.getNumericCellValue();
									 tw.setwNo(value);
								  
								  break;
								  
								  case 1:
									  
									  value =  cell.getStringCellValue();
									  tw.setwName(value);
								  
								  break;
								  
								  case 2:
								  
									  value =  sdf.format(cell.getDateCellValue());
									  java.sql.Date date =java.sql.Date.valueOf(value);
									  tw.setBeginDate(date);
								  
								  break;
								 
								  case 3:
								  
									  value = sdf.format(cell.getDateCellValue());
									  java.sql.Date date2 =java.sql.Date.valueOf(value);
									  tw.setCompleteDate(date2);
								  
								  break;
								  
								  default:
								 
								  }
								 

								System.out.print(value + "\t");

							} else {

								System.out.print("[null]\t");

							}

						} // for(c) 문

						result2 = td.excelInsert(sqlSession,tw);
						
					}

				} // for(r) 문

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		
		return result2;
	}

	@Override
	public List<TemplateWork> selectTwList(String tm) {

		return td.selectTwList(sqlSession, tm);
	}

	@Override
	public void temDelete(String tNo) {
		
		td.temDelete(sqlSession, tNo);
	}

	
}
