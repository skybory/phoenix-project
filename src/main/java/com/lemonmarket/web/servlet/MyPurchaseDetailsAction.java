package com.lemonmarket.web.servlet;

import com.lemonmarket.web.action.Action;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MyPurchaseDetailsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("구매버튼기능");
		System.out.println("구매버튼기능");
		System.out.println("구매버튼기능");
		
		
		ActionForward forward = new ActionForward();
		return forward;
	}

}
