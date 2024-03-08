package com.lemonmarket.web.dao;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.mybatis.SqlMapConfig;

public class ChatDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public ChatDAO() {
		sqlSession = factory.openSession(true);
	}
	
	 
		
		// ChatDAO 기능 추가

	
}
