package com.kh.manage.admin.access.service;

import java.util.List;

import com.kh.manage.admin.access.vo.Access;
import com.kh.manage.common.PageInfo;

public interface AccessService {
	 int insertAccessGroup(Access ac);

	List<Access> accessSelectAll(PageInfo pi);

	int getListCount();

	List<Access> searchAccess(Access access); 
}
