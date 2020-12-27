package com.login.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class MemberService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		LoginDAO dao=new LoginDAO();
		List<LoginDTO> list =dao.getMemberList();
		
		request.setAttribute("list", list);
		
		return "login/member.jsp";
	}
}