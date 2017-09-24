package com.gyejoong.mdmuserweb;

import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gyejoong.mdmuserweb.dao.IDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		logger.info(request.getRemoteAddr() + "�� / ��η� ������->" + new Date());
		
		return "redirect:profile";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request){
		logger.info(request.getRemoteAddr() + "�� /login ��η� ������->" + new Date());
		return "security/login";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(HttpServletRequest request, Model model){
		logger.info(request.getRemoteAddr() + "�� /profile ��η� ������->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("profile", dao.Profile(username));
		
		return "profile";
	}	

}