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
			gps = new GpsToAddress(Float.parseFloat(json.get("Latitude").toString()),
					Float.parseFloat(json.get("Longitude").toString()));
		} catch (Exception e) { // 위,경도 주소를 찾을 수 없는 경우
			return json.get("Latitude").toString() + ":" + json.get("Longitude").toString()
				+ ":" + "주소가 없습니다.";
		}
		return json.get("Latitude").toString() + ":" + json.get("Longitude").toString()
			+ ":" + gps.getAddress();
	}
	
	public String getEmployeeNum(){
		JSONObject json = (JSONObject)JSONValue.parse(Jsonlocation);
		return json.get("employee_num").toString();
	}
	
}
