package com.gyejoong.mdmuserweb.dao;

import java.util.List;
import java.util.Map;

import com.gyejoong.mdmuserweb.vo.ApplicationVo;
import com.gyejoong.mdmuserweb.vo.BoardFileVo;
import com.gyejoong.mdmuserweb.vo.ManagementVo;

public interface CommonDao {
	
	public Map<String, Object> selectFileInfo(BoardFileVo board) throws Exception;
	public List<Map<String, Object>> selectPhoneInfo(String username) throws Exception;
	public List<ApplicationVo> ApplicationList(String username) throws Exception;
	public ManagementVo Management(String username) throws Exception;
}