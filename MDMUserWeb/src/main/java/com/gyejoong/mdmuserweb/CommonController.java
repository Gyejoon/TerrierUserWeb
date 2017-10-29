package com.gyejoong.mdmuserweb;

import java.io.File;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
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
}
