package com.lemonmarket.web.servlet.chatting;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ChatDAO;
import com.lemonmarket.web.dto.ChatDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import netscape.javascript.JSObject;

public class ChattingNewGet{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		ChatDAO cdao = new ChatDAO();
		int max = Integer.parseInt(request.getParameter("max"));
		int roomIdx = Integer.parseInt(request.getParameter("roomIdx"));
		List<ChatDTO> chatList = new ArrayList<>();
		HashMap<String, Integer> newList = new HashMap<>();
		newList.put("max", max);
		newList.put("roomIdx", roomIdx);
		JSONObject obj = null;
		JSONArray arry = new JSONArray();
		ChatDTO cdto = new ChatDTO();
		chatList = cdao.getNewList(newList);
		max = cdao.getMax(roomIdx);
		for(ChatDTO chat : chatList) {
			obj = new JSONObject();
//			user테이블
			obj.put("fromId", cdao.getFromId(chat.getChatIdx()));
			
			
			int productIdx = cdao.getProductIdx(roomIdx);
			obj.put("toId", cdao.getProductName(productIdx));
			
			obj.put("chatTime", chat.getChatDate());
			obj.put("contents", chat.getContents());
			obj.put("max", max);
			arry.add(obj);
		}
//
		response.getWriter().println(arry);
		response.setContentType("application/json");
		


	}

}
