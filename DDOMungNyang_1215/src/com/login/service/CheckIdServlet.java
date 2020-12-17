package com.login.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.ib.dto.IbDTO;


@WebServlet(name = "CheckIdServlet", urlPatterns = { "/CheckIdServlet" })
public class CheckIdServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      String petid = request.getParameter("petid");
      System.out.println("Check 들어옴");
      System.out.println("petid  : " + petid);
      
      BoardDAO dao = new BoardDAO();
      int n = dao.updateHeart(Integer.parseInt(petid));
      if(n>0) {
    	  IbDTO dto = dao.getDog(Integer.parseInt(petid));
    	  int result = dto.getHeart();
    	  System.out.println(result+"");
      }else {
    	  System.out.println("하트업데이트 오류");
      }

      response.getWriter().write(new BoardDAO().updateHeart(Integer.parseInt(petid))+ "");
   }

}
