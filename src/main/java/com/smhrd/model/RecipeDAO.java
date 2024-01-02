package com.smhrd.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class RecipeDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 레시피 전체 출력
	public List<RecipeVO> RecipeShow() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<RecipeVO> RecipeList = sqlSession.selectList("com.smhrd.db.RecipeMapper.RecipeShow");
		sqlSession.close();

		return RecipeList;
	}

	
	// 메뉴이름으로 검색
	public List<RecipeVO> RecipeSelect(String food_name) {
	    SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    List<RecipeVO> RecipeSelectList = sqlSession.selectList("com.smhrd.db.RecipeMapper.RecipeSelect", food_name);
	    sqlSession.close();
	    
	    return RecipeSelectList;
	}
	
	// 메뉴 한 개 검색
		public List<RecipeVO> RecipeOne(String food_name) {
		    SqlSession sqlSession = sqlSessionFactory.openSession(true);
		    List<RecipeVO> RecipeOneList  = sqlSession.selectList("com.smhrd.db.RecipeMapper.RecipeOne", food_name);
		    sqlSession.close();
		    
		    return RecipeOneList;
		}

	
	
	
	
	// 페이징용
	public int CountRecipe() {
	       SqlSession sqlSession = sqlSessionFactory.openSession(true);
	       int cnt = sqlSession.selectOne("com.smhrd.db.RecipeMapper.CountRecipe");
	       sqlSession.close();
	             
	       return cnt;
	}
	
	// 페이징용
	public RecipeVO Select(RecipeVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		RecipeVO SelectVO = sqlSession.selectOne("com.smhrd.db.RecipeMapper.Select", vo);
		sqlSession.close();
				
		return SelectVO;
	}

	

	
	
}