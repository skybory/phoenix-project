package com.lemonmarket.web.servlet;

import java.io.IOException;
import java.util.List;

import com.lemonmarket.web.action.ActionForward;
import com.lemonmarket.web.dao.CategoryDAO;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.dto.CategoryDTO;
import com.lemonmarket.web.dto.ProductDTO;
import com.lemonmarket.web.servlet.category.SelectCategoryAction;
import com.lemonmarket.web.servlet.product.ProductViewMainAction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;

		// 화면 이동

		// 예시

 
		switch (requestURI) {
		case "/board/Home.bo":
			forward = new ActionForward(true, "/index.jsp");
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/board/Map.bo":
			forward = new ActionForward(true, "/map/map.jsp");
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/board/Contact.bo":
			forward = new ActionForward(true, "/contact/contact.jsp");
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/board/About.bo":
			forward = new ActionForward(true, "/about/about.jsp");
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/board/Product.bo":
			forward = new ProductViewMainAction().execute(req, resp);
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/board/Faq.bo":
			forward = new ActionForward(true, "/faq/faq.jsp");
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/board/MyPage.bo":
			forward = new ActionForward(true, "/myPage/myPage.jsp");
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/board/Login.bo":
			forward = new ActionForward(true, "/user/loginview.jsp");
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/board/Join.bo":
			forward = new ActionForward(true, "/user/joinview.jsp");
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/board/Category.bo":
			//카테고리 리스트 가져옴
			forward = new SelectCategoryAction().execute(req, resp);
	        break;
		case "/board/Chatting.bo":
	        ProductDAO pdao = new ProductDAO();
	        int productIdx = Integer.parseInt(req.getParameter("productIdx"));
	        System.out.println(productIdx);
	        ProductDTO pdto = pdao.viewProductDetail(productIdx);
	        req.setAttribute("pdto", pdto);
			forward = new ActionForward(true, "/chatting/chatting.jsp");
			// 화면을 바로 보여줄땐 ActionForward
			break;
		case "/board/ERROR.bo":
			forward = new ActionForward(true, "/error.jsp");
			// 화면을 바로 보여줄땐 ActionForward
			break;

//		case "/board/BoardList.bo":
//			forward = new BoardListAction().execute(req, resp);
//			break;
//			
//		case "/board/boardwriteOK.bo":
//			forward = new BoardWriteOKAction().execute(req,resp);
//			break;

		}

		// 윗부분 작성 후 아래부분 주석해제 할것.
		// 페이지 이동에 대한 일괄처리
		if (forward != null) {
			if (forward.isRedirect()) { // Redirect 방식
				resp.sendRedirect(forward.getPath());
			} else { // forward 방식
				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
			}

		}
	}
}
