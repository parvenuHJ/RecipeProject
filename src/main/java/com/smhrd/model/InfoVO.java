package com.smhrd.model;

public class InfoVO {
	
	
	
	private String info_code;
	private String info_name;
	private String info_th;
	private String info_url;
	
	public InfoVO(String info_code, String info_name, String info_th, String info_url) {
		super();
		this.info_code = info_code;
		this.info_name = info_name;
		this.info_th = info_th;
		this.info_url = info_url;
	}

	public String getInfo_code() {
		return info_code;
	}

	public void setInfo_code(String info_code) {
		this.info_code = info_code;
	}

	public String getInfo_name() {
		return info_name;
	}

	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}

	public String getInfo_th() {
		return info_th;
	}

	public void setInfo_th(String info_th) {
		this.info_th = info_th;
	}

	public String getInfo_url() {
		return info_url;
	}

	public void setInfo_url(String info_url) {
		this.info_url = info_url;
	}
	
	
	
	

}
