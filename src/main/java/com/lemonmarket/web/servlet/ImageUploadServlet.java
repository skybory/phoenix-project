//package com.lemonmarket.web.servlet;
//
//import java.io.File;
//import java.io.IOException;
//import java.io.InputStream;
//import java.nio.file.Files;
//import java.nio.file.Paths;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.Part;
//
//@WebServlet("/upload")
//@MultipartConfig
//public class ImageUploadServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // 이미지 파일을 받아서 저장할 경로
//    	String uploadDirectory = "C:\\Users\\TYKIM\\Desktop"; // EC2의 경로로 수정
//        File uploadDir = new File(uploadDirectory);
//        if (!uploadDir.exists()) {
//            uploadDir.mkdirs();
//        }
//
//        // 이미지 파일을 저장
//        for (Part part : request.getParts()) {
//            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//            try (InputStream fileContent = part.getInputStream()) {
//                Files.copy(fileContent, Paths.get(uploadDirectory, fileName));
//            }
//        }
//
//        response.getWriter().println("이미지가 업로드되었습니다.");
//    }
//}