package com.lemonmarket.web.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.ChatDTO;
import com.lemonmarket.web.mybatis.SqlMapConfig;

public class ChatDAO {


	
	
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public ChatDAO() {
		sqlSession = factory.openSession(true);
	}
		// ChatDAO 기능 추가

	public List<ChatDTO> getChatListById(String fromId, String toId, String chatId){
		List<ChatDTO> chatList = null;
		HashMap<String, String> datas = new HashMap<>();
		datas.put("fromId", fromId);
		datas.put("toId", toId);
		datas.put("chatId", chatId);
		
		chatList = sqlSession.selectList("Chat.getId" , datas);
		
		return chatList;
				
				
	}
		public List<ChatDTO> getChatListByRecent(String fromId, String toId, String number){
			List<ChatDTO> chatList = null;
			HashMap<String, String> datas = new HashMap<>();
			datas.put("fromId", fromId);
			datas.put("toId", toId);
			datas.put("chatId", number);
			
			chatList = sqlSession.selectList("Chat.getRecent" , datas);
			
			return chatList;
			
	}
		public boolean submit(ChatDTO cdto){
			
			
			return sqlSession.insert("Chat.insert",cdto)==1;
			
		}

	public boolean insertChatting(ChatDTO cdto) {
		boolean result = false;
		if(sqlSession.insert("Chat.insertChat",cdto) == 1) {
			System.out.println(cdto.getContents());
			result = true;
		}
		
		return result;
	}
}
