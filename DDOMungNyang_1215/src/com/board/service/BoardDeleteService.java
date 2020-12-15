package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;

import controller.CommandAction;

public class BoardDeleteService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 얻어오기
		int seq = Integer.parseInt(request.getParameter("seq"));
	    int pg = Integer.parseInt(request.getParameter("pg"));
	    
	    //delete DB
	    BoardDAO dao = new BoardDAO();
	    dao.boardDelete(seq);
	    
	    
	    request.setAttribute("pg", pg);
		
	    return "qna/qnaDelete.jsp";
	}
}
