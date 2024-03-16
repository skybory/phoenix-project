package com.lemonmarket.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.mybatis.SqlMapConfig;

public class MyPageDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public MyPageDAO() {
		sqlSession = factory.openSession(true);
	}
	
	
}
