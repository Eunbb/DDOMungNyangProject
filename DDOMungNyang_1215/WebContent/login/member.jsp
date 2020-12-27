<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.login.dto.LoginDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#header {
	border-bottom: 1px #ccc;
}

div.write {
	background-color: #ffffff;
}

input[type="submit"] {
	padding: 0.6em 1.5em 0.65em 0.5em;
}

table.QnA-table tr th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #000000;
	background: #FFFAFA;
	margin: 20px 10px;
}

table.QnA-table td.td1 {
	width: 150px;
	padding: 10px;
	vertical-align: top;
	color: #A9A9A9;
	background: #FFFAFA;
	margin: 20px 10px;
}

.subjectA {
	width: 150px;
	font-weight: bold;
	vertical-align: top;
	color: #FFA07A;
	background: #FFFAFA;
	text-align: left;
}

table.QnA-table tr th.th1 {
	text-align: center;
}

a {
	color: #FFA07A;
	text-decoration: underline;
}

font {
	color: #FFA07A;
}
</style>
<script>
    $(document).ready(function() {

          
    	$("#memberdelete").click(function(){
    		var id = $("#id").val();
    		if(confirm("정말 아이디 '"+id+"'를 삭제하시겠습니까 ?") == true){
    			location.href="/bbs/memberdelete.do?id="+id;
    	    }
    	    else{
    	        return ;
    	    }
          })
    	
    });
</script>
<head>
<title>Dopetrope by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="right-sidebar is-preload">
	<div id="page-wrapper">
		<section id="starter">
			<div id="menu">
				<%
					LoginDTO entity = (LoginDTO) session.getAttribute("logOK");
				if (entity == null) {
				%>
				<button id="login_btn"
					onclick="location.href='/bbs/login/login.jsp'">로그인</button>
				<button id="register_btn"
					onclick="location.href='/bbs/login/register.jsp'">회원가입</button>
				<%
					} else if (entity != null && entity.getId().equals("ddomungyang@gmail.com")) {
				%>
				<button id="logout_btn" onclick="location.href='/bbs/index.jsp'">HOME</button>
				<button id="logout_btn" onclick="location.href='/bbs/logout.do'">로그아웃</button>
				<form name="MyProfile" method="post"
					action="/bbs/myPro.do?id=<%=entity.getId()%>">
					<button id="profile_btn" onclick="myProfile()">내정보</button>
					<br>
				</form>
				<%=entity.getNick()%>님 반가워요<img src="images/mypage.png" width="15"
					height="15" style="margin-right: 20px;">
				<%
					} else {
				%>
				<button id="logout_btn" onclick="location.href='/bbs/logout.do'">로그아웃</button>
				<form name="MyProfile" method="post"
					action="/bbs/myPro.do?id=<%=entity.getId()%>">
					<button id="profile_btn" onclick="myProfile()">내정보</button>
					<br>
				</form>
				<%=entity.getNick()%>님 반가워요<img src="images/mypage.png" width="15"
					height="15" style="margin-right: 20px;">
				<%
					}
				%>
			</div>
		</section>

		<!-- Header -->
		<section id="header">

			<!-- Logo -->
			<h1>
				<a href="/bbs/member.do">또멍냥 회원관리</a>
			</h1>

			<!-- Member list -->
			<form name="memberForm" >
				<table width="80%" align="center" border="0" cellspacing="0"
					cellpadding="5">
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>닉네임</td>
						<td>생일</td>
						<td>수정</td>
					</tr>
					<c:forEach var="member" items="${list}">
						<tr>
							<td>${member.id}</td>
							<td>${member.name}</td>
							<td>${member.nick}</td>
							<td>${member.birth}</td>
							<td>
							<input type="hidden" value="${member.id}" id="id">
							<button type="button" id="memberdelete">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</form><br><br>

			<!-- Footer -->
			<section id="footer">
				<div class="container">
					<div class="row">
						<div class="col-8 col-12-medium">
							<section id="footer">
								<header>
									<h2></h2>
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

									<ul class="social">
										<li><a class="fab fa-facebook-f "
											href="https://www.facebook.com"><span class="label"></span></a></li>
										<li><a class="fab fa-twitter "
											href="https://www.twitter.com"><span class="label"></span></a></li>
										<li><a class="fab fa-instagram"
											href="https://www.instagram.com"><span class="label"></span></a></li>
										<li><a class="fab fa-youtube"
											href="https://www.youtube.com"><span class="label"></span></a></li>
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
												<a href="https://www.google.com/intl/ko/gmail/about/#">ezen3jo@gmail.com</a>
											</p>
										</li>
										<li>
											<h3>Phone</h3>
											<p>(02) 123-4567</p>
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