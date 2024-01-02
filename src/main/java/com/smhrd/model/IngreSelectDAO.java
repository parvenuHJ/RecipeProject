package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class IngreSelectDAO {

	// 팩토리를 통해 회원 세션 불러오기
	
		SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
	
	
	
	public List<RecipeVO> IngreSelect(IngreSelectVO vo) {
	    SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    List<RecipeVO> IngreSelectList = sqlSession.selectList("com.smhrd.db.IngreSelectMapper.IngreSelectList", vo);
	    sqlSession.close();
	    
	    return IngreSelectList;
	}
	
	
}
