package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class MyProModifyService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");
		
		LoginDTO dto=new LoginDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setRepw(request.getParameter("repw"));
		dto.setName(request.getParameter("name"));
		dto.setNick(request.getParameter("nick"));
		dto.setBirth(request.getParameter("birth"));
	
		new LoginDAO().getLoginModify(dto);
		
		return "login/loginUpdate.jsp";
	}
}



