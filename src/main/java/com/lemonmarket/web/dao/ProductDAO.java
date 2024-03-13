package com.lemonmarket.web.dao;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class ProductDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public ProductDAO() {
		sqlSession = factory.openSession(true);
	}

	public boolean register(ProductDTO pdto) {
		boolean result = false;
		if(sqlSession.insert("Product.register", pdto) == 1) {
			result = true;
		}
		return result;
	}
	

	
}
