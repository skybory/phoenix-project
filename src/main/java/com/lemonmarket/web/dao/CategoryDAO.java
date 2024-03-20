package com.lemonmarket.web.dao;

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
    public List<CategoryDTO> getCategoryAll() {
        List<CategoryDTO> categoryList = sqlSession.selectList("Category.categoryAll");
        return categoryList;
    }
	
    // 카테고리 정보 가져오는 메서드
    public CategoryDTO getCategory(int categoryIdx) {
    	return sqlSession.selectOne("Category.getCategory",categoryIdx);
    }
}
