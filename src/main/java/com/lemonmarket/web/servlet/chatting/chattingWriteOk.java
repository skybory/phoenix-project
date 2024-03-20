package com.lemonmarket.web.servlet.chatting;

import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

//import org.apache.jasper.tagplugins.jstl.core.Out;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ChatDAO;
import com.lemonmarket.web.dto.ChatDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class chattingWriteOk {

    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/plain"); // 응답의 컨텐츠 타입 설정
        JSONObject obj = new JSONObject();
        ChatDTO cdto = new ChatDTO();
        ChatDAO cdao = new ChatDAO();
        int roomIdx = Integer.parseInt(request.getParameter("roomIdx"));
        int prIdx = cdao.getProductIdx(roomIdx);
        cdto.setUserId(request.getParameter("userId"));
        cdto.setToId(cdao.getProductName(prIdx));
        cdto.setContents(request.getParameter("contents"));
        cdto.setRoomIdx(roomIdx);
        cdao.submit(cdto);
        int max = cdao.getMax(roomIdx);
        System.out.println(max);
        
        obj.put("max", max);
        
        
		response.getWriter().println(obj);
		response.setContentType("application/json");
		
                // 응답으로 1을 보내기
    }
}
