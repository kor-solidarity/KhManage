package com.kh.manage.infoBoard.model.service;

import java.util.List;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.infoBoard.model.vo.BoReply;
import com.kh.manage.infoBoard.model.vo.InfoBoard;

public interface InfoBoardService {

	int insertBoard(InfoBoard ib, Attachment at);

	int boardListCount();

	List<InfoBoard> boardSelectAll(PageInfo pi);

	InfoBoard selectOneBoard(InfoBoard ib);

	int insertReply(BoReply rp);

	List<BoReply> selectAllReply(InfoBoard ib);

	int updateBoard(InfoBoard ib);

	int deleteBoard(String boardNo);

	
	


	
}
