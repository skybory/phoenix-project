package com.codingbox.web.dao;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codingbox.web.mybatis.SqlMapConfig;

public class AdDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public AdDAO() {
		sqlSession = factory.openSession(true);
	}
	
 

	 //AdDAO 기능 추가

	
}
