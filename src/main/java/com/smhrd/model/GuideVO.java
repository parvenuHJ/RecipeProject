package com.smhrd.model;

public class GuideVO {

	private String cho_code;
	private String cho_name;
	private String cho_url;
	private String cho_th;
	
	public GuideVO(String cho_code, String cho_name, String cho_url, String cho_th) {
		super();
		this.cho_code = cho_code;
		this.cho_name = cho_name;
		this.cho_url = cho_url;
		this.cho_th = cho_th;
	}
	public GuideVO() {
		super();
	}
	public String getCho_code() {
		return cho_code;
	}
	public void setCho_code(String cho_code) {
		this.cho_code = cho_code;
	}
	public String getCho_name() {
		return cho_name;
	}
	public void setCho_name(String cho_name) {
		this.cho_name = cho_name;
	}
	public String getCho_url() {
		return cho_url;
	}
	public void setCho_url(String cho_url) {
		this.cho_url = cho_url;
	}
	public String getCho_th() {
		return cho_th;
	}
	public void setCho_th(String cho_th) {
		this.cho_th = cho_th;
	}
	
	
	
	
	
	
	
	
	
	
}
