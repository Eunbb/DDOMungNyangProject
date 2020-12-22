package com.login.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.board.dao.BoardDAO;
import com.ib.dto.IbDTO;


@WebServlet(name = "PlusHeartServlet", urlPatterns = { "/PlusHeartServlet" })
public class PlusHeartServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      //ajax로 값 받아오기
      String petid = request.getParameter("petid");
      int heart = Integer.parseInt(request.getParameter("heart"));
      
      //값 확인
      System.out.println("Check 들어옴");
      System.out.println("petid  : " + petid);
      System.out.println("heart  : " + heart);
      
      //heart+1
      heart = heart+1;
      IbDTO dto = new IbDTO(Integer.parseInt(petid), heart);
      
      BoardDAO dao = new BoardDAO();
      int n = dao.updateHeart(dto);
      if(n>0) {			//업데이트 성공했을 경우
    	  dto = dao.getDog(dto.getPetid());
    	  System.out.println("하트값 : "+dto.getHeart());
      }else {
    	  System.out.println("하트업데이트 오류");
      }

      JSONObject obj = new JSONObject();
      obj.put("heart",dto.getHeart());
      obj.put("petid",dto.getPetid());

      out.print(obj.toString());
   }

}
