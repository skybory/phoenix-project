package com.lemonmarket.web.servlet;

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
		ChatDTO cdto = new ChatDTO();
		String userid = request.getParameter("userid");
		cdto.setToId(request.getParameter("toid"));
		cdto.setuserId(userid);
		cdto.setRoomseq(Integer.parseInt(request.getParameter("roomseq")));
		
		JSONObject obj = null;
		
		JSONArray arry = new JSONArray();
		
		
		
		int roomseq = cdto.getRoomseq();
		int max = cdao.getMax(roomseq);		
		chatList = cdao.getList(cdto.getRoomseq());
		
		int result = cdao.getCheck(max);
		
		for(ChatDTO chat : chatList) {
			obj = new JSONObject();
			obj.put("fromId", chat.getuserId());
			obj.put("toId", chat.getToId());
			obj.put("chatTime", chat.getchatDate());
			obj.put("contents", chat.getcontents());
			obj.put("chatId", chat.getchatseq());
			obj.put("max", max);
			arry.add(obj);
		}
		response.getWriter().println(arry);
		response.setContentType("application/json");
		
	}

}


















