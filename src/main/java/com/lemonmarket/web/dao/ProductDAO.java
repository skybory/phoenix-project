package com.lemonmarket.web.dao;

import com.lemonmarket.web.dto.ProductDTO;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class ProductDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;

	public ProductDAO() {
		sqlSession = factory.openSession(true); // autoCommit 설정
	}

	// 상품 등록 메서드
	public boolean insertProduct(ProductDTO product) {
		boolean result = false;
		if (sqlSession.insert("Product.insertProduct", product) == 1) {
			result = true;
		}
		return result;
	}

	// 상품 상세 정보 가져오는 메서드
	public ProductDTO getProductDetail(String productId) {
		return sqlSession.selectOne("Product.getProductDetail", productId);
	}

	// 상품 관심 수 업데이트 메서드
	public boolean updateInterestCount(String productId, int productInterestCount) {
		// 결과 저장할 변수 초기화
		boolean result = false;

		// 관심 수 담아올 hashmap 생성
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("productInterestCount", productInterestCount);

		// sqlSession을 사용해 관심 수 업데이트, 결과 1이면 성공으로 판단
		if (sqlSession.update("product.productInterestCount", datas) == 1) {
			result = true;
		}
		return result;
	}
}

//	// 상품 채팅 수 업데이트 메서드
//	// 수정
//	public void updateChatCount(String productId, int productChatCount) {
//		ProductDTO product = new ProductDTO();
//		product.setProductChatCount(String.valueOf(count));
//		sqlSession.update("Product.updateChatCount", product);
//	}
//}
