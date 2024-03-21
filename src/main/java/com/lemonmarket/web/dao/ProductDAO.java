package com.lemonmarket.web.dao;


import java.util.HashMap;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.CategoryDTO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class ProductDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;

	public ProductDAO() {
		sqlSession = factory.openSession(true);
	}

	
	// 상품 등록 메서드
	public boolean register(ProductDTO pdto) {
		boolean result = false;
		if (sqlSession.insert("Product.register", pdto) == 1) {
			result = true;
		}
		return result;
	}
	
	
	public List<ProductDTO> selectProductsByCategoryIdx(int startRow, int pageSize, int categoryIdx) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		datas.put("categoryIdx", categoryIdx);
		List<ProductDTO> productList = sqlSession.selectList("Product.selectProductsByCategoryIdx", datas);
		
        return productList;
    }
	public ProductDTO viewProductDetail(int productIdx) {
		ProductDTO pdto = sqlSession.selectOne("Product.viewProductDetail", productIdx);
		return pdto;
	}

	// 물품 전체 리스트 가져오기(페이징처리) -> 판매중인 물품 리스트만 가져오기
	public List<ProductDTO> getProductList(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		List<ProductDTO> productList = sqlSession.selectList("Product.getList", datas);
		return productList;
	}

	// 물품 전체 리스트 가져오기 전체 가져오기 (페이징X)
	public List<ProductDTO> getProductListAll() {
		List<ProductDTO> productList = sqlSession.selectList("Product.getListAll");
		return productList;
	}

	//	물품 총 갯수 가져오기 
	public int getProductCnt() {
		int productCnt = sqlSession.selectOne("Product.getProductCnt");
		return productCnt;
	}

	public int updateInterestCount(String userid) {
//		int result = sqlSession.selectOne("Product.check",userid);
		int result = 1;
//		if(result == 1) {
//			sqlSession.update(userid); //0으로 바꾸기
//		}else {
//			sqlSession.update(userid); //1로 바꾸기	찜테이블
//		}
		return result;
	}

	
	
//    // 특정 ID의 카테고리를 조회하는 메서드
//    public ProductDTO getProdutByIdx(int categoryIdx) {
//        ProductDTO pdto = sqlSession.selectOne("Product.productByIdx", categoryIdx);
//        return pdto;
//    }
 
 
	
	
////	물품 관심 수 가져오기(수정필요)
//	public int getInterestCount(int productIdx) {
//		return sqlSession.selectOne("Product.getInterestCount",productIdx);
//	}
	
////	물품 관심 수 갱신하기(수정필요)
//	public boolean updateInterestCount(userIdx) {
//		아이디값을 통해서 insert 하는 방식으로 구현하면될것같음.
//	}
//	
//// 	 랜덤 물품 뽑아오기?
//	public List<ProductDTO> getRandomProducts() {
//        return sqlSession.selectList("getRandomProducts");
//    }
	
	
	

	public int checkWish(HashMap<String, Integer> list) {
		return sqlSession.selectOne("Product.CheckWish",list);
	}

	public int confirm(HashMap<String, Integer> list) {
		return sqlSession.selectOne("Product.confirm",list);
	}

	public void insertInterset(HashMap<String, Integer> list) {

		sqlSession.insert("Product.insertInterset",list);
	}

	public int getInterest(int prIdx) {
		return sqlSession.selectOne("Product.getInterest", prIdx);
	}

	public void upInterest(HashMap<String, Integer> list) {
		// TODO Auto-generated method stub
		sqlSession.update("Product.upInterest",list);
	}
	public void downInterest(HashMap<String, Integer> list) {
		// TODO Auto-generated method stub
		sqlSession.update("Product.downInterest",list);
	}


	public int getProductsCntByCategoryIdx(int categoryIdx) {
		int productCnt = sqlSession.selectOne("Product.getProductsCntByCategoryIdx", categoryIdx);
		return productCnt;
	}
	
}
