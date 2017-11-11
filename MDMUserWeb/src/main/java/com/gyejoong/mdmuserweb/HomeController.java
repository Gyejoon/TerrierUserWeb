package com.gyejoong.mdmuserweb;

import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
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
import com.gyejoong.mdmuserweb.service.CommonService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		logger.info(request.getRemoteAddr() + "가 / 경로로 접속함->" + new Date());
		
		return "redirect:profile";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request){
		logger.info(request.getRemoteAddr() + "가 /login 경로로 접속함->" + new Date());
		return "security/login";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(HttpServletRequest request, Model model) throws Exception{
		logger.info(request.getRemoteAddr() + "가 /profile 경로로 접속함->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		model.addAttribute("profile", commonService.Profile(username));
		model.addAttribute("applist", commonService.ApplicationList(username));
		model.addAttribute("manage", commonService.Management(username));
		model.addAttribute("ManageDate", commonService.DeviceMangeDate(username));
		
		return "profile";
	}

}