<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<%

	/* String name = request.getParameter("name"); */

	String Exam1 = request.getParameter("exercise");
	String Exam2 = request.getParameter("Travelbook");
	String Exam3 = request.getParameter("song");
	String Exam4 = request.getParameter("Style");

	int Ex1 =Integer.parseInt(Exam1);
	int Ex2 =Integer.parseInt(Exam2);
	int Ex3 =Integer.parseInt(Exam3);
	int Ex4 =Integer.parseInt(Exam4);
	int total=Ex1+Ex2+Ex3+Ex4;
	
	if(total>=26){
		pageContext.forward("munchiken.jsp");
 	}
	else if(total<26 && total>=18){
		pageContext.forward("poodle.jsp");
	}
	else if(total<18 && total>=11){
		pageContext.forward("russianblue.jsp");
	}
	else if(total<11 && total>=6){
		pageContext.forward("chiwawa.jsp");
	}
	else{
		pageContext.forward("sichu.jsp");
		
	}
	%>




<!-- 포워딩 시키면 클라이언트에서 올라오는 데어터를 받을 수 있다.

그리고 매개변수로 getParameter를 이용하여 받을 수 있다. -->






	


