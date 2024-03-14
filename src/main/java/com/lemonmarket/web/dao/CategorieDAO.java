package com.lemonmarket.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.CategorieDTO;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class CategorieDAO {
	
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public CategorieDAO() {
		sqlSession = factory.openSession(true);
	}
    
    // 모든 카테고리를 조회하는 메서드
    public List<CategorieDTO> getAllCategories() {
        List<CategorieDTO> categorieList = sqlSession.selectList("Categorie.categoryAll");
        return categorieList;
    }
    
    // 특정 ID의 카테고리를 조회하는 메서드
    public CategorieDTO getCategorieById(String categoriesId) {
        CategorieDTO categorie = sqlSession.selectOne("Categorie.categoryById", categoriesId);
        return categorie;
    }
    
    // 메모리 자원을 해제하는 메서드
    public void close() {
        if (sqlSession != null) {
            sqlSession.close();
        }
	
	}
	
}
