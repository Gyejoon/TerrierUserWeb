package com.gyejoong.mdmuserweb.vo;

import java.sql.Timestamp;

public class BoardVo {
	private int rn;
	private int idcontrol_board;
	private int User_info_employee_num;
	private String title;
	private String contents;
	private short admit;
	private String file_exist;
	private Timestamp regist_date;
	private Timestamp grant_date;

	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
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
	public Timestamp getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Timestamp regist_date) {
		this.regist_date = regist_date;
	}
	public Timestamp getGrant_date() {
		return grant_date;
	}
	public void setGrant_date(Timestamp grant_date) {
		this.grant_date = grant_date;
	}
	public String getFile_exist() {
		return file_exist;
	}
	public void setFile_exist(String file_exist) {
		this.file_exist = file_exist;
	}
}
