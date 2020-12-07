package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class LoginService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
//		System.out.println(id+"  "+pwd);
	
		LoginDAO dao=new LoginDAO();
		LoginDTO entity=dao.getLoginUser(id,pwd);
		
		if(entity != null) {
			//세션설정
			HttpSession session=request.getSession();
			session.setAttribute("logOK", entity);
			return "login/loginOK.jsp";
		}else {
			return "login/loginFail.jsp";
		}
	}
}









