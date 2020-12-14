package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;

import controller.CommandAction;

public class BoardReplyService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
 		  //데이터 얻어오기
	      request.setCharacterEncoding("UTF-8");

	      int pseq = Integer.parseInt(request.getParameter("pseq"));//원글번호
	      int pg = Integer.parseInt(request.getParameter("pg"));    //원글페이지

	      //데이터 저장
	      String id=request.getParameter("id");
	      String name=request.getParameter("name");
	      String email=request.getParameter("email");
	      String subject=request.getParameter("subject");
	      String content=request.getParameter("content");
		
        //데이터 저장
	      BoardDTO dto=new BoardDTO();
	      dto.setId(id);
	      dto.setName(name);
	      dto.setEmail(email);
	      dto.setSubject(subject);
	      dto.setContent(content);
	      dto.setPseq(pseq);//원글번호
	      
	      //insert DB
	      BoardDAO dao=new BoardDAO();
	      dao.boardReply(dto);
	      
	      request.setAttribute("pg", pg);
	      
	      return "qna/qnaReply.jsp";
	}
}
