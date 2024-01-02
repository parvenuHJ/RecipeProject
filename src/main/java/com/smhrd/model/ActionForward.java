package com.smhrd.model;

import lombok.Data;

@Data
public class ActionForward {
	
	// 이동 할 지 말 지
	private boolean isRedirect = false;
	
	// 어느 주소로 갈 건지
	private String path = null;
	
		

}
