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


@WebServlet(name = "CheckpwServlet", urlPatterns = { "/CheckpwServlet" })
public class CheckpwServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      JSONObject obj = new JSONObject();
      PrintWriter out = response.getWriter();
      
      //ajax로 값 받아오기
      String id = request.getParameter("id");
      String pwd = request.getParameter("pwd");
      
      //값 확인
      System.out.println("Check 들어옴");
      System.out.println("id  : " + id);
      System.out.println("pwd  : " + pwd);
      
	  LoginDAO dao=new LoginDAO();
	  LoginDTO entity=dao.getLoginUser(id,pwd);
	
	  obj.put("id",entity.getId());
      obj.put("pwd",entity.getPw());

      out.print(obj.toString());
   }

}
