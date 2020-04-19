package com.kh.manage.generalWork.model.service;

import java.util.List;

import com.kh.manage.admin.adminManage.vo.Access;
import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.generalWork.model.vo.GeneralWork;
import com.kh.manage.member.model.vo.Member;

public interface GeneralWorkService {

	GeneralWork insertGeneralWork(GeneralWork work);

	int insertGeneralWorkAttachment(Attachment at);

	int getListCount(Member m);

	List<GeneralWork> generalWorkSelectAll(PageInfo pi, Member m);

	GeneralWork selectOneGeneralWork(GeneralWork work);

	List<Attachment> attachmentList(GeneralWork work);

	int deleteGeneralWork(GeneralWork work);

	int deleteAttachment(GeneralWork work);

	Attachment selectOneAttachment(Attachment atNo);

	List<Attachment> selectAllAttachment(GeneralWork work);

	int deleteGeneralWorkDelete(Attachment attachment);

	int updateGeneralWork(GeneralWork work);



}
