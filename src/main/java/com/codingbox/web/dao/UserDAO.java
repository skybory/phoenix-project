package com.codingbox.web.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codingbox.web.dto.UserDTO;
import com.codingbox.web.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public UserDAO() {
		sqlSession = factory.openSession(true);
	}
	
	public boolean join(UserDTO udto) {
		boolean result = false;
		if(sqlSession.insert("User.join", udto)== 1) {
			result = true;
		}
		return result;
	}

	public boolean login(String userid, String userpw) {

		boolean result = false;
		HashMap<String, String> datas = new HashMap<String, String>();
		
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		
		
		
		
		if(sqlSession.selectOne("User.login",datas) != null)
		{
			result = true;
		}

		return result;
	}

	
}
