package com.lemonmarket.web.servlet.product;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.json.simple.JSONObject;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.ProductDAO;

public class DecreaseInterestAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		JSONObject obj = null;
		obj = new JSONObject();
		ProductDAO pdao = new ProductDAO();

		int prId = Integer.parseInt(request.getParameter("productId"));
		int inter = Integer.parseInt(request.getParameter("interestCount"));
		inter = pdao.updateInterestCount(prId) ? -1 : 1;
		int result = 6;
		System.out.println(inter);

		obj.put("inter", inter);// 하고싶은거에 따라 추가

		response.getWriter().println(obj);
		response.setContentType("application/json");

	}
}
