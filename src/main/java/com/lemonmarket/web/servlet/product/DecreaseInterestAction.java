package com.lemonmarket.web.servlet.product;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.json.simple.JSONObject;

import com.lemonmarket.web.dao.ProductDAO;

public class DecreaseInterestAction {

	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		JSONObject obj = null;
		obj = new JSONObject();
		ProductDAO pdao = new ProductDAO();
		
		int prId = Integer.parseInt(req.getParameter("productId"));
		int inter = Integer.parseInt(req.getParameter("interestCount"));
		inter = pdao.DecreaseInterestCount(prId) ? -1 : 1;
		int result = 6; 
		System.out.println(inter);

		obj.put("inter", inter);// 하고싶은거에 따라 추가
		
		
		
		resp.getWriter().println(obj);
		resp.setContentType("application/json");
	}

}
