package com.lemonmarket.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.ProductDTO;
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

	public boolean updateInterestCount(String interestProductId, int interestCount) {
		return false;
		// TODO Auto-generated method stub
	}

	public boolean register(ProductDTO pdto) {
		// TODO Auto-generated method stub
		return false;
	}

	public ProductDTO viewProductDetail(int productId) {
		ProductDTO pdto = sqlSession.selectOne("Product.viewProductDetail",productId);	
		return pdto;
	}

	
	public List<ProductDTO> getProductList(int startRow, int pageSize) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		
		List<ProductDTO> productList
			=sqlSession.selectList("Product.getList",datas);
		return productList;
	}

 
	public int getProductCnt() {
		int productCnt
		= sqlSession.selectOne("Product.getProductCnt");
		return productCnt;
	}
}
