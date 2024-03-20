//package com.lemonmarket.web.servlet.chatting;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//
//import com.lemonmarket.web.dao.ChatDAO;
//import com.lemonmarket.web.dto.RoomDTO;
//
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//public class ChattingRoomGetList {
//	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		
//		List<RoomDTO> roomList = new ArrayList<>();
//		ChatDAO cdao = new ChatDAO();
//		RoomDTO rdto = new RoomDTO();
//		JSONObject obj = null;		
//		JSONArray arry = new JSONArray();
//		
//		
//		
//		String userid = request.getParameter("userid");
//		rdto.setPrName(request.getParameter("prName"));
//		rdto.setfromId(userid);
//		
//			
//		roomList  = cdao.getRoomList(userid);
//		
//		
//		for(RoomDTO room : roomList) {
//			obj = new JSONObject();
//			obj.put("roomseq", room.getRoomSeq ());
//			obj.put("contents", cdao.getRecentContents(room.getRoomSeq()));
//			obj.put("userId", room.getfromId ());
//			obj.put("prName", room.getPrName());
//			obj.put("toId", room.getToId());
//			obj.put("roomDate", room.getRoomDate());
//			arry.add(obj);
//		}
//		response.getWriter().println(arry);
//		response.setContentType("application/json");
//		
//	}
//}
