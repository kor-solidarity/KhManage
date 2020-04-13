package com.kh.manage.admin.template.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.admin.template.model.dao.TemplateDao;
import com.kh.manage.admin.template.model.vo.Template;
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

	
}
