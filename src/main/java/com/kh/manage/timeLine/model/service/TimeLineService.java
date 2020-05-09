package com.kh.manage.timeLine.model.service;

import com.kh.manage.common.Attachment;
import com.kh.manage.timeLine.model.vo.Comment;
import com.kh.manage.timeLine.model.vo.Tag;
import com.kh.manage.timeLine.model.vo.TimeLine;

public interface TimeLineService {

	int insertTimeLine(TimeLine tm);

	int insertTimeAttachment(Attachment at);

	TimeLine selectOneTag(String string);

	int insertTag(String string);

	int insertTimeLineTag();

	int insertTagName(String tagNo);

	int insertTimeLineHart(TimeLine tl);

	int deleteHart(TimeLine tl);

	int insertHighComment(Comment comm);

	String selectOneTimeLineNo();

}
