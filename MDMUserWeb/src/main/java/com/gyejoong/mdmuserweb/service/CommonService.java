package com.gyejoong.mdmuserweb.service;

import java.util.List;
import java.util.Map;

import com.gyejoong.mdmuserweb.vo.BoardFileVo;
import com.gyejoong.mdmuserweb.vo.BoardVo;
import com.gyejoong.mdmuserweb.vo.UserVo;

public interface CommonService {
	public Map<String, Object> selectFileInfo(BoardFileVo boardFile) throws Exception;
	public List<Map<String, Object>> selectPhoneInfo(String username) throws Exception;
	public UserVo Profile(String username) throws Exception;
}
