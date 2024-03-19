//package com.lemonmarket.web.servlet.product;
//
//import java.io.IOException;
//
//import org.json.simple.JSONObject;
//
//
//import com.lemonmarket.web.action.Action;
//import com.lemonmarket.web.action.ActionForward;
//import com.lemonmarket.web.dao.ProductDAO;
//import com.lemonmarket.web.dto.UserDTO;
//
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//public class UpdateInterestCountAction {
//	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		
//		JSONObject obj = null;
//		int productId = Integer.parseInt(request.getParameter("productId"));
//		int interest = Integer.parseInt("interest");
//		ProductDAO pdao = new ProductDAO();
//
//		obj = new JSONObject();
//		
//		HttpSession session = request.getSession(); // 세션을 가져옵니다.
//		UserDTO udto = (UserDTO) session.getAttribute("userDTO");
//		String userid = udto.getUserId();
//		
//		int productInterestCount = pdao.updateInterestCount(userid);
////		int interest = pdao.getInterest(productId);
//		int result = 6;
//		System.out.println(interest); //test
//
//		obj.put("interest", interest);// 하고싶은거에 따라 추가
//
//		response.getWriter().println(obj);
//		response.setContentType("application/json");
//		
//		
//		
//
//		
//
//		
//		
//
//	
//	}
//}
package com.lemonmarket.web.servlet.product;


