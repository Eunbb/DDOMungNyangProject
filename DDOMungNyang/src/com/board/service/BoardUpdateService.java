package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;

import controller.CommandAction;

public class BoardUpdateService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 얻어오기
		request.setCharacterEncoding("UTF-8");
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		BoardDTO dto=new BoardDTO();
		dto.setSeq(Integer.parseInt(request.getParameter("seq")));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setEmail(request.getParameter("email"));

		//update DB
		BoardDAO dao=new BoardDAO(); 
		dao.boardUpdate(dto);
		
		request.setAttribute("pg",pg);
		
		return "board/boardUpdate.jsp";
	}
}
