package com.login.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;


@WebServlet(name = "CheckEmailServlet", urlPatterns = { "/CheckEmailServlet" })
public class CheckEmailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      JSONObject obj = new JSONObject();
      PrintWriter out = response.getWriter();
      
      //ajax로 값 받아오기
      String id = request.getParameter("id");
      
      //값 확인
      System.out.println("Check 들어옴");
      System.out.println("id  : " + id);
      
	  LoginDAO dao=new LoginDAO();
	  LoginDTO entity=dao.getLoginData(id);

	  if(entity==null) {
		  obj.put("id",0);		//아이디가 존재하지 않음(사용할 수 있음)
	  } else {
		  obj.put("id",1);		//아이디가 존재함(사용할 수 없음)
	  }
	  
      out.print(obj.toString());
   }

}
