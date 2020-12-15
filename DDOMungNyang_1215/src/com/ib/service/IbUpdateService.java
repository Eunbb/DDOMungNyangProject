package com.ib.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTMLDocument.HTMLReader.ParagraphAction;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;
import com.ib.dto.IbDTO;

import controller.CommandAction;

public class IbUpdateService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 얻어오기
		request.setCharacterEncoding("UTF-8");
		int pg = Integer.parseInt(request.getParameter("pg"));
		int petid=Integer.parseInt(request.getParameter("petid"));
		
		IbDTO dto=new IbDTO(
				petid,
				request.getParameter("classify1"),
				request.getParameter("classify2"),
				request.getParameter("korname"),
				request.getParameter("engname"),
				request.getParameter("gender"),
				request.getParameter("age"),
				request.getParameter("price"),
				request.getParameter("jusa"),
				request.getParameter("pic"));
		
		//update DB
		BoardDAO dao=new BoardDAO(); 
		dao.dogUpdate(dto);
		
		request.setAttribute("pg",pg);
		
		return "dogboard/dogUpdate.jsp";
	}
}
