//package com.lemonmarket.web.dao;
//
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//
//import com.lemonmarket.web.dto.WishlistDTO;
//import com.lemonmarket.web.mybatis.SqlMapConfig;
//
//public class WishlistDAO {
//	
//	SqlSessionFactory factory = SqlMapConfig.getFactory();
//	SqlSession sqlSession;
//	
//	public WishlistDAO() {
//		sqlSession = factory.openSession(true);
//	}
//    
//	public List<WishlistDTO> getInterestList(int userIdx) {
//
//		List<WishlistDTO> Wishlist = sqlSession.selectList("Wishlist.getWishlist", userIdx);
//		
//		return Wishlist;
//	}
//	
//}