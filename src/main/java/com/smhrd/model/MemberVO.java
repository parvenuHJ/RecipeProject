package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class MemberVO {
	
	

	@NonNull
	private String mem_id;
	@NonNull
	private String mem_pw;
	private String mem_nick;
	private String mem_address;
	private String mem_tel;
	private String rate_name;
	
	
	

}
