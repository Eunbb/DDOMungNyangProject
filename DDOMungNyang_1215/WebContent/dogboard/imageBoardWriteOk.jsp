<%@page import="com.ib.dto.IbDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<%
   IbDTO entity = (IbDTO) session.getAttribute("bwaOK");
%>
<body>
   <script>
      
   <%if (entity.getClassify1().equals("1") && entity.getClassify2().equals("A1")) {%>
      alert("이미지 등록 완료");
      location.href = "/bbs/Iblist1.do?pg=1";
   <%} else if (entity.getClassify1().equals("1") && entity.getClassify2().equals("A2")) {%>
      alert("이미지 등록 완료");
      location.href = "/bbs/Iblist2.do?pg=1";
   <%} else if (entity.getClassify1().equals("1") && entity.getClassify2().equals("A3")) {%>
      alert("이미지 등록 완료");
      location.href = "/bbs/Iblist3.do?pg=1";
   <%} else if (entity.getClassify1().equals("2") && entity.getClassify2().equals("A1")) {%>
      alert("이미지 등록 완료");
      location.href = "/bbs/Iblist4.do?pg=1";
   <%} else if (entity.getClassify1().equals("2") && entity.getClassify2().equals("A2")) {%>
      alert("이미지 등록 완료");
      location.href = "/bbs/Iblist5.do?pg=1";
   <%} else if (entity.getClassify1().equals("2") && entity.getClassify2().equals("A3")) {%>
      alert("이미지 등록 완료");
      location.href = "/bbs/Iblist6.do?pg=1";
   <%} else {%>
      alert("이미지 등록 실패");
      location.href = "/bbs/Iblist1.do?pg=1";
   <%System.out.println("OK : " + entity.getClassify1());
            System.out.println("OK2 : " + entity.getClassify2());
         }%>
      
   </script>
</body>
</html>