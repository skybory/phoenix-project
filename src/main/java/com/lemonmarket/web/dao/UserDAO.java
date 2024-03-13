package com.lemonmarket.web.dao;


import java.util.HashMap;
import java.util.List;

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
		if(sqlSession.insert("User.join", udto) == 1) {
			result = true;
		}
		return result;
	}

	public boolean login(String userId, String userPw) {
//		UserDTO udto = new UserDTO();
		
//		udto.setUserId(userId);
//		udto.setUserPw(userPw);
		boolean result = false;
		HashMap<String, String> datas 
			= new HashMap<String, String>();
		datas.put("userId", userId);
		datas.put("userPw", userPw);
		
		if(sqlSession.selectOne("User.login", datas) != null) {
			result = true;
		}


		return result;
	}

	// 주어진 사용자 ID의 중복 여부를 확인하는 메소드
	public boolean checkId(String userId) {
	    boolean result = false; // 중복 여부를 저장할 변수 초기화
	    int cnt = 0; // 데이터베이스에서 조회된 레코드 수를 저장할 변수
	    
	    // MyBatis를 사용해 주어진 사용자 ID의 레코드 수 조회
	    // 'User.checkId'는 MyBatis 매퍼 파일에서 정의된 쿼리의 id
	    cnt = sqlSession.selectOne("User.checkId", userId);
	    
	    // 조회된 레코드 수가 1 이상이면 중복된 ID가 존재한다는 의미
	    if(cnt >= 1) {
	        result = true; // 중복된 ID 존재
	    }
	    
	    return result; // 중복 여부 반환
	}

	// 주어진 사용자 ID로 사용자 정보를 조회하는 메소드
	public UserDTO searchById(String userId) {
	    // MyBatis를 사용해 주어진 사용자 ID로 사용자 정보 조회
	    // 'User.searchById'는 MyBatis 매퍼 파일에서 정의된 쿼리의 id
	    return sqlSession.selectOne("User.searchById", userId);
	}

	// 데이터베이스에 저장된 모든 사용자 정보를 조회하는 메소드
	public List<UserDTO> getList(){
		
	    // MyBatis를 사용해 모든 사용자 정보 조회
	    // 'User.getList'는 MyBatis 매퍼 파일에서 정의된 쿼리의 id
	    return sqlSession.selectList("User.getList");
	}

		
	
}
