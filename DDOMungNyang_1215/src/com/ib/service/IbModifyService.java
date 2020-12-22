package com.ib.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.ib.dao.ImageBoardDao;
import com.ib.dto.IbDTO;

import controller.CommandAction;

//수정하기 화면으로 보낼 데이터가져오기
public class IbModifyService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 얻어오기
	    int petid = Integer.parseInt(request.getParameter("petid"));
	    int pg = Integer.parseInt(request.getParameter("pg"));

	    //select DB
	    ImageBoardDao dao = new ImageBoardDao();	    
	    IbDTO dto=dao.getDog(petid);	//데이터받아오기
	    
	    request.setAttribute("dto", dto);
	    request.setAttribute("pg", pg);
	    request.setAttribute("petid", petid);
	    
	    return "dogboard/dogModify.jsp";
	}
}
