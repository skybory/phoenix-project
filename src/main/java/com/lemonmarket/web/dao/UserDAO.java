package com.lemonmarket.web.dao;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public UserDAO() {
		sqlSession = factory.openSession(true);
	}
	
		
	//UserDAO 기능 추가
	public boolean join(UserDTO udto) {
		boolean result = false;
		if(sqlSession.insert("user.join", udto) == 1) {
			result = true;
		}
		return result;
	}

	public boolean login(String userId, String userPw) {
		boolean result = false;
		HashMap<String, String> datas 
			= new HashMap<String, String>();
		datas.put("userId", userId);
		datas.put("userPw", userPw);
		
		if((Integer)sqlSession.selectOne("user.login", datas) == 1) {
			result = true;
		}
		
		return result;
	}
	
	
}
