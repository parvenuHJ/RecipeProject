package com.smhrd.model;


import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class RecipeVO {
    private String re_code;
    private String re_name;
    private String food_name;
    private String re_per;
    private String re_time;
    private String re_level;
    private String re_url;
    private int re_like;
}
