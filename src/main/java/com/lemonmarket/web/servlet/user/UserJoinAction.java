package com.lemonmarket.web.servlet.user;

import com.lemonmarket.web.dto.UserDTO;

import com.lemonmarket.web.dao.UserDAO;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import com.lemonmarket.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/user/UserJoinAction.us")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UserJoinAction extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		ActionForward forward = new ActionForward();

		udto.setUserId(request.getParameter("userId"));
		udto.setUserPw(request.getParameter("userPw"));
		udto.setUserName(request.getParameter("userName"));
		udto.setUserAge(request.getParameter("userAge"));
		udto.setUserGender(request.getParameter("userGender"));
		udto.setUserPhoneNumber(request.getParameter("userPhoneNumber"));
		udto.setUserEmail(request.getParameter("userEmail"));
		udto.setUserAddress(request.getParameter("userAddress"));
		
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
		    if (part.getName().equals("userImage")) {
		        String fileName = getFileName(part);
		        if (!fileName.isEmpty()) {
		            // 띄어쓰기를 제거하여 파일명을 수정
		            fileName = fileName.replaceAll("\\s+", "");
		            String uploadDirectory = "/userImage";
		            String realPath = getServletContext().getRealPath(uploadDirectory);
		            if (realPath != null) {
		                File uploadDir = new File(realPath);
		                if (!uploadDir.exists()) {
		                    uploadDir.mkdir(); // 디렉토리가 존재하지 않으면 생성
		                }
		                String filePath = realPath + File.separator + fileName;
		                part.write(filePath);
		                udto.setUserImage(uploadDirectory + "/" + fileName); // 데이터베이스에 저장될 경로 설정
		            } else {
		                // 서블릿 컨텍스트의 실제 경로를 가져올 수 없음
		                // 오류 처리 또는 적절한 예외 처리
		            }
		        }
		    }
		}
		if (udao.join(udto)) { // 회원가입 성공

			HttpSession session = request.getSession(); // 세션을 가져옵니다.
			String userId = udto.getUserId();
			String userPw = udto.getUserPw();
			// 로그인함과 동시에 세션에 유저값 저장
			udao.login(userId, userPw, session);
			forward.setPath("/board/Home.bo");
			forward.setRedirect(false);
		} else {
			forward.setPath("/board/Join.bo");
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
