package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data

public class IngreSelectVO {

	
	private String input1;
	private String input2;
	private String input3;
	private String input4;
	private String input5;
	private String input6;
	
	
	public IngreSelectVO(String input1, String input2, String input3, String input4, String input5, String input6) {
		this.input1 = input1;
		this.input2 = input2;
		this.input3 = input3;
		this.input4 = input4;
		this.input5 = input5;
		this.input6 = input6;
	}
	

	
	
}
