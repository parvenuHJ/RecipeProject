package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class IngrementDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	
	public List<IngrementVO> Ingrement(String re_code) {
	    SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    List<IngrementVO> IngrementList = sqlSession.selectList("com.smhrd.db.RecipeMapper.Ingrement", re_code);
	    sqlSession.close();
	    
	    return IngrementList;
	}
}
