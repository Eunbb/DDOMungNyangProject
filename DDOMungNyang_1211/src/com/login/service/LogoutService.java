package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.login.dto.LoginDTO;
import controller.CommandAction;

public class LogoutService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session=request.getSession();
		LoginDTO entity=(LoginDTO)session.getAttribute("logOK");
		
		if(entity != null)
		{
			session.removeAttribute("logOK"); //or session.invalidate();   
			return "index.jsp";
		}
		return null;
	}

}
