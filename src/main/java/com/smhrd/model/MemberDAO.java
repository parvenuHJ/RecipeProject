package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class MemberDAO {
	
	// 팩토리를 통해 회원 세션 불러오기
	
	SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
	
	// 회원가입
	public int join(MemberVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("com.smhrd.db.MemberMapper.join", vo);
		sqlSession.close();
				
		return cnt;
	}

	public MemberVO login(MemberVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberVO loginVO = sqlSession.selectOne("com.smhrd.db.MemberMapper.login", vo);
		sqlSession.close();
				
		return loginVO;
	}


	public int MemberUpdate(MemberVO vo) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.update("com.smhrd.db.MemberMapper.MemberUpdate", vo);
		sqlSession.close();
		
		return cnt;
	}
	
	public int MemberDelete(String mem_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.delete("com.smhrd.db.MemberMapper.MemberDelete", mem_id);
		sqlSession.close();
		
		return cnt;
	}

	public boolean idCheck(String mem_id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberVO vo = sqlSession.selectOne("com.smhrd.db.MemberMapper.idCheck", mem_id);
		sqlSession.close();
		
		if(vo != null) {
			return false;
		}else {
			return true;
		}
		
		
	}
	public MemberVO getNick(String mem_id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberVO vo = sqlSession.selectOne("com.smhrd.db.MemberMapper.getNick", mem_id);
		sqlSession.close();
		
		return vo;
		
		
	}

	
	
	

}
