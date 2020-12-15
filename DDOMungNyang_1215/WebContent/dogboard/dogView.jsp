<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ib.dto.Ibpaging"%>
<%@page import="com.ib.dto.IbDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	IbDTO dto=(IbDTO)request.getAttribute("dto");
	int pg=(Integer)request.getAttribute("pg");
	int petid=(Integer)request.getAttribute("petid");
%>
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<script>
function del() {
	   var del = confirm("삭제할까요?");
	   if(del){
    	  location.href='dogDelete.do?petid=<%=petid%>&pg=<%=pg%>'
	   }
	}
</script>
	<head>
		<title>Dopetrope by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="right-sidebar is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">

					<!-- Logo -->
						<h1><a href="/bbs/index.jsp">Q & A</a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="index.jsp">Home</a></li>
								<li><a href="dog.html">강아지분양</a></li>
								<li><a href="cat.html">고양이 분양</a></li>
								<li><a href="abandoned.html">유기동물 분양</a></li>
								<li><a href="service.html">서비스</a></li>
								<li><a href="/bbs/boardList.do?pg=1">Q&A</a></li>
							</ul>
						</nav>

				</section>

<!-- boardView -->
<table width="500">
<tr>
	<td colspan="3" bgcolor="777777"></td>
</tr>

<tr>
	<td colspan="3"><font size="5"><%=dto.getDogkortype()%></font></td>
</tr>

<tr>
	<td colspan="3" bgcolor="777777"></td>
</tr>
<tr>
	<td width="150">성별 :<%=dto.getGender()%></td>
</tr>
<tr>
	<td colspan="3" bgcolor="777777"></td>
</tr>

<tr>
	<td colspan="3" height="200" valign="top"><img src="/bbs/uploadImage/<%=dto.getPic()%>" alt="" /></td>
</tr>

<tr>
	<td colspan="3" bgcolor="777777"></td>
</tr>
</table>

<input type="button" value="목록" onclick="location.href='/bbs/Iblist.do?pg=1'">
<%-- <%
	LoginDTO log=(LoginDTO)session.getAttribute("logOK");
	if(log.getId().equals(dto.getId()))
	{
%> --%>
		<input type="button" value="글수정"
		   onclick="location.href='dogModify.do?petid=<%=petid%>&pg=<%=pg%>'">
		<input type="button" value="글삭제" onclick="del()">
				   
<%-- <%
	}
%> --%>
<br><br><br>
			<!-- Footer -->
				<section id="footer">
            <div class="container">
               <div class="row">
                  <div class="col-8 col-12-medium">
                     <section id="footer">
                        <header>
                           <h2>Blandit nisl adipiscing</h2>
                        </header>
                        <ul class="dates">
                           <li><span class="date">연중무휴</span>
                              
                              <p>운영시간 : am 12:00 ~ pm19:00</p></li>
                           <li><span class="date">대표자</span>
                              
                              <p>고은비</p></li>
                           <li><span class="date">직원</span>
                              <p>김재혁, 한동욱, 김건우</p></li>
                        
                        </ul>
                     </section>
                  </div>
                  <div class="col-4 col-12-medium">
                     <div class="col-4 col-12-medium">
                        <section>
                           <header>
                              <h2>또먹냥~?</h2>
                           </header>
                           <ul class="social">
                              <li><a class="icon brands fa-facebook-f" href="#"><span
                                    class="label">Facebook</span></a></li>
                              <li><a class="icon brands fa-twitter" href="#"><span
                                    class="label">Twitter</span></a></li>
                              <li><a class="icon brands fa-dribbble" href="#"><span
                                    class="label">Dribbble</span></a></li>
                              <li><a class="icon brands fa-tumblr" href="#"><span
                                    class="label">Tumblr</span></a></li>
                              <li><a class="icon brands fa-linkedin-in" href="#"><span
                                    class="label">LinkedIn</span></a></li>
                           </ul>
                           <ul class="contact">
                              <li>
                                 <h3>찾아오시는길</h3>
                                 <p>
                                    서울특별시 서초구 서초동 1303-37<br /> 서초W타워 13층
                                 </p>
                              </li>
                              <li>
                                 <h3>Mail</h3>
                                 <p>
                                    <a href="#">ezen3jo@gmail.com</a>
                                 </p>
                              </li>
                              <li>
                                 <h3>Phone</h3>
                                 <p>(800) 000-0000</p>
                              </li>
                              
                           </ul>
                        </section>
                     </div>
                     <div class="col-4 col-6-medium col-12-small"></div>
                     <div class="col-4 col-6-medium col-12-small"></div>
                     <div class="col-4 col-12-medium">
                        <section></section>
                     </div>

                  </div>
               </div>
               </div>
         </section>


		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>