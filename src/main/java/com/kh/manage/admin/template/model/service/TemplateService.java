package com.kh.manage.admin.template.model.service;


import java.util.List;

import com.kh.manage.admin.template.model.vo.Template;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;

public interface TemplateService {

	int tempInsert(Template tmp, Attachment at);

	int getListCount();

	List<Template> templateSelectAll(PageInfo pi);



}
