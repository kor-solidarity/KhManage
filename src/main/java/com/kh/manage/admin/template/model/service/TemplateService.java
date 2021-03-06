package com.kh.manage.admin.template.model.service;


import java.util.List;

import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.admin.template.model.vo.TemplateWork;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;

public interface TemplateService {

	int tempInsert(Template tmp, Attachment at);

	int getListCount();

	List<Template> templateSelectAll(PageInfo pi);

	Template selectOneTemplate(Template tmp);

	int tempUpdate(Template tmp);

	int excelInsert(Template tmp, Attachment at);

	List<TemplateWork> selectTwList(String tm);

	void temDelete(String tNo);



}
