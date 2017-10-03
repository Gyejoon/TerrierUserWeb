package com.gyejoong.mdmuserweb.auth;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AbstractAuthenticationTargetUrlRequestHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

public class LogoutSuccessHandlerimpl extends AbstractAuthenticationTargetUrlRequestHandler
			implements LogoutSuccessHandler{

	private static final Logger logger = LoggerFactory.getLogger(LogoutSuccessHandlerimpl.class);	
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		
		logger.info(request.getRemoteAddr() + "에서 " + authentication.getName() + "가 " + 
				"로그아웃함->" + new Date());
		
		super.handle(request, response, authentication);
	}

}
