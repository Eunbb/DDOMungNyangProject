package com.login.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class MemberDeleteService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id=request.getParameter("id");
		System.out.println("받아온 아이디값 : " + id);
		new LoginDAO().memberDelete(id);
		
		return "login/memberDelete.jsp";
	}
}