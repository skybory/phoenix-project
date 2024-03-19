package com.lemonmarket.web.dao;


import java.util.HashMap;

import java.util.List;

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

	
	// 상품 등록 메서드
	public boolean register(ProductDTO pdto) {
		boolean result = false;
		if (sqlSession.insert("Product.register", pdto) == 1) {
			result = true;
		}
		return result;
	}

//	 카테고리로 상품 검색
	public List<ProductDTO> selectProductsByCategoryIdx(int categoryIdx) {
        return sqlSession.selectList("selectProductsByCategoryIdx", categoryIdx);
    }
	
	// index 값으로 물품 상세보기
	public ProductDTO viewProductDetail(int productIdx) {
		ProductDTO pdto = sqlSession.selectOne("Product.viewProductDetail", productIdx);
		return pdto;
	}

	// 물품 전체 리스트 가져오기(페이징처리) 
	public List<ProductDTO> getProductList(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		List<ProductDTO> productList = sqlSession.selectList("Product.getList", datas);
		return productList;
	}

//	물품 총 갯수 가져오기 
	public int getProductCnt() {
		int productCnt = sqlSession.selectOne("Product.getProductCnt");
		return productCnt;
	}
 
 
	
	
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
	
}
