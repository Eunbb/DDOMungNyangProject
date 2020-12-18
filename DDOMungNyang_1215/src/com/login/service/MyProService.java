package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class MyProService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id=request.getParameter("id");
	
		LoginDAO dao=new LoginDAO();
		LoginDTO dto=dao.getLoginData(id);
		
		request.setAttribute("dto", dto);
		
		return "login/profile.jsp";
	}
}




