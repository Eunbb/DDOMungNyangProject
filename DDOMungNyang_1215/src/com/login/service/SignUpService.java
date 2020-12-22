package com.login.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class SignUpService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		System.out.println("id : " + id);
		String pw = request.getParameter("pw");
		System.out.println("pw : " + pw);
		String repw = request.getParameter("repw");
		System.out.println("repw : " + repw);
		String name = request.getParameter("name");
		System.out.println("name : " + name);
		String nick = request.getParameter("nick");
		System.out.println("nick : " + nick);
		String brith = request.getParameter("yy");
		brith += request.getParameter("mm") + request.getParameter("dd");
		System.out.println("brith : " + brith);
	
		// 데이터 저장
		LoginDTO dto = new LoginDTO();
		dto.setId(id);
		dto.setPw(pw);
		dto.setRepw(repw);
		dto.setName(name);
		dto.setNick(nick);
		dto.setBirth(brith);
		

		LoginDAO dao = new LoginDAO();
		int n = dao.signUp(dto);
		
		
		request.setAttribute("n", n);
		if (n > 0) {
			System.out.println("sign ok");
			return "login/signUpOK.jsp";
		} else {
			System.out.println("sign fail");
			return "login/loginFail.jsp";
		}

	}

}
