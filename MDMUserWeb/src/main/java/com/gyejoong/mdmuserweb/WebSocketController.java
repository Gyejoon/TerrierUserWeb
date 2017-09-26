package com.gyejoong.mdmuserweb;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gyejoong.mdmuserweb.gps.LocationParse;
import com.gyejoong.mdmuserweb.websocket.locationWebSocketHandler;

@RestController
public class WebSocketController {
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);
	
	@Autowired
	locationWebSocketHandler locationWebSocket;
	
	@RequestMapping(value = "/send/location", method = RequestMethod.POST)
	public String locationSend(HttpServletRequest request) throws Exception{
		String json = new String();
		String buf;
		
		while((buf = request.getReader().readLine()) != null) json += buf;
		
		LocationParse parse = new LocationParse(json);
		String location = parse.getLocation();
		String username = parse.getEmployeeNum();
		
		locationWebSocket.sendLocationinfo(location, username);
		
		return "Success";
	}
}
