package com.lemonmarket.web.servlet.chatting;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ChatDAO;
import com.lemonmarket.web.dto.ChatDTO;
import com.lemonmarket.web.dto.UserDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import netscape.javascript.JSObject;


public class ChattingGetList{

	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<ChatDTO> chatList = new ArrayList<>();
		ChatDAO cdao = new ChatDAO();
//		ChatDTO cdto = new ChatDTO();
		
		JSONObject obj = null;
		
		JSONArray arry = new JSONArray();
		

		
		int roomIdx = Integer.parseInt(request.getParameter("roomIdx"));
		int max = cdao.getMax(roomIdx);		
		chatList = cdao.getList(roomIdx);
		System.out.println("룸값" + roomIdx);
		
		
		for(ChatDTO chat : chatList) {
			obj = new JSONObject();
			obj.put("fromId", chat.getUserId());
			//현재 userIdx값을 못가져온다 확인해보자 **
			
			
			int productIdx = cdao.getProductIdx(roomIdx);
			obj.put("toId", cdao.getProductName(productIdx));
			System.out.println("prName : " + cdao.getProductName(productIdx));
			obj.put("chatTime", chat.getChatDate());
			obj.put("contents", chat.getContents());
			obj.put("max", max);
			arry.add(obj);
		}
		response.getWriter().println(arry);
		response.setContentType("application/json");
		
	}

}


















