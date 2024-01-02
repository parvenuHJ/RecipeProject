package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class InfoDAO {

	
	SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
	
	
	
	
	public List<InfoVO> InfoShow() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<InfoVO> InfoList = sqlSession.selectList("com.smhrd.db.InfoMapper.InfoShow");
		sqlSession.close();
				
		return InfoList;
	}
	
	
	
}
