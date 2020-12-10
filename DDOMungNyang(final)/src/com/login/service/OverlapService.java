package com.login.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;



public class OverlapService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		System.out.println("OV : " + id);
		LoginDAO dao = new LoginDAO();
		
		String str = dao.overlap(id);
		System.out.println("OV : " + str);
		if(str == null) {
			str= "";
		}
		
		request.setAttribute("id", str);
		return "login/register.jsp";
	}
	
       
   

}
