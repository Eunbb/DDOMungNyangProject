package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;

import controller.CommandAction;

//수정하기 화면으로 보낼 데이터가져오기
public class BoardModifyService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 얻어오기
	    int seq = Integer.parseInt(request.getParameter("seq"));
	    int pg = Integer.parseInt(request.getParameter("pg"));

	    //select DB
	    BoardDAO dao=new BoardDAO();
	    BoardDTO dto=dao.getBoard(seq);
	    
	    request.setAttribute("dto", dto);
	    request.setAttribute("seq", seq);
	    request.setAttribute("pg", pg);
	    
	    return "qna/qnaModify.jsp";
	}
}
