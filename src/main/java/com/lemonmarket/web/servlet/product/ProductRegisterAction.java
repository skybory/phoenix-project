package com.lemonmarket.web.servlet.product;

import com.lemonmarket.web.dto.ProductDTO;

import com.lemonmarket.web.dto.UserDTO;
import com.lemonmarket.web.dao.ProductDAO;
import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.Collection;

@WebServlet("/product/ProductRegisterAction.pr")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductRegisterAction extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 멀티파트 요청 처리 코드 작성
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = new ProductDTO();
		HttpSession session = request.getSession();
		UserDTO udto = (UserDTO) session.getAttribute("userDTO");
		String userId = udto.getUserId();
		int userIdx = udto.getUserIdx();
		String productLocation = udto.getUserAddress();
		ActionForward forward = new ActionForward();

		String productDealType = request.getParameter("productDealType");
		pdto.setUserIdx(userIdx);
		pdto.setUserId(userId);
		pdto.setProductTitle(request.getParameter("productTitle"));
		pdto.setProductDescription(request.getParameter("productDescription"));
		pdto.setProductDealType(productDealType);
		
		if(productDealType.equals("share")) {
			pdto.setProductPrice(0);
		} else {
			pdto.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
		}
		
		pdto.setProductLocation(request.getParameter("productLocation"));
		pdto.setCategoryIdx(Integer.parseInt(request.getParameter("categoryIdx")));
		pdto.setProductLocation(productLocation);
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
		    if (part.getName().equals("productImage")) {
		        String fileName = getFileName(part);
		        if (!fileName.isEmpty()) {
		            // 띄어쓰기를 제거하여 파일명을 수정
		            fileName = fileName.replaceAll("\\s+", "");
		            String uploadDirectory = "/productImage";
		            String realPath = getServletContext().getRealPath(uploadDirectory);
		            if (realPath != null) {
		                File uploadDir = new File(realPath);
		                if (!uploadDir.exists()) {
		                    uploadDir.mkdir(); // 디렉토리가 존재하지 않으면 생성
		                }
		                String filePath = realPath + File.separator + fileName;
		                part.write(filePath);
		                pdto.setProductImage(uploadDirectory + "/" + fileName); // 데이터베이스에 저장될 경로 설정
		            } else {
		                // 서블릿 컨텍스트의 실제 경로를 가져올 수 없음
		                // 오류 처리 또는 적절한 예외 처리
		            }
		        }
		    }
		}

		if (pdao.register(pdto)) { // 물품 등록 성공
			forward.setPath("/board/Home.bo");
			forward.setRedirect(false);
		} else {
			forward.setPath("/board/Error.bo"); // 물품 등록 실패
			forward.setRedirect(true);
		}

		// 페이지 이동
		if (forward != null) {
			if (forward.isRedirect()) { // Redirect 방식
				response.sendRedirect(forward.getPath());
			} else { // forward 방식
				request.getRequestDispatcher(forward.getPath()).forward(request, response);
			}
		}
	}

	private String getFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return "";
	}
}