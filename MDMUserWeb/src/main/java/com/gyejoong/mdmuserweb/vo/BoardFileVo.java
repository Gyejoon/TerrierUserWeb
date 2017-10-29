package com.gyejoong.mdmuserweb.vo;

public class BoardFileVo {
	private int idcontrol_board_file;
	private int control_board_idcontrol_board;
	private String original_file_name;
	private String stored_file_name;
	private int file_size;
	private String del_gb;
	
	public int getIdcontrol_board_file() {
		return idcontrol_board_file;
	}
	public void setIdcontrol_board_file(int idcontrol_board_file) {
		this.idcontrol_board_file = idcontrol_board_file;
	}
	public int getControl_board_idcontrol_board() {
		return control_board_idcontrol_board;
	}
	public void setControl_board_idcontrol_board(int control_board_idcontrol_board) {
		this.control_board_idcontrol_board = control_board_idcontrol_board;
	}
	public String getOriginal_file_name() {
		return original_file_name;
	}
	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public String getDel_gb() {
		return del_gb;
	}
	public void setDel_gb(String del_gb) {
		this.del_gb = del_gb;
	}

}
