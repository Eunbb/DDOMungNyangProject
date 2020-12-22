package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;

import controller.CommandAction;

public class BoardInsertService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		
		//데이터 저장
		BoardDTO dto=new BoardDTO();
		dto.setId(id);
		dto.setName(name);
		dto.setSubject(subject);
		dto.setContent(content);
		
		//insert DB
		BoardDAO boardDao=new BoardDAO();
		int n=boardDao.boardInsert(dto);
		
//		System.out.println("n:" +n);
		request.setAttribute("n", n);
		return "qna/qnaInsert.jsp";
	}
}







