package com.gyejoong.mdmuserweb.dao;

import com.gyejoong.mdmuserweb.vo.UserVo;

public interface IDao {
	
	public UserVo Profile(String username);
	
}
