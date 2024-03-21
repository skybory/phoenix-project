package com.lemonmarket.web.servlet.product;

import java.io.IOException;
import java.util.HashMap;

import org.json.simple.JSONObject;

import com.lemonmarket.web.dao.ChatDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GetItem {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONObject obj = new JSONObject();
		HashMap<String, Integer> list= new HashMap<>();
		int prIdx = Integer.parseInt(request.getParameter("prIdx"));
		ChatDAO cdao = new ChatDAO();
		
		int room = cdao.getRoomCnt(prIdx);
		
		int interest = cdao.getInterCnt(prIdx);
		
		list.put("PrIdx", prIdx);
		list.put("totInterest", interest);

		list.put("roomPrIdx", prIdx);
		list.put("totRoomList", room);
		
		cdao.UpdateProductCnt(list);
		
		cdao.UpdateroomCnt(list);
		System.out.println(interest);
		obj.put("roomCnt", room);
		obj.put("interCnt", interest);
		
		response.getWriter().println(obj);
		response.setContentType("application/json");
		
	}
}
