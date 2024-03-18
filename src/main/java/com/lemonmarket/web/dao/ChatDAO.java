package com.lemonmarket.web.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.lemonmarket.web.dto.ChatDTO;
import com.lemonmarket.web.dto.RoomDTO;
import com.lemonmarket.web.dto.UserDTO;
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
 
		chatList = sqlSession.selectList("Chat.getId");
		
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
			
			
			 return sqlSession.insert("Chat.insert",cdto) == 1;
			
		}

	public boolean insertChatting(ChatDTO cdto) {
		boolean result = false;
		if(sqlSession.insert("Chat.insertChat",cdto) == 1) {
			System.out.println(cdto.getcontents());
			result = true;
		}
		
		return result;
	}

	public List<ChatDTO> getList(int roomseq) {
		
		List<ChatDTO> list = sqlSession.selectList("Chat.getId",roomseq);
		
		return list;	
	}
	
	public List<RoomDTO> getRoomList(String userId) {
		
		List<RoomDTO> list = sqlSession.selectList("Chat.getRoomList",userId);
		
		return list;	
	}

	public int getMax(int roomseq) {
		// TODO Auto-generated method stub
		int cnt;
		cnt = sqlSession.selectOne("Chat.getMax",roomseq);
		return cnt;
	}

	public int getCheck(int max) {
		
		
		return sqlSession.selectOne("Chat.check",max);
	}

	public List<ChatDTO> getNewList(ChatDTO max) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Chat.getNew",max);
	}

	public String getRecentContents(int roomseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Chat.getRecent",roomseq);
	}
}
