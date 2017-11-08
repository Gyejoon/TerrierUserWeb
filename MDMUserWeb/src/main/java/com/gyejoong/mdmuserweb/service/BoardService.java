package com.gyejoong.mdmuserweb.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.gyejoong.mdmuserweb.vo.BoardVo;
import com.gyejoong.mdmuserweb.vo.NoticeVo;

public interface BoardService {
	
	public void insertFileBoard(BoardVo board, HttpServletRequest request) throws Exception;
	public ArrayList<NoticeVo> NoticeList(int startRow, int endRow) throws Exception;
	public int NoticeCount() throws Exception;
	public NoticeVo NoticeBoardView(String id) throws Exception;
}
