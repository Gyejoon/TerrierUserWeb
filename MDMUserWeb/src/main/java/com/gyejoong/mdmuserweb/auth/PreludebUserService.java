package com.gyejoong.mdmuserweb.auth;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


public class PreludebUserService implements UserDetailsService{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Map<String, Object> user = sqlSession.selectOne("user.selectUser", username);
		
		if(user == null) throw new UsernameNotFoundException(username);
		
		PreludebUser entazUser = new PreludebUser();
		
		entazUser.setUsername(username);
		entazUser.setPassword(user.get("password").toString());
		
		return entazUser;
	}

}
