package com.lemonmarket.web.servlet.chatting;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lemonmarket.web.dao.ChatDAO;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.dto.RoomDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ChattingRoomGetList {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//여기서 인서트하나 날려야할듯 채팅룸
		
		
		List<RoomDTO> roomList = new ArrayList<>();
		ChatDAO cdao = new ChatDAO();
		RoomDTO rdto = new RoomDTO();
		JSONObject obj = null;		
		JSONArray arry = new JSONArray();
		ProductDAO pdao = new ProductDAO();
		int userIdx = Integer.parseInt(request.getParameter("userIdx"));
		int prIdx = Integer.parseInt(request.getParameter("prIdx"));
		String userId = request.getParameter("userId");
		String prUserId = request.getParameter("pr_userId");
		rdto.setProductIdx(prIdx);
		rdto.setUserIdx(userIdx);
		rdto.setProductId(prUserId);
		rdto.setUserId(userId);
		
		cdao.getProductName(prIdx);
		
		int confirm = cdao.confirm(rdto);
		if(confirm == 0) {
			cdao.insertRoom(rdto);
			
		}
//		cdao.insertRoom(rdto);
		//** 여기 이제 useridx도같고 pri인데스또한 겹쳐도 리스트 나오게
		roomList = cdao.getRoomList(rdto);
		
//		rdto.setUserId(cdao.getUserId(userIdx));
//		rdto.setProductIdx(Integer.parseInt(request.getParameter("productIdx")));
//		rdto.setProductTitle(cdao.getToId(rdto.getProductIdx()));
		
			
		
		
		for(RoomDTO room : roomList) {
			obj = new JSONObject();
			obj.put("toId", cdao.getProductName(prIdx));
			obj.put("roomseq", room.getRoomIdx());
			if(cdao.getRecentContents(room.getRoomIdx()) == null) {
				obj.put("contents", "채팅없음");
				
			}else {
				
				obj.put("contents", cdao.getRecentContents(room.getRoomIdx()));
			}
			if(cdao.getRecentTime(room.getRoomIdx()) == null) {
				obj.put("roomDate", "");
				
			}else {
				
				obj.put("roomDate", cdao.getRecentTime(room.getRoomIdx()));
			}
//			obj.put("prName", cdao.getProductName(room.getProductIdx()));
//			obj.put("max", cdao.getMax(room.getRoomIdx()));
//			obj.put("roomDate", room.getRoomDate());
			arry.add(obj);
		}
		response.getWriter().println(arry);
		response.setContentType("application/json");
		
	}
}
