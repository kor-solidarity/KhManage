package com.kh.manage.forum.model.service;

import java.util.List;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.forum.model.vo.Mwork;
import com.kh.manage.forum.model.vo.Notice;
import com.kh.manage.forum.model.vo.Reply;
import com.kh.manage.project.model.vo.ProjectDetail;

public interface ForumService {

	int noticeInsert(Notice n, Attachment at);

	int getListCount();

	List<Notice> noticeSelectAll(PageInfo pi);

	Notice selectNotice(Notice n);

	Attachment selectAttachment(Attachment at);

	Attachment downAttachment(String no);

	int replyInsert(Reply rp);

	List<Reply> selectAllReply(String no);

	int deleteNotice(String nNo);

	Notice updateNoticeSelect(String nNo);

	int deleteReply(String no);

	int replyUpdate(Reply rp);

	int noticeUpdate(Notice n, Attachment at);

	int noticeUpdate2(Notice n);

	List<Mwork> selectListWork(Mwork w);

	int noticeInser2(Notice n);

}
