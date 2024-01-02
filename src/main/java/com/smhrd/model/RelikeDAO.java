package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class RelikeDAO {

   
SqlSessionFactory sqlSessionFactory =    SqlSessionManager.getSqlSession();
   
   public int RelikeInsert(RelikeVO vo) {
   SqlSession sqlSession = sqlSessionFactory.openSession(true);
   int cnt = sqlSession.insert("com.smhrd.db.RelikeMapper.RelikeInsert", vo);
   sqlSession.close();
         
   return cnt;
}

   public List<RecipeVO> RelikeSelect(String mem_id) {
       SqlSession sqlSession = sqlSessionFactory.openSession(true);
       List<RecipeVO> RelikeSelectList = sqlSession.selectList("com.smhrd.db.RelikeMapper.RelikeSelect", mem_id);
       sqlSession.close();
       
       return RelikeSelectList;

}
   
   public int RelikeDelete(RelikeVO vo) {
	      SqlSession sqlSession = sqlSessionFactory.openSession(true);
	      int cnt = sqlSession.delete("com.smhrd.db.RelikeMapper.RelikeDelete", vo);
	      sqlSession.close();
	      
	      return cnt;
	   }
   
}