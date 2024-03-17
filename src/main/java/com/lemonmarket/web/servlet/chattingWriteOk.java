package com.lemonmarket.web.servlet;

import java.io.IOException;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ChatDAO;
import com.lemonmarket.web.dto.ChatDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class chattingWriteOk {

    public void execute(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/plain"); // 응답의 컨텐츠 타입 설정

        ChatDTO cdto = new ChatDTO();
        ChatDAO cdao = new ChatDAO();
        String userid = request.getParameter("userid");
        cdto.setuserId(userid);
        cdto.setToId(request.getParameter("toid"));
        cdto.setcontents(request.getParameter("contents"));
        cdto.setRoomseq(Integer.parseInt(request.getParameter("roomseq")));
        System.out.println(cdto.getcontents());
        cdao.submit(cdto);

                // 응답으로 1을 보내기
    }
}