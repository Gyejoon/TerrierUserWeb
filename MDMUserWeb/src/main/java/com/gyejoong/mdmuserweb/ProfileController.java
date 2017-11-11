package com.gyejoong.mdmuserweb;



import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gyejoong.mdmuserweb.dao.IDao;
import com.gyejoong.mdmuserweb.dao.location_info;
import com.gyejoong.mdmuserweb.gps.GpsToAddress;
import com.gyejoong.mdmuserweb.service.BoardService;
import com.gyejoong.mdmuserweb.service.CommonService;
import com.gyejoong.mdmuserweb.vo.BoardVo;
import com.gyejoong.mdmuserweb.vo.NoticeVo;
import com.gyejoong.mdmuserweb.vo.OtpVo;
import com.gyejoong.mdmuserweb.vo.UserVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@Resource(name="BoardService")
	private BoardService boardService;
	
	@RequestMapping(value = "/otp", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> otp(HttpServletRequest request) throws Exception{
		logger.info(request.getRemoteAddr() + "가 /otp 경로로 접속함 ->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		UserVo userVo = commonService.Profile(username);
		// Post로 OTP서버에 OTP정보 요청
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost("http://58.141.234.126:55406/otpadd");
		
		// 파라미터는 employee_num, Name
		List<NameValuePair> list = new ArrayList<NameValuePair>();
		list.add(new BasicNameValuePair("employee_num", username));
		list.add(new BasicNameValuePair("Name", userVo.getName()));
		
		httpPost.setEntity(new UrlEncodedFormEntity(list, "UTF-8"));
		CloseableHttpResponse httpResponse = httpClient.execute(httpPost);
		// 응답 결과를 받음
		HttpEntity entity = httpResponse.getEntity();
		// 응답 결과가 JSON이므로 JSON을 HashMap 객체로 파싱
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> map = mapper.readValue(EntityUtils.toString(entity), HashMap.class);
		
		EntityUtils.consume(entity);
			
		httpResponse.close();
		
		return map;
	}
	
	@RequestMapping(value = "/lost", method = RequestMethod.GET)
	public String lost(HttpServletRequest request, Model model) throws Exception{
		logger.info(request.getRemoteAddr() + "가 /lost 경로로 접속함->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
	
		location_info location = sqlSession.getMapper(location_info.class);
		GpsToAddress gps = null;
		
			try {
				gps = new GpsToAddress(Float.parseFloat(location.loc_info(username).getLatitude()),
						Float.parseFloat(location.loc_info(username).getLongitude()));
				
				model.addAttribute("address", gps.getAddress());
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (Exception e) {
				model.addAttribute("address", "주소가 없습니다.");
			}
		
		model.addAttribute("profile", commonService.Profile(username));
		model.addAttribute("location", location.loc_info(username));
		
		return "lost";
	}
	
	@RequestMapping(value = "/control", method = RequestMethod.GET)
	public String control(HttpServletRequest request, Model model) throws Exception{
		logger.info(request.getRemoteAddr() + "가 /control 경로로 접속함->" + new Date());
		
		int pageSize = 10;
		int pageGroupSize = 5;
		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null){ // 메뉴에서 제어요청 페이지를 선택한 경우
			pageNum = "1";
		}
		
		ArrayList<BoardVo> articleList = new ArrayList<BoardVo>();
		String username = request.getSession().getAttribute("username").toString();
		IDao dao = sqlSession.getMapper(IDao.class);
		int count = dao.BoardCount(username);
		
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지
		int startRow = count - (currentPage * pageSize) + 1; 
		int endRow = count - ((currentPage-1)*pageSize);
		
		if(count > 0){ // 게시물 총 갯수
			if(endRow > count)
				endRow = count;
			articleList = dao.BoardList(username, startRow, endRow); // 현재 페이지에 해당하는 글 목록 리스트
			if(articleList.isEmpty())	// pageNum에 해당하는 글이 없는 경우
				return "redirect:/control";
		} else {
			articleList = null; // 게시물이 없는 경우
		}
		
		// 페이지 그룹의 갯수
		int pageGroupCount = count/(pageSize*pageGroupSize)+(count%(pageSize*pageGroupSize) == 0 ? 0 : 1);
		// 페이지 그룹 번호
		int numPageGroup = (int)Math.ceil((double)currentPage/pageGroupSize);
		
		// 기본
		model.addAttribute("profile", dao.Profile(username));
		
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("count", new Integer(count));
		
		model.addAttribute("pageGroupSize", new Integer(pageGroupSize));
		model.addAttribute("numPageGroup", new Integer(numPageGroup));
		model.addAttribute("pageGroupCount", new Integer(pageGroupCount));
		model.addAttribute("list", articleList);
		
		return "control";
	}
	
	@RequestMapping(value="/notice")
	public String notice(HttpServletRequest request, Model model) throws Exception{
		logger.info(request.getRemoteAddr() + "가 /notice 경로로 접속함->" + new Date());
		
		int pageSize = 10;
		int pageGroupSize = 5;
		
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null){ // 메뉴에서 제어요청 페이지를 선택한 경우
			pageNum = "1";
		}
		
		ArrayList<NoticeVo> noticeList = null;
		String username = request.getSession().getAttribute("username").toString();
		int count = boardService.NoticeCount();
		
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지
		int startRow = count - (currentPage * pageSize) + 1; 
		int endRow = count - ((currentPage-1)*pageSize);
		
		if(count > 0){ // 게시물 총 갯수
			if(endRow > count)
				endRow = count;
			noticeList = boardService.NoticeList(startRow, endRow); // 현재 페이지에 해당하는 글 목록 리스트
			if(noticeList.isEmpty())	// pageNum에 해당하는 글이 없는 경우
				return "redirect:/notice";
		} else {
			noticeList = null; // 게시물이 없는 경우
		}
		
		// 페이지 그룹의 갯수
		int pageGroupCount = count/(pageSize*pageGroupSize)+(count%(pageSize*pageGroupSize) == 0 ? 0 : 1);
		// 페이지 그룹 번호
		int numPageGroup = (int)Math.ceil((double)currentPage/pageGroupSize);
		
		// 기본
		model.addAttribute("profile", commonService.Profile(username));
		
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("count", new Integer(count));
		
		model.addAttribute("pageGroupSize", new Integer(pageGroupSize));
		model.addAttribute("numPageGroup", new Integer(numPageGroup));
		model.addAttribute("pageGroupCount", new Integer(pageGroupCount));
		model.addAttribute("list", noticeList);
		
		
		return "notice";
	}
	
	@RequestMapping(value="/request/lost", method = RequestMethod.POST)
	public String requestlost(HttpServletRequest request) throws Exception{
		logger.info(request.getRemoteAddr() + "가 분실 신고 요청->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		commonService.ReportLost(username, "분실신고", request.getParameter("contents"));
		
		return "redirect:/lost";
	}
	
	
}
