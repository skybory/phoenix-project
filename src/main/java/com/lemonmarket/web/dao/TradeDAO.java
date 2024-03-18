package com.lemonmarket.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.TradeDTO;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class TradeDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;

	public TradeDAO() {
		sqlSession = factory.openSession(true);
	}



}
