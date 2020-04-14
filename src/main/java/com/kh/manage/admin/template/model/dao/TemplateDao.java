package com.kh.manage.admin.template.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
public interface TemplateDao {

	int tempInsert(SqlSessionTemplate sqlSession, Template tmp);

	int attachInsert(SqlSessionTemplate sqlSession, Attachment at);

	String selectCurrval(SqlSessionTemplate sqlSession);

	int getListCount(SqlSessionTemplate sqlSession);

	List<Template> templateSelectAll(SqlSessionTemplate sqlSession, PageInfo pi);

	Template selectOneTemplate(SqlSessionTemplate sqlSession, Template tmp);

	int updateTemplate(SqlSessionTemplate sqlSession, Template tmp);



}
