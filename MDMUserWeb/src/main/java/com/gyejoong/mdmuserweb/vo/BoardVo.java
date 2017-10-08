package com.gyejoong.mdmuserweb.vo;

import java.sql.Timestamp;

public class BoardVo {
	private int idcontrol_board;
	private int User_info_employee_num;
	private String title;
	private String contents;
	private short admit;
	private Timestamp Date;
	
	public int getIdcontrol_board() {
		return idcontrol_board;
	}
	public void setIdcontrol_board(int idcontrol_board) {
		this.idcontrol_board = idcontrol_board;
	}
	public int getUser_info_employee_num() {
		return User_info_employee_num;
	}
	public void setUser_info_employee_num(int user_info_employee_num) {
		User_info_employee_num = user_info_employee_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public short getAdmit() {
		return admit;
	}
	public void setAdmit(short admit) {
		this.admit = admit;
	}
	public Timestamp getDate() {
		return Date;
	}
	public void setDate(Timestamp date) {
		Date = date;
	}
}
