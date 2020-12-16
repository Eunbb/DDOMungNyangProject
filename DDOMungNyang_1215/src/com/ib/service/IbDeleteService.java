package com.ib.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.ib.dao.ImageBoardDao;

import controller.CommandAction;

public class IbDeleteService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 얻어오기
		int petid = Integer.parseInt(request.getParameter("petid"));
	    int pg = Integer.parseInt(request.getParameter("pg"));
	    
	    //delete DB
	    ImageBoardDao dao = new ImageBoardDao();
	    dao.dogDelete(petid);
	    
	    
	    request.setAttribute("pg", pg);
		
	    return "dogboard/dogDelete.jsp";
	}
}
