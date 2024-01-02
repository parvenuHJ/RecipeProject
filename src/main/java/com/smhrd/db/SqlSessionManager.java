package com.smhrd.db;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	// mybatis에서 제공하는 기능 -> pom.xml 파일에 라이브러리 추가
	private static SqlSessionFactory sqlSessionFactory;
	
	// DAO에서 호출
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
	
	static {
		
		try {
			String resource = "com/smhrd/db/config.xml";
			InputStream inputStream;
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
}
