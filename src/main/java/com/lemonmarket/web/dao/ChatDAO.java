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
			result = true;
		}
		
		return result;
	}

	public List<ChatDTO> getList(int roomseq) {
		
		List<ChatDTO> list = sqlSession.selectList("Chat.getId",roomseq);
		
		return list;	
	}
	
	public List<RoomDTO> getRoomList(RoomDTO useridx) {
		
		List<RoomDTO> list = sqlSession.selectList("Chat.getRoomList",useridx);
		
		return list;	
	}

	public int getMax(int roomseq) {
		// TODO Auto-generated method stub
		if(sqlSession.selectOne("Chat.getMax",roomseq) == null) {
			return 0;
		}
		return sqlSession.selectOne("Chat.getMax",roomseq);
	}


	public int getCheck(int max) {
		
		if(sqlSession.selectOne("Chat.check",max) == null) {
			return 0;
		}
		return sqlSession.selectOne("Chat.check",max);
	}

	public List<ChatDTO> getNewList(HashMap<String, Integer> list) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Chat.getNew",list);
	}

	public String getRecentContents(int roonIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Chat.getRecent",roonIdx);
	}

	public String getUserId(int userIdx) {
		return sqlSession.selectOne("User.getUserId",userIdx);
	}


	public String getProductName(int productIdx) {
		// TODO Auto-generated method stub
		String n=  sqlSession.selectOne("Chat.getToId",productIdx);
//		System.out.println(n);
		return n;
	}

	public int getUserIdx(int roomIdx) {
		// TODO Auto-generated method stub
		System.out.println("이거 값언샤?"+roomIdx);
		return sqlSession.selectOne("Chat.getUserIdx",roomIdx);
	}

	public int getProductIdx(int roomIdx) {
		// TODO Auto-generated method stub
		int pridx = sqlSession.selectOne("Chat.getPrIdx",roomIdx);
		System.out.println(pridx);
		return pridx;
	}

	public void insertRoom(RoomDTO rdto) {

		sqlSession.insert("Chat.insertRoom",rdto);
	}

	public String getRecentTime(int roomIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Chat.getRecentTime",roomIdx);
	}

	public int confirm(RoomDTO rdto) {
		return sqlSession.selectOne("Chat.confirm",rdto);
	}

	public String getFromId(int chatIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Chat.fromId",chatIdx);
	}

	public int getRoomCnt(int prIdx) {
		return sqlSession.selectOne("Chat.RoomCnt",prIdx);
	}
	public int getInterCnt(int prIdx) {
		return sqlSession.selectOne("Chat.InterCnt",prIdx);
	}

	public void UpdateProductCnt(HashMap<String, Integer> list) {
		sqlSession.update("Chat.updateInter",list);
		
	}

	public void UpdateroomCnt(HashMap<String, Integer> list) {
		sqlSession.update("Chat.updateRoom",list);
	}
}
