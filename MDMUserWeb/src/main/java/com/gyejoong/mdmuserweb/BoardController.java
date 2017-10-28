package com.gyejoong.mdmuserweb;

import java.util.ArrayList;
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
import com.gyejoong.mdmuserweb.vo.BoardVo;

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
		BoardVo board = dao.BoardView(request.getParameter("id"));
		
		if(board != null){
			// 보려는 게시글의 소유자가 현재 로그인한 사용자인지 확인
			if(username.equals(Integer.toString(board.getUser_info_employee_num()))){
				
				model.addAttribute("profile", dao.Profile(username));
				model.addAttribute("view", board);
				
				return "/control/view";
			} else {
				return "redirect:/control";
			}
		}else {
			return "redirect:/control";
		}
	}
	
	@RequestMapping(value = "/control/delete", method=RequestMethod.GET)
	public String delete(HttpServletRequest request){
		logger.info(request.getRemoteAddr() + "가 " + request.getParameter("id")
		+ "번 게시물 삭제 ->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		IDao dao = sqlSession.getMapper(IDao.class);
		BoardVo board = dao.BoardView(request.getParameter("id"));
		
		if(board != null){
			if(username.equals(Integer.toString(board.getUser_info_employee_num())))
				dao.BoardDelete(username, request.getParameter("id"));			
		}
		
		return "redirect:/control";
	}
	
	@RequestMapping(value = "/control/update", method=RequestMethod.GET)
	public String update(HttpServletRequest request, Model model){
		logger.info(request.getRemoteAddr() + "가 " + request.getParameter("id")
		+ "번 게시물 수정페이지 접속 ->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		IDao dao = sqlSession.getMapper(IDao.class);
		BoardVo board = dao.BoardView(request.getParameter("id"));
		
		if(board != null){ // 매개변수로 받은 id값이 테이블에 존재할 경우
			if(username.equals(Integer.toString(board.getUser_info_employee_num()))){
				model.addAttribute("profile", dao.Profile(username));
				model.addAttribute("view", dao.BoardView(request.getParameter("id")));		
				return "/control/update";
			} else {
				return "redirect:/control";
			}
		} else { // 매개변수로 받은 id값이 테이블에 존재하지 않을 경우 리다이렉트.
			return "redirect:/control";
		}
	}
	
	@RequestMapping(value = "/control/update", method=RequestMethod.POST)
	public String updateview(HttpServletRequest request){
		logger.info(request.getRemoteAddr() + "가 " + request.getParameter("id")
		+ "번 게시물 수정 ->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.BoardUpdate(username, request.getParameter("id"), 
				request.getParameter("title"), request.getParameter("contents"));
		
		return "redirect:/control";
	}
	
	@RequestMapping(value = "/control/search", method=RequestMethod.GET)
	public String boardsearch(HttpServletRequest request, Model model){
		logger.info(request.getRemoteAddr() + "가 " + "게시물 검색 ->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		String pageNum = request.getParameter("pageNum");
		String title = request.getParameter("search_tit");
		String contents = request.getParameter("search_con");
		String date = request.getParameter("search_dat");
		
		if(pageNum == null)
			pageNum = "1";
		if(title == null)
			title = "";
		if(contents == null)
			contents = "";
		if(date == null)
			date = "";
		
		ArrayList<BoardVo> searchList = new ArrayList<BoardVo>();
		IDao dao = sqlSession.getMapper(IDao.class);
		
		// 페이징
		int pageSize = 10;
		int pageGroupSize = 5;
		
		int currentPage = Integer.parseInt(pageNum);
		int count = 0;
		int startRow = 0;
		int endRow = 0;
		
		if(!title.equals("") && !contents.equals("") && !date.equals("")){ // 세가지의 조건으로 검색
			count = dao.BoardAllSearchCount(username, title+"%", "%"+contents+"%", date+"%");
			
			startRow = count - (currentPage * pageSize) + 1;
			endRow = count - ((currentPage-1) * pageSize);
			
			if(count > 0){
				if(endRow > count)
					endRow = count;
				searchList = dao.BoardAllSearchList(username, title+"%", "%"+contents+"%", date+"%", startRow, endRow);
			} else {
				searchList = null;
			}
		} else if(!title.equals("") && !contents.equals("")) { // title and contents 조건으로 검색
			count = dao.BoardTitleandContentsSearchCount(username, title+"%", "%"+contents+"%");
			
			startRow = count - (currentPage * pageSize) + 1;
			endRow = count - ((currentPage-1) * pageSize);
			
			if(count > 0){
				if(endRow > count)
					endRow = count;
				searchList = dao.BoardTitleandContentsSearchList(username, title+"%", "%"+contents+"%", startRow, endRow);
			} else {
				searchList = null;
			}
		} else if(!title.equals("") && !date.equals("")) { // title and date 조건으로 검색
			count = dao.BoardTitleandDateSearchCount(username, title, date+"%");
			
			startRow = count - (currentPage * pageSize) + 1;
			endRow = count - ((currentPage-1) * pageSize);
			
			if(count > 0){
				if(endRow > count)
					endRow = count;
				searchList = dao.BoardTitleandDateSearchList(username, title, date+"%", startRow, endRow);
			} else {
				searchList = null;
			}
		} else if(!contents.equals("") && !date.equals("")){ // contents and date 조건으로 검색
			count = dao.BoardContentsandDateSearchCount(username, "%"+contents+"%", date+"%");
			
			startRow = count - (currentPage * pageSize) + 1;
			endRow = count - ((currentPage-1) * pageSize);
			
			if(count > 0){
				if(endRow > count)
					endRow = count;
				searchList = dao.BoardContentsandDateSearchList(username, "%"+contents+"%", date+"%", startRow, endRow);
			} else {
				searchList = null;
			}
		} else if(!title.equals("")){ // title 단일 조건 검색
			count = dao.BoardTitleSearchCount(username, title);
			
			startRow = count - (currentPage * pageSize) + 1;
			endRow = count - ((currentPage-1) * pageSize);
			
			if(count > 0){
				if(endRow > count)
					endRow = count;
				searchList = dao.BoardTitleSearchList(username, title, startRow, endRow);
			} else {
				searchList = null;
			}
			
		} else if(!contents.equals("")){ // contents 단일 조건 검색
			count = dao.BoardContentsSearchCount(username, "%" + contents + "%");
			
			startRow = count - (currentPage * pageSize) + 1;
			endRow = count - ((currentPage-1) * pageSize);
			
			if(count > 0){
				if(endRow > count)
					endRow = count;
				searchList = dao.BoardContentsSearchList(username, "%" + contents + "%", startRow, endRow);
			} else {
				searchList = null;
			}
		} else if(!date.equals("")){ // date 단일 조건 검색
			count = dao.BoardDateSearchCount(username, date+"%");
			
			startRow = count - (currentPage * pageSize) + 1;
			endRow = count - ((currentPage-1) * pageSize);
			
			if(count > 0){
				if(endRow > count)
					endRow = count;
				searchList = dao.BoardDateSearchList(username, date+"%", startRow, endRow);
			} else {
				searchList = null;
			}
		}
		
		// 페이지 그룹의 갯수
		int pageGroupCount = count/(pageSize*pageGroupSize)+(count%(pageSize*pageGroupSize) == 0 ? 0 : 1);
		// 페이지 그룹 번호
		int numPageGroup = (int)Math.ceil((double)currentPage/pageGroupSize);
		
		model.addAttribute("profile", dao.Profile(username));
		
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("count", new Integer(count));
		
		model.addAttribute("pageGroupSize", new Integer(pageGroupSize));
		model.addAttribute("numPageGroup", new Integer(numPageGroup));
		model.addAttribute("pageGroupCount", new Integer(pageGroupCount));
		model.addAttribute("list", searchList);
		
		return "control";
	}
}