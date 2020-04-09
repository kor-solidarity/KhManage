package com.kh.manage.project.model.service;

import com.kh.manage.project.model.vo.ProjectType;

import java.util.List;

public interface ProjectService {
	
	// 프로젝트 형태 목록 반환
	List<ProjectType> selectProjectTypeList();
}
