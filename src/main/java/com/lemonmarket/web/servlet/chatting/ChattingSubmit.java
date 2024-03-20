package com.lemonmarket.web.servlet.chatting;

import org.apache.ibatis.session.SqlSession;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ChatDAO;
import com.lemonmarket.web.dto.ChatDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ChattingSubmit implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward ();
		
		ChatDTO cdto = new ChatDTO();
		cdto.setUserId(request.getParameter("userid"));
		cdto.setToId(request.getParameter("toid"));
		cdto.setContents(request.getParameter("contents"));
		
		ChatDAO cdao = new ChatDAO();
		System.out.println("gd");
		if(cdao.insertChatting(cdto)) {
			
			forward.setPath("/index.jsp");
		}
//		if(cdto.getFromId() == null || cdto.getFromId() == "") {
//			//회원가입이 안된 사람이면 메인페이지로 보내기
//		}else {
//			// 잘 보내지면 채팅방 목록 다시불러오기
//			forward.setPath("/chatting.jsp");
//		}
//		request.setAttribute("chat", cdto);
		forward.setRedirect(false);
		
		
		

			
		
		return forward;
		
	}


}
