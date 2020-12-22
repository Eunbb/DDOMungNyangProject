package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.CommandAction;

public class BoardReplyFormService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 얻어오기
		int pseq = Integer.parseInt(request.getParameter("pseq"));	//원글번호
	    int pg = Integer.parseInt(request.getParameter("pg"));		//원글페이지
		
	    request.setAttribute("pseq", pseq);
	    request.setAttribute("pg", pg);
	    
	    return "qna/qnaReplyForm.jsp";
	}
}