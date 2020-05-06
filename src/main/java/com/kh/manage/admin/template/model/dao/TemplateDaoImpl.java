package com.kh.manage.admin.template.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.admin.template.model.vo.TemplateWork;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;

@Repository
public class TemplateDaoImpl implements TemplateDao{

	@Override
	public int tempInsert(SqlSessionTemplate sqlSession, Template tmp) {
		
		System.out.println("dao1");
		
		System.out.println(tmp);
		int result = sqlSession.insert("Template.insertTemplate",tmp);
		
		System.out.println(result);
		return result;
	}

	@Override
	public int attachInsert(SqlSessionTemplate sqlSession, Attachment at) {
		
		System.out.println("dao2");
		System.out.println(at);
		return sqlSession.insert("Attachment.insertAttach", at);
	}

	@Override
	public String selectCurrval(SqlSessionTemplate sqlSession) {
		
		String tempNo = "TEM" + sqlSession.selectOne("Template.selectCurrval");
		
		System.out.println("currval : " + tempNo);
		
		return tempNo;
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Template.getListCount");
	}

	@Override
	public List<Template> templateSelectAll(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		
		return sqlSession.selectList("Template.selectAll", null, rowBounds);
		
	}

	@Override
	public Template selectOneTemplate(SqlSessionTemplate sqlSession, Template tmp) {
		
		return sqlSession.selectOne("Template.selectOne", tmp);
	}

	@Override
	public int updateTemplate(SqlSessionTemplate sqlSession, Template tmp) {
		
		return sqlSession.update("Template.updateTemp", tmp);
	}

	@Override
	public int excelInsert(SqlSessionTemplate sqlSession, TemplateWork tw) {

		return sqlSession.insert("Template.insertExcel",tw);
	}

	@Override
	public List<TemplateWork> selectTwList(SqlSessionTemplate sqlSession, String tm) {

		return sqlSession.selectList("Template.selectTwList", tm);
	}

	@Override
	public void temDelete(SqlSessionTemplate sqlSession, String tNo) {

		sqlSession.update("Template.deleteTem",tNo);
	}



}
