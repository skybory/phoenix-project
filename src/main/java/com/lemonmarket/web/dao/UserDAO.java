package com.lemonmarket.web.dao;

import java.util.HashMap;

import java.util.List;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.dto.WishlistDTO;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;

	public UserDAO() {
		sqlSession = factory.openSession(true);
	}

	// UserDAO 기능 추가
	public boolean join(UserDTO udto) {
		boolean result = false;
		if (sqlSession.insert("User.join", udto) == 1) {
			result = true;
		}
		return result;
	}

	public boolean login(String userId, String userPw, HttpSession session) {
//		UserDTO udto = new UserDTO();
//		udto.setUserId(userId);
//		udto.setUserPw(userPw);
		boolean result = false;
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("userId", userId);
		datas.put("userPw", userPw);
		UserDTO udto = sqlSession.selectOne("User.login", datas);
		if (udto != null) {
			session.setAttribute("userDTO", udto); // 세션에 정보 저장. 0314 편집 , 0319 다시 이해함.
			result = true;
		}

		return result;
	}

	// 주어진 사용자 ID의 중복 여부를 확인하는 메소드
	public boolean checkId(String userId) {
		boolean result = false; 
		int cnt = 0; // 데이터베이스에서 조회된 레코드 수를 저장할 변수

		// MyBatis를 사용해 주어진 사용자 ID의 레코드 수 조회
		// 'User.checkId'는 MyBatis 매퍼 파일에서 정의된 쿼리의 id
		cnt = sqlSession.selectOne("User.checkId", userId);

		// 조회된 레코드 수가 1 이상이면 중복된 ID가 존재한다는 의미
		if (cnt >= 1) {
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
	public List<UserDTO> getList() {

		// MyBatis를 사용해 모든 사용자 정보 조회
		// 'User.getList'는 MyBatis 매퍼 파일에서 정의된 쿼리의 id
		return sqlSession.selectList("User.getList");
	}


//	유저 정보 가져오기
	public UserDTO getData(int userIdx) {
		return sqlSession.selectOne("User.getData", userIdx);
	}
	
	public boolean updateAddress(String userId, String userAddress) {
		boolean result = false;
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("userId", userId);
		datas.put("userAddress", userAddress);
		if (sqlSession.update("User.updateAddress", datas) == 1) {
			result = true;
		}
		return result;
	}

	
//	물품 구매하기
	public boolean purchase(int purchaseUserIdx, int productIdx) {
		boolean result = false;
		
		int productPrice = sqlSession.selectOne("Product.getProductPrice", productIdx);

		// 구매 1단계 : PRODUCT 테이블에 구매자 추가하기
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("userIdx", purchaseUserIdx);
		datas.put("productIdx", productIdx);
		datas.put("productPrice", productPrice);
		
		int sellUserIdx = sqlSession.selectOne("Product.getUserIdx", productIdx);
		// 구매 2단계 : 판매자의 돈 업데이트하기
		HashMap<String, Integer> datas2 = new HashMap<String, Integer>();
		datas2.put("productPrice", productPrice);
		datas2.put("sellUserIdx", sellUserIdx);

		// 구매 3단계 : 구매자의 돈 업데이트하기
		HashMap<String,Integer> datas3 = new HashMap<String, Integer>();
		datas3.put("productPrice", productPrice);
		datas3.put("userIdx",purchaseUserIdx);
		
		
		if (sqlSession.update("Product.purchase", datas) == 1 && sqlSession.update("Product.sell", datas2)==1 && sqlSession.update("Product.purchase2", datas3) ==1) {
			result = true;
		}
		return result;
	}

	
//	구매 목록 가져오기
	public List<ProductDTO> getPurchaseList(int userIdx) {
	    // 구매 목록을 가져오는 쿼리 실행 후 ProductDTO 객체의 리스트로 저장
	    List<ProductDTO> purchaseList = sqlSession.selectList("User.getPurchaseList", userIdx);
	    return purchaseList;
	}
//	판매 목록 가져오기
	public List<ProductDTO> getSalesList(int userIdx) {
		List<ProductDTO> salesList = sqlSession.selectList("User.getSalesList", userIdx);
		return salesList;
	}
	
//	유저 프로필 가져오기
	public List<UserDTO> viewProfile(String userId) {
		List<UserDTO> ProfileList =sqlSession.selectList("MyPage.getProfileList",userId);
		return ProfileList;
	}
	
	public List<WishlistDTO> getWishList(int userIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("User.getWishList",userIdx);
	}

	public List<ProductDTO> getWish(HashMap<String, Integer> list) {
		return sqlSession.selectList("User.getWish",list);}

	public List<ProductDTO> getOnSalesList(int userIdx) {
		List<ProductDTO> onSalesList = sqlSession.selectList("User.getOnSalesList", userIdx);
		return onSalesList;
	}
//	유저 프로필 가져오기
	public boolean updateUserProfile(UserDTO udto, int userIdx) {
		boolean result = false;
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("udto", udto);
		datas.put("userIdx", userIdx);
		if (sqlSession.update("User.updateUserProfile",datas) == 1) {
			result = true;
		}
		return result;
	}
}
