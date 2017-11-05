package com.gyejoong.mdmuserweb.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyejoong.mdmuserweb.dao.CommonDao;
import com.gyejoong.mdmuserweb.dao.IDao;
import com.gyejoong.mdmuserweb.vo.BoardFileVo;
import com.gyejoong.mdmuserweb.vo.UserVo;

@Service("commonService")
public class CommonServiceImpl implements CommonService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public Map<String, Object> selectFileInfo(BoardFileVo board) throws Exception {
		return sqlSession.getMapper(CommonDao.class).selectFileInfo(board);
	}

	@Override
	public List<Map<String, Object>> selectPhoneInfo(String username) throws Exception {
		return sqlSession.getMapper(CommonDao.class).selectPhoneInfo(username);
	}

	@Override
	public UserVo Profile(String username) throws Exception {
		return sqlSession.getMapper(IDao.class).Profile(username);
	}
	
}
