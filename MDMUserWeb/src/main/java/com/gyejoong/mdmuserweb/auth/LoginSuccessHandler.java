package com.gyejoong.mdmuserweb.auth;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;


public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	private RequestCache requestCache = new HttpSessionRequestCache();  // HttpSession의 요청 Cache 값을 저장
	
	private String targetUrlParameter;	// 타겟 Url의 파라미터값
	
	private String defaultUrl;	// 기본 Url
	
	private boolean useReferer;  // getHeader("Referer") 를 사용할 것인가
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();  // 리다이렉트 상태
	
	
	public String getTargetUrlParameter() {
		return targetUrlParameter;
	}

	public void setTargetUrlParameter(String targetUrlParameter) {
		this.targetUrlParameter = targetUrlParameter;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	public boolean isUseReferer() {
		return useReferer;
	}

	public void setUseReferer(boolean useReferer) {
		this.useReferer = useReferer;
	}
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
		clearAttributeSession(request);
		
		request.getSession().setAttribute("username", auth.getName());
		
		logger.info(request.getRemoteAddr() + "에서 " + auth.getName() + "가 로그인 성공->" + new Date());
		
		if(requestCache.getRequest(request, response) != null) 
			response.sendRedirect(requestCache.getRequest(request, response).getRedirectUrl());
		else	// login으로 바로 접근하는 경우
			response.sendRedirect(defaultUrl); // 기본 Url로 			
	}
	
	private void clearAttributeSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session != null) { // 로그인 성공하기 직전 세션에 정보가 있을 경우
			if(session.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION) != null) // 세션에 로그인 실패 정보가 있을 경우 삭제한다.
				session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
		
	}

}
