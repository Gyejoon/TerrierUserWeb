package com.gyejoong.mdmuserweb.dao;

import java.util.ArrayList;
import java.util.Map;

import com.gyejoong.mdmuserweb.vo.BoardFileVo;
import com.gyejoong.mdmuserweb.vo.BoardVo;
import com.gyejoong.mdmuserweb.vo.UserVo;

public interface IDao {
	
	public UserVo Profile(String username);
	public ArrayList<BoardVo> BoardList(String username, int startRow, int endRow);
	public ArrayList<BoardVo> BoardTitleSearchList(String username, String title, int startRow, int endRow);
	public ArrayList<BoardVo> BoardContentsSearchList(String username, String contents, int startRow, int endRow);
	public ArrayList<BoardVo> BoardDateSearchList(String username, String date, int startRow, int endRow);
	public ArrayList<BoardVo> BoardTitleandContentsSearchList(String username, String title, String contents, int startRow, int endRow);
	public ArrayList<BoardVo> BoardTitleandDateSearchList(String username, String title, String date,  int startRow, int endRow);
	public ArrayList<BoardVo> BoardContentsandDateSearchList(String username, String contents, String date, int startRow, int endRow);
	public ArrayList<BoardVo> BoardAllSearchList(String username, String title, String contents, String date, int startRow, int endRow);
	public int BoardCount(String username);
	public int BoardTitleSearchCount(String username, String title);
	public int BoardContentsSearchCount(String username, String contents);
	public int BoardDateSearchCount(String username, String date);
	public int BoardTitleandContentsSearchCount(String username, String title, String contents);
	public int BoardTitleandDateSearchCount(String username, String title, String date);
	public int BoardContentsandDateSearchCount(String username, String contents, String date);
	public int BoardAllSearchCount(String username, String title, String contents, String date);
	public void BoardWrite(BoardVo board);
	public void BoardFileInsert(Map<String, Object> map);
	public void BoardDelete(String username, String id);
	public void BoardUpdate(String username, String id, String title, String contents);
	public BoardVo BoardView(String id);
	public BoardFileVo BoardFileView(String id);
}
