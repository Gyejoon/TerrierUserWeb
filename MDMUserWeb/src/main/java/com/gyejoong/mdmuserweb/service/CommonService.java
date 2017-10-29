package com.gyejoong.mdmuserweb.service;

import java.util.List;
import java.util.Map;

import com.gyejoong.mdmuserweb.vo.BoardFileVo;
import com.gyejoong.mdmuserweb.vo.BoardVo;

public interface CommonService {
	public Map<String, Object> selectFileInfo(BoardFileVo boardFile) throws Exception;
}
