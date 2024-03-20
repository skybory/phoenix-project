package com.lemonmarket.web.dao;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class MapDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public MapDAO() {
		sqlSession = factory.openSession(true);
	}
	
//	public List<MapDTO> listTown(){
//		return null;
//	}

	public void updateAddress(String address) {
		sqlSession.update("Map.updateAddress",address);
	}
	
}
