package com.gyejoong.mdmuserweb;

import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gyejoong.mdmuserweb.service.CommonService;
import com.gyejoong.mdmuserweb.vo.BoardFileVo;

@Controller
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@RequestMapping(value="/common/downloadFile")
	public void downloadFile(HttpServletRequest request, HttpServletResponse response, BoardFileVo boardFile) throws Exception{
		log.info(request.getRemoteAddr() + "가 /control/downloadFile 파일다운로드 시도->" + new Date());
		Map<String, Object> map = commonService.selectFileInfo(boardFile);
		String storedFileName = (String)map.get("stored_file_name");
		String originalFileName = (String)map.get("original_file_name");
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\dev\\file\\" + storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	@RequestMapping(value="/common/downloadPhone")
	public String downloadPhone(Map<String, Object> ModelMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		log.info(request.getRemoteAddr() + "가 /control/downloadPhone 연락처 다운로드 시도->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		response.setHeader("Content-Disposition", "attachment; fileName=" + username + ".xlsx");
		
		List<Map<String, Object>> excelList = commonService.selectPhoneInfo(username);
		
		ModelMap.put("excelList", excelList);
		
		return "excelView";
	}
	
	@RequestMapping(value="/common/downloadImg")
	public void downloadImg(HttpServletRequest request, HttpServletResponse response) throws Exception{
		log.info(request.getRemoteAddr() + "가 /control/downloadImg 이미지 다운로드 시도->" + new Date());
		
		String username = request.getSession().getAttribute("username").toString();
		
		try{
			// Post로 다운로드서버에 OTP정보 요청
			CloseableHttpClient httpClient = HttpClients.createDefault();
			HttpPost httpPost = new HttpPost("http://58.141.234.126:50029/zip_download");
			
			// 파라미터는 employee_num, Name
			List<NameValuePair> list = new ArrayList<NameValuePair>();
			list.add(new BasicNameValuePair("emp", username));
			
			httpPost.setEntity(new UrlEncodedFormEntity(list, "UTF-8"));
			CloseableHttpResponse httpResponse = httpClient.execute(httpPost);
			try{
				// 응답 결과를 받음
				HttpEntity entity = httpResponse.getEntity();
				byte fileByte[] = EntityUtils.toByteArray(entity);
				
				response.setContentType("application/octet-stream");
				response.setContentLength(fileByte.length);
				response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(username, "UTF-8")+".zip\";");
				response.setHeader("Content-Transfer-Encoding", "binary");
				
				response.getOutputStream().write(fileByte);
				response.getOutputStream().flush();
				response.getOutputStream().close();
				
				EntityUtils.consume(entity);
			} finally {
				httpResponse.close();
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		
	}
}
