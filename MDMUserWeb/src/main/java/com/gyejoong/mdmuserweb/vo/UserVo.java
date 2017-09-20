package com.gyejoong.mdmuserweb.vo;

public class UserVo {
	private String employee_num;
	private String Name;
	private String Rank;
	private String Department;
	private String Date_of_birth;
	private String Address;
	private String created_at;
	private String OTP;

	public String getEmployee_num() {
		return employee_num;
	}
	public void setEmployee_num(String employee_num) {
		this.employee_num = employee_num;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getRank() {
		return Rank;
	}
	public void setRank(String rank) {
		Rank = rank;
	}
	public String getDepartment() {
		return Department;
	}
	public void setDepartment(String department) {
		Department = department;
	}
	public String getDate_of_birth() {
		return Date_of_birth;
	}
	public void setDate_of_birth(String date_of_birth) {
		Date_of_birth = date_of_birth;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getOTP() {
		return OTP;
	}
	public void setOTP(String OTP) {
		this.OTP = OTP;
	}
	
}
