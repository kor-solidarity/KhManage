package com.kh.manage.gwManage.model.service;

import java.util.List;


import com.kh.manage.gwManage.model.vo.GWork;

public interface GwManageService {

	List<GWork> selectAllList(String memberNo);

	int insertGw(GWork g);

}
