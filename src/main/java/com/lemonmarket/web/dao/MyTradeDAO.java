package com.lemonmarket.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.MytradeDTO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class MyTradeDAO {
    private SqlSessionFactory factory;
    private SqlSession sqlSession;

    public MyTradeDAO() {
        // SqlSessionFactory 초기화
        this.factory = SqlMapConfig.getFactory();
    }

    public List<MytradeDTO> getInterestList(int userNum) {
        List<MytradeDTO> list = new ArrayList<>();

        try {
            sqlSession = factory.openSession(true);
            list = sqlSession.selectList("MyTradeDAO.getInterestList", userNum);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }

        return list;
    }

    public List<ProductDTO> getPurchaseList(int userNum) {
        List<ProductDTO> purchaseList = new ArrayList<>();

        try {
            sqlSession = factory.openSession(true);
            purchaseList = sqlSession.selectList("MyTradeDAO.getPurchaseList", userNum);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }

        return purchaseList;
    }
}