package com.gyejoong.mdmuserweb.dao;

import java.util.ArrayList;

import com.gyejoong.mdmuserweb.vo.NoticeVo;

public interface NoticeDao {
	public ArrayList<NoticeVo> NoticeList(int startRow, int endRow);
	public int NoticeCount();
	public NoticeVo NoticeBoardView(String id);
}
