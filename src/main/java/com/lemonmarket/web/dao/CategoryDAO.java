package com.lemonmarket.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.CategoryDTO;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class CategoryDAO {
	
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public CategoryDAO() {
		sqlSession = factory.openSession(true);
	}
    
    // 모든 카테고리를 조회하는 메서드
    public List<CategoryDTO> getcategoryAll() {
        List<CategoryDTO> categoryList = sqlSession.selectList("Category.categoryAll");
        return categoryList;
    }
    
    // 특정 ID의 카테고리를 조회하는 메서드
    public CategoryDTO getcategoryById(String categoryId) {
        CategoryDTO category = sqlSession.selectOne("Category.categoryById", categoryId);
        return category;
    }
    
    // 메모리 자원을 해제하는 메서드
    public void close() {
        if (sqlSession != null) {
            sqlSession.close();
        }
	
	}
	
}
