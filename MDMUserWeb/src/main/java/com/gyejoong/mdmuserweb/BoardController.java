package com.gyejoong.mdmuserweb;

import java.io.UnsupportedEncodingException;
import java.util.Date;

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

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/control/write", method = RequestMethod.GET)
	public String write(HttpServletRequest request, Model model) {
		logger.info(request.getRemoteAddr() + "가 /control/write 경로로 접속함->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("profile", dao.Profile(username));
		
		return "/control/write";
	}
	
	@RequestMapping(value="/control/write", method=RequestMethod.POST)
	public String post(HttpServletRequest request) {
		logger.info(request.getRemoteAddr() + "가 글작성 ->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.BoardWrite(username, request.getParameter("title"), request.getParameter("contents"));
		
		return "redirect:/control";
	}
	
	@RequestMapping(value="/control/view", method=RequestMethod.GET)
	public String view(HttpServletRequest request, Model model) {
		logger.info(request.getRemoteAddr() + "가 " + request.getParameter("id")
				+ "번 게시물 열람 ->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("profile", dao.Profile(username));
		model.addAttribute("view", dao.BoardView(request.getParameter("id")));
		
		return "/control/view";
	}
}
