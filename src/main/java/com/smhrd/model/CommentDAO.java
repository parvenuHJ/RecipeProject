package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class CommentDAO {

SqlSessionFactory sqlSessionFactory =  SqlSessionManager.getSqlSession();
	
	// 코멘트 등록(사진 등록하는 경우)
	public int CommentInsert(CommentVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("com.smhrd.db.CommentMapper.CommentInsert", vo);
		sqlSession.close();
				
		return cnt;
	}

	
	// 코멘트 등록(사진 등록하지 않는 경우)
	public int CommentInsert2(CommentVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("com.smhrd.db.CommentMapper.CommentInsert2", vo);
		sqlSession.close();
				
		return cnt;
		
		
	}
	
	// 레시피 별 코멘트 출력
	public List<CommentVO> CommentShow(String re_code) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<CommentVO> ShowList = sqlSession.selectList("com.smhrd.db.CommentMapper.CommentShow", re_code);
		sqlSession.close();
				
		return ShowList;
	}
	
	// 회원 별 코멘트 출력
	public List<CommentVO> CommentMember(String mem_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<CommentVO> CommentList = sqlSession.selectList("com.smhrd.db.CommentMapper.CommentMember", mem_id);
		sqlSession.close();
		
		return CommentList;
	}
	
	// 코멘트 한 개 출력	
	public CommentVO CommentDetail(CommentVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CommentVO comment = sqlSession.selectOne("com.smhrd.db.CommentMapper.CommentDetail", vo); 
		sqlSession.close();
		
		return comment;
	}
	
	
	// 코멘트 수정(텍스트만 수정)
	public int CommentUpdate1(CommentVO vo) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.update("com.smhrd.db.CommentMapper.CommentUpdate1", vo);
		sqlSession.close();
		
		return cnt;
	}

	// 코멘트 수정(텍스트+이미지 수정)
	public int CommentUpdate2(CommentVO vo) {
	
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	int cnt = sqlSession.update("com.smhrd.db.CommentMapper.CommentUpdate2", vo);
	sqlSession.close();
	
	return cnt;
}
	// 코멘트 삭제
	public int CommentDelete(String com_num) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.delete("com.smhrd.db.CommentMapper.CommentDelete", com_num);
		sqlSession.close();
		
		return cnt;
	}


	
	
	
	
}
