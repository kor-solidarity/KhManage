package com.kh.manage.infoBoard.model.service;

import java.util.List;

import com.kh.manage.common.PageInfo;
import com.kh.manage.forum.model.vo.Reply;
import com.kh.manage.infoBoard.model.vo.InfoBoard;

public interface InfoBoardService {

	int insertBoard(InfoBoard ib);

	int boardListCount();

	List<InfoBoard> boardSelectAll(PageInfo pi);

	InfoBoard selectOneBoard(InfoBoard ib);


	
	
	

}
