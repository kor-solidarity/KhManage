package com.kh.manage.timeLine.model.service;

import com.kh.manage.common.Attachment;
import com.kh.manage.timeLine.model.vo.TimeLine;

public interface TimeLineService {

	int insertTimeLine(TimeLine tm);

	int insertTimeAttachment(Attachment at);
	
}
