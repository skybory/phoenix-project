// MyTradeDAO.java

package com.lemonmarket.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.MytradeDTO;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class MyTradeDAO {
    SqlSessionFactory factory = null; // SqlSessionFactory를 선언할 때 초기화하지 않음
    SqlSession sqlSession;

    public MyTradeDAO() {
        factory = SqlMapConfig.getFactory(); // SqlSessionFactory를 생성할 때 초기화
        sqlSession = factory.openSession(true);
    }

    public List<MytradeDTO> interestList(int userNum) {
        List<MytradeDTO> list = new ArrayList<>();

        try {
            list = sqlSession.selectList("MyTradeDAO.getInterestList", userNum);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<MytradeDTO> purchaseList(int userNum) {
        List<MytradeDTO> purchaseList = new ArrayList<>();

        try {
            // 여기에 데이터베이스에서 사용자의 구매 목록을 조회하는 쿼리를 실행하는 코드를 작성해주세요.
            // 예를 들어, MyBatis를 사용한다면 sqlSession.selectList() 메서드를 호출하여 구매 목록을 가져올 수 있습니다.
            // 쿼리를 실행한 결과를 purchaseList에 저장합니다.
        	
        	//SqlSession sqlSession = SqlMapConfig.getFactory().openSession(true);
        	
        	
        	purchaseList = sqlSession.selectList("MyTradeDAO.getPurchaseList", userNum);
        	 //sqlSession.close();
        } catch (Exception e) {
            e.printStackTrace();
            // 오류가 발생하면 예외를 처리하거나 로깅할 수 있습니다.
        }

        return purchaseList;
    }
}