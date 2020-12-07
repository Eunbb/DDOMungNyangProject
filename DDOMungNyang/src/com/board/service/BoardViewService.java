package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;

import controller.CommandAction;

//상세보기
public class BoardViewService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 얻어오기
		int seq = Integer.parseInt(request.getParameter("seq")); //글번호
		int pg = Integer.parseInt(request.getParameter("pg"));   //되돌아갈 페이지
		
		//select DB
		BoardDAO boardDao=new BoardDAO();
		boardDao.updateHit(seq);              //조회수
		
		BoardDTO dto=boardDao.getBoard(seq);  //글번호에 해당하는 데이터 가져오기
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		request.setAttribute("seq", seq);
		
		return "board/boardView.jsp";
	}
}









