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
	
	private RequestCache requestCache = new HttpSessionRequestCache();  // HttpSession�� ��û Cache ���� ����
	
	private String targetUrlParameter;	// Ÿ�� Url�� �Ķ���Ͱ�
	
	private String defaultUrl;	// �⺻ Url
	
	private boolean useReferer;  // getHeader("Referer") �� ����� ���ΰ�
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();  // �����̷�Ʈ ����
	
	
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
		
		logger.info(request.getRemoteAddr() + "���� " + auth.getName() + "�� �α��� ����->" + new Date());
		
		if(requestCache.getRequest(request, response) != null) 
			response.sendRedirect(requestCache.getRequest(request, response).getRedirectUrl());
		else	// login���� �ٷ� �����ϴ� ���
			response.sendRedirect(defaultUrl); // �⺻ Url�� 			
	}
	
	private void clearAttributeSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session != null) { // �α��� �����ϱ� ���� ���ǿ� ������ ���� ���
			if(session.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION) != null) // ���ǿ� �α��� ���� ������ ���� ��� �����Ѵ�.
				session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
		
	}

}
