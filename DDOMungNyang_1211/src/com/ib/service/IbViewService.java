package com.ib.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.ib.dto.IbDTO;

import controller.CommandAction;

//상세보기
public class IbViewService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 얻어오기
		int petid = Integer.parseInt(request.getParameter("petid")); //글번호
		int pg = Integer.parseInt(request.getParameter("pg"));   //되돌아갈 페이지
		
		//select DB
		BoardDAO boardDao=new BoardDAO();
		boardDao.updateHit(petid);              //조회수
		
		IbDTO dto=boardDao.getDog(petid);  //글번호에 해당하는 데이터 가져오기
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		request.setAttribute("petid", petid);
		
		return "dogView.jsp";
	}
}









