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

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import netscape.javascript.JSObject;

public class ChattingNewGet{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		
		ChatDAO cdao = new ChatDAO();
		int max = Integer.parseInt(request.getParameter("max"));
		List<ChatDTO> chatList = new ArrayList<>();
		System.out.println("이거너냐?:"+max);
		JSONObject obj = null;
		JSONArray arry = new JSONArray();
		ChatDTO cdto = new ChatDTO();
		cdto.setMax(max);
		cdto.setRoomseq(Integer.parseInt(request.getParameter("roomseq")));
		chatList = cdao.getNewList(cdto);
		max = cdao.getMax(Integer.parseInt(request.getParameter("roomseq")));
		System.out.println(max);
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
//
		response.getWriter().println(arry);
		response.setContentType("application/json");
		


	}

}
