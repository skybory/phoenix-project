package com.lemonmarket.web.servlet.product;

import java.io.IOException;

import org.json.simple.JSONObject;

import com.lemonmarket.web.dao.ChatDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GetItem {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONObject obj = new JSONObject();
		
		int prIdx = Integer.parseInt(request.getParameter("prIdx"));
		ChatDAO cdao = new ChatDAO();
		
		int room = cdao.getRoomCnt(prIdx);
		int interest = cdao.getInterCnt(prIdx);
		
		
		obj.put("roomCnt", room);
		obj.put("interCnt", interest);
		
		response.getWriter().println(obj);
		response.setContentType("application/json");
		
	}
}
