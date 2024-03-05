package com.codingbox.web.dao;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.codingbox.web.mybatis.SqlMapConfig;

public class ProductDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public ProductDAO() {
		sqlSession = factory.openSession(true);
	}
	
 
	//ProductdDAO 기능 추가

	
}
