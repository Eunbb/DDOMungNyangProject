
<!-- 12/22 수정jsp -->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.login.dto.LoginDTO" %>
<%@page import="com.board.dto.BoardPaging"%>
<%@page import="com.board.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE HTML>
<%
    LoginDTO entity = (LoginDTO)session.getAttribute("logOK");
%>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<script>
function checkBoardWrite(){
	if(document.boardWriteForm.subject.value==""){
		alert("제목을 입력하세요");
		boardWriteForm.subject.focus();
	}else if(document.boardWriteForm.content.value==""){
		alert("내용을 입력하세요");
		boardWriteForm.content.focus();
	}else{ 
		document.boardWriteForm.submit();
	}
}
</script>
	<head>
		<title>또멍냥</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/bbs/assets/css/main.css" />
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
					<li><a href="/bbs/index.jsp">ABOUT US</a></li>
					<li><a href="/bbs/Iblist1.do?pg=1">강아지 분양</a>
						<ul>
							<li><a href="/bbs/Iblist1.do?pg=1" >업체 분양</a></li>
							<li><a href="/bbs/Iblist2.do?pg=1">개인 분양 </a></li>
							<li><a href="/bbs/Iblist3.do?pg=1">유기 분양</a></li>
						</ul></li>

					<li><a href="/bbs/Iblist4.do?pg=1">고양이 분양</a>
						<ul>
							<li><a href="/bbs/Iblist4.do?pg=1">업체 분양</a></li>
							<li><a href="/bbs/Iblist5.do?pg=1">개인 분양 </a></li>
							<li><a href="/bbs/Iblist6.do?pg=1">유기 분양</a></li>
						</ul></li>
					<li><a href="/bbs/psychology/PsychologyTest.html">심리테스트</a></li>
					<li><a href="/bbs/service/service.jsp">서비스</a></li>
					<!-- 수정해야됨2 -->
					<li><a href="/bbs/boardList.do?pg=1">Q&A</a></li>
				</ul>
			</nav>

				</section>

<!-- boardWrite -->
<%-- <%
	LoginDTO ob=(LoginDTO)session.getAttribute("logOK");
	if(ob != null){
%> --%>
<form name="boardWriteForm" method="post" action="/bbs/boardInsert.do">
<h3>글쓰기</h3>
<table border="1" >
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" size="50"  value="<%=entity.getId()%>" readonly></td>
	</tr>
	<tr>
		<td>닉네임</td>
		<td><input type="text" name="name" size="50" value="<%=entity.getNick()%>" readonly></td>
	</tr>	
	<tr>
		<td>제 목</td>
		<td><input type="text" name="subject" size="50"></td>
	</tr>
	<tr>
		<td>내 용</td>
		<td><textarea name="content" cols="50" rows="15"></textarea></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="button" value="글쓰기" onclick="checkBoardWrite()">
		<input type="reset" value="다시작성"><br><br><br><br>
		</td>
	</tr>
</table>
</form>


<!-- Footer -->
				<section id="footer">
            <div class="container">
               <div class="row">
                  <div class="col-8 col-12-medium">
                     <section id="footer">
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
                           
                           <ul class="social">
                              <li><a class="fab fa-facebook-f " href="https://www.facebook.com"><span
                                    class="label"></span></a></li>
                              <li><a class="fab fa-twitter " href="https://www.twitter.com"><span
                                    class="label"></span></a></li>
                              <li><a class="fab fa-instagram" href="https://www.instagram.com"><span
                                    class="label"></span></a></li>
                              <li><a class="fab fa-youtube" href="https://www.youtube.com"><span
                                    class="label"></span></a></li>
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