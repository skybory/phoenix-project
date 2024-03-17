package com.lemonmarket.web.mybatis;

import java.io.Reader;



import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
private static SqlSessionFactory factory;



	// 클래스 초기화 블럭
	static {
		try {
			String resource = "./com/lemonmarket/web/mybatis/config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public static SqlSessionFactory getFactory() {
		return factory;
	}

}
