package com.gyejoong.mdmuserweb;



import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.gyejoong.mdmuserweb.dao.IDao;
import com.gyejoong.mdmuserweb.dao.location_info;
import com.gyejoong.mdmuserweb.gps.GpsToAddress;
import com.gyejoong.mdmuserweb.vo.BoardVo;
import com.gyejoong.mdmuserweb.vo.OtpVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/cloud", method = RequestMethod.GET)
	public String cloud(HttpServletRequest request, Model model){
		logger.info(request.getRemoteAddr() + "가 /cloud 경로로 접속함->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("profile", dao.Profile(username));
		
		return "cloud";
	}
	
	@RequestMapping(value = "/otp", method = RequestMethod.GET)
	public String otp(HttpServletRequest request, Model model){
		logger.info(request.getRemoteAddr() + "가 /otp 경로로 접속함 ->" + new Date());
		
		
		String username = request.getSession().getAttribute("username").toString();
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		try{
			// Post로 OTP서버에 OTP정보 요청
			CloseableHttpClient httpClient = HttpClients.createDefault();
			HttpPost httpPost = new HttpPost("http://58.141.234.126:55406/otpadd");
			
			// 파라미터는 employee_num, Name
			List<NameValuePair> list = new ArrayList<NameValuePair>();
			list.add(new BasicNameValuePair("employee_num", username));
			list.add(new BasicNameValuePair("Name", dao.Profile(username).getName()));
			
			httpPost.setEntity(new UrlEncodedFormEntity(list, "UTF-8"));
			CloseableHttpResponse httpResponse = httpClient.execute(httpPost);
			try{
				// 응답 결과를 받음
				HttpEntity entity = httpResponse.getEntity();
				// 응답 결과가 JSON이므로 JSON을 HashMap 객체로 파싱
				ObjectMapper mapper = new ObjectMapper();
				HashMap<String, Object> map = mapper.readValue(EntityUtils.toString(entity), HashMap.class);
				
				// View에 보여주기 위하여 Vo객체에 map결과를 주입
				OtpVo otpvo = new OtpVo();
				otpvo.setQR_CODE(map.get("QR_CODE").toString());
				otpvo.setCR_CODE(map.get("CR_CODE").toString());
				
				// Vo 객체를 뷰 속성에 추가
				model.addAttribute("profile", dao.Profile(username));
				model.addAttribute("otpinfo", otpvo);
			
				EntityUtils.consume(entity);
			} finally {
				httpResponse.close();
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		
		return "otp";
	}
	
	@RequestMapping(value = "/lost", method = RequestMethod.GET)
	public String lost(HttpServletRequest request, Model model){
		logger.info(request.getRemoteAddr() + "가 /lost 경로로 접속함->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		IDao dao = sqlSession.getMapper(IDao.class);
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
		
		model.addAttribute("profile", dao.Profile(username));
		model.addAttribute("location", location.loc_info(username));
		
		return "lost";
	}
	
	@RequestMapping(value = "/control", method = RequestMethod.GET)
	public String control(HttpServletRequest request, Model model){
		logger.info(request.getRemoteAddr() + "가 /control 경로로 접속함->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("profile", dao.Profile(username));
		model.addAttribute("list", dao.BoardList(username));
		model.addAttribute("count", dao.BoardCount(username));
		
		return "control";
	}
	
	@RequestMapping(value = "/config", method = RequestMethod.GET)
	public String config(HttpServletRequest request, Model model){
		logger.info(request.getRemoteAddr() + "가 /config 경로로 접속함->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("profile", dao.Profile(username));
		
		return "config";
	}
	
}
