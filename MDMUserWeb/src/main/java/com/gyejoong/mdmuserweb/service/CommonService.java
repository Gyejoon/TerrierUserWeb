package com.gyejoong.mdmuserweb.service;

import java.util.List;
import java.util.Map;

import com.gyejoong.mdmuserweb.vo.ApplicationVo;
import com.gyejoong.mdmuserweb.vo.BoardFileVo;
import com.gyejoong.mdmuserweb.vo.ManagementVo;
import com.gyejoong.mdmuserweb.vo.UserVo;

public interface CommonService {
	public Map<String, Object> selectFileInfo(BoardFileVo boardFile) throws Exception;
	public List<Map<String, Object>> selectPhoneInfo(String username) throws Exception;
	public UserVo Profile(String username) throws Exception;
	public List<ApplicationVo> ApplicationList(String username) throws Exception;
	public ManagementVo Management(String username) throws Exception;
	public void ReportLost(String username, String type, String history) throws Exception;
	public Map<String, Object> DeviceMangeDate(String username) throws Exception;
}