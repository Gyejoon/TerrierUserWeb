package com.gyejoong.mdmuserweb.gps;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.gyejoong.mdmuserweb.vo.LocationVo;

public class LocationParse {
	private String Jsonlocation;
	
	public LocationParse(String location){
		this.Jsonlocation = location;
	}
	
	public String getLocation(){
		JSONObject json = (JSONObject)JSONValue.parse(Jsonlocation);
		GpsToAddress gps = null;
		try {
			gps = new GpsToAddress(Float.parseFloat((String) json.get("Latitude")),
					Float.parseFloat((String) json.get("Longitude")));
		} catch (Exception e) { // 위,경도 주소를 찾을 수 없는 경우
			return (String)json.get("Latitude") + ":" + (String)json.get("Longitude")
				+ ":" + "주소가 없습니다.";
		}
		return (String)json.get("Latitude") + ":" + (String)json.get("Longitude")
			+ ":" + gps.getAddress();
	}
	
	public String getEmployeeNum(){
		JSONObject json = (JSONObject)JSONValue.parse(Jsonlocation);
		return (String)json.get("employee_num");
	}
	
}
