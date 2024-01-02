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
public class CommentVO {
	

	@NonNull
	private String co_num;
	private String mem_id;
	private String co_text;
	private String co_img;
	private String re_code;
	
	public CommentVO( String co_num, String mem_id, String co_text, String re_code) {
		this.co_num = co_num;
		this.mem_id = mem_id;
		this.co_text = co_text;
		this.re_code = re_code;
	}
	public CommentVO(String mem_id, String co_num) {
		this.co_num = co_num;
		this.mem_id = mem_id;
	}
	public CommentVO(String co_num, String co_text, String co_img) {
		super();
		this.co_num = co_num;
		this.co_text = co_text;
		this.co_img = co_img;
	}
	

	
	
	
	

}
