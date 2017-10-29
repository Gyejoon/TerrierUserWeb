package com.gyejoong.mdmuserweb.service;

import javax.servlet.http.HttpServletRequest;

import com.gyejoong.mdmuserweb.vo.BoardVo;

public interface BoardService {
	
	public void insertFileBoard(BoardVo board, HttpServletRequest request) throws Exception;
}
