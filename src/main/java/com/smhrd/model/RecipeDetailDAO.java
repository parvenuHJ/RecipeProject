package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class RecipeDetailDAO {
	
SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	
	public List<RecipeDetailVO> RecipeDetail(String re_code) {
	    SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    List<RecipeDetailVO> RecipeDetailList = sqlSession.selectList("com.smhrd.db.RecipeMapper.RecipeDetail", re_code);
	    sqlSession.close();
	    
	    return RecipeDetailList;
	}

}
