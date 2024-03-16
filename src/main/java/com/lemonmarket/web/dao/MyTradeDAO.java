package com.lemonmarket.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.MytradeDTO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class MyTradeDAO {
   SqlSessionFactory factory = SqlMapConfig.getFactory();
   SqlSession sqlSession;
   
   public MyTradeDAO() {
      sqlSession = factory.openSession(true);
   }

   public List<MytradeDTO> getPurchaseList(String userId) {

      // 구매 목록을 가져오는 쿼리 실행 후 ProductDTO 객체의 리스트로 저장
      List<MytradeDTO> purchaseList = sqlSession.selectList("MyPage.getPurchaseList", userId);

      return purchaseList;
   }
   
   public List<MytradeDTO> getSalesList(String userId){
	   
	   List<MytradeDTO> SalesList =sqlSession.selectList("MyPage.getSalesList",userId);
	   
	   return SalesList;
   }

public List<MytradeDTO> getInterestList(String userId) {
	
	List<MytradeDTO> InterestList =sqlSession.selectList("MyPage.getInterestList",userId);
	return InterestList;
}


}