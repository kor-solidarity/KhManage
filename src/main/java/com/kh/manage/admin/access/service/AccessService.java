package com.kh.manage.admin.access.service;

import java.util.List;

import com.kh.manage.admin.access.vo.Access;

public interface AccessService {
	 int insertAccessGroup(Access ac);

	List<Access> accessSelectAll(); 
}
