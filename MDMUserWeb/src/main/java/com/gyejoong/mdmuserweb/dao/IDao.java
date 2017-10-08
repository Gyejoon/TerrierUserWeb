package com.gyejoong.mdmuserweb.dao;

import java.util.ArrayList;

import com.gyejoong.mdmuserweb.vo.BoardVo;
import com.gyejoong.mdmuserweb.vo.UserVo;

public interface IDao {
	
	public UserVo Profile(String username);
	public ArrayList<BoardVo> BoardList(String username);
	public int BoardCount(String username);
	public void BoardWrite(String username, String title, String contents);
	public BoardVo BoardView(String id);
}
