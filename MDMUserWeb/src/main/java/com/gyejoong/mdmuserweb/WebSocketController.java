package com.gyejoong.mdmuserweb;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gyejoong.mdmuserweb.gps.GpsToAddress;
import com.gyejoong.mdmuserweb.websocket.locationWebSocketHandler;

@Controller
public class WebSocketController {
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);
	
	@Autowired
	locationWebSocketHandler locationWebSocket;
	
	@RequestMapping(value = "/send/location/web", method = RequestMethod.POST)
	@ResponseBody
	public String locationSend(HttpServletRequest request) throws Exception{
		String username = request.getParameter("employee_num");
		String Latitude = request.getParameter("Latitude");
		String Longitude = request.getParameter("Longitude");
		GpsToAddress gpsToaddress = new GpsToAddress(Float.parseFloat(Latitude), Float.parseFloat(Longitude));
		String location = Latitude + ":" + Longitude + ":" + gpsToaddress.getAddress();
		
		logger.info(location);
		
		locationWebSocket.sendLocationinfo(location, username);
		
		return "Success";
	}
}
