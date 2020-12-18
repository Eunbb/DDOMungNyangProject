<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.login.dto.LoginDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	LoginDTO dto = (LoginDTO) request.getAttribute("dto");
%>
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<script>
function homeBtn(){
	location.href = "index.jsp";
}
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

		<!-- Header -->
		<section id="header">

			<!-- Logo -->
			<h1>
				<a href="/bbs/index.jsp">내       정  보</a>
			</h1>

		</section>

		<!-- profile -->
		<form name="profileForm" method="post" enctype="multipart/form-data"
			action="/bbs/">
			<h3>글수정</h3>
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" size="50"
						value="<%=dto.getId()%>"><br>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="pw" size="50"
						value="<%=dto.getPw()%>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" size="50"
						value="<%=dto.getName()%>"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nick" size="50"
						value="<%=dto.getNick()%>"></td>
				</tr>
				<tr>
					<td>생일</td>
					<td><input type="text" name="birth" size="50"
						value="<%=dto.getBirth()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button"
						value="수정하기" onclick="checkdogModify()">
						<input type="button"
						value="HOME" onclick="homeBtn()">
				</tr>
			</table>
		</form>

		<br>
		<br>
		<br>
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