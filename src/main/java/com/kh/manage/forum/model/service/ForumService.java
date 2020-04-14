package com.kh.manage.forum.model.service;

import java.util.List;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.forum.model.vo.Notice;

public interface ForumService {

	int noticeInsert(Notice n, Attachment at);

	int getListCount();

	List<Notice> noticeSelectAll(PageInfo pi);

	Notice selectNotice(Notice n);

}
