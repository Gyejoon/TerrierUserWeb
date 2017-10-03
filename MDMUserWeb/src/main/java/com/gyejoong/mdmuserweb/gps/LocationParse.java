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
		} catch (Exception e) { // ��,�浵 �ּҸ� ã�� �� ���� ���
			return json.get("Latitude").toString() + ":" + json.get("Longitude").toString()
				+ ":" + "�ּҰ� �����ϴ�.";
		}
		return json.get("Latitude").toString() + ":" + json.get("Longitude").toString()
			+ ":" + gps.getAddress();
	}
	
	public String getEmployeeNum(){
		JSONObject json = (JSONObject)JSONValue.parse(Jsonlocation);
		return json.get("employee_num").toString();
	}
	
}
