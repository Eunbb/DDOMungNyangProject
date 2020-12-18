package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dto.BoardDTO;
import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class MyProModifyService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		LoginDTO dto=new LoginDTO(
				request.getParameter("id"),
				request.getParameter("pw"),
				request.getParameter("repw"),
				request.getParameter("name"),
				request.getParameter("nick"),
				request.getParameter("birth")
				);
	
		new LoginDAO().getLoginModify(dto);
		
		return "login/loginUpdate.jsp";
	}
}



