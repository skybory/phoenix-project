package com.lemonmarket.web.servlet.product;

import java.io.IOException;
import java.util.HashMap;

import org.json.simple.JSONObject;


import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dto.UserDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateInterestCountAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		JSONObject obj = null;
		System.out.println(request.getParameter("userIdx"));
		int prIdx = Integer.parseInt(request.getParameter("prIdx"));
		int userIdx = Integer.parseInt(request.getParameter("userIdx"));
		ProductDAO pdao = new ProductDAO();
		obj = new JSONObject();
		HashMap<String, Integer> list = new HashMap<>();
		list.put("userIdx", userIdx);
		list.put("prIdx", prIdx);
		int confirm = pdao.confirm(list);
		if(confirm == 0) {
			pdao.insertInterset(list);
		}else {
			int check = pdao.checkWish(list);
			if(check ==0) {
				pdao.upInterest(list);
			}else if(check == 1) {
				pdao.downInterest(list);
				
			}
		}

		
		int result = pdao.getInterest(prIdx);

		obj.put("result", result);// 하고싶은거에 따라 추가

		response.getWriter().println(obj);
		response.setContentType("application/json");
		
		
		

		

		
		

	
	}
}
