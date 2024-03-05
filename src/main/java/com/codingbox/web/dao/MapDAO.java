package com.codingbox.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.codingbox.web.mybatis.SqlMapConfig;

public class MapDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public MapDAO() {
		sqlSession = factory.openSession(true);
	}
	
	
	//MapDAO 기능 추가
}
