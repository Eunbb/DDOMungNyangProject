package com.ib.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		IbDTO dto=new IbDTO();
		dto.setDogkortype(request.getParameter("korname"));


		//update DB
		BoardDAO dao=new BoardDAO(); 
		dao.dogUpdate(dto);
		
		request.setAttribute("pg",pg);
		
		return "dogUpdate.jsp";
	}
}
