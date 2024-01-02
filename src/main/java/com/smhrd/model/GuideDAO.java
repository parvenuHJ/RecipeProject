package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class GuideDAO {

	SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
	
	public List<GuideVO> GuideShow() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<GuideVO> GuideList = sqlSession.selectList("com.smhrd.db.GuideMapper.GuideShow");
		sqlSession.close();
				
		return GuideList;
	}
	
	
	
	
}
