<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="com.ib.dto.Ibpaging"%>
<%@page import="com.ib.dto.IbDTO"%>
<%@page import="com.login.dto.LoginDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	int pg=(Integer)request.getAttribute("pg");
	Ibpaging paging=(Ibpaging)request.getAttribute("ibpaging");
%>
<!DOCTYPE html>
<html>
<head>
<title>Dopetrope by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/dog.css" />
<link rel="stylesheet" href="assets/css/checkbox.css" />
<link rel="stylesheet" href="assets/css/styleImageBoard.css">
<script>
	function dogView(petid,pg){
		location.href="/bbs/dogView.do?petid="+petid+"&pg="+pg;	
	}

</script>

</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<%
			LoginDTO entity = (LoginDTO) session.getAttribute("logOK");
		    IbDTO dto=(IbDTO)request.getAttribute("dto");
		%>
		<!-- Header -->
		<section id="header">

			<!-- Logo -->
			<h1>
				<a href="/bbs/index.jsp">강아지 분양</a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li class="current"><a href="#">강아지분양</a>
						<ul>
							<li><a href="dog.html">업체 분양</a></li>
							<li><a href="/bbs/dogPeople.jsp">개인 분양 </a></li>
							<li><a href="abandoned.html">유기 분양</a></li>
						</ul></li>

					<li><a href="cat.html">고양이 분양</a></li>
					<ul>
						<li><a href=#>업체 분양</a></li>
						<li><a href=#>개인 분양 </a></li>
						<li><a href=#>유기 분양</a></li>
					</ul>
					<li><a href="abandoned.html">유기동물 분양</a></li>
					<li><a href="service.html">서비스</a></li>
					<li><a href="qna.html">Q&A</a></li>
				</ul>
			</nav>

		</section>

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">

						<!-- Portfolio 	-->
						<section>
							<header class="major">
								<h2>강아지 업체분양</h2>
							</header>
							<div class="row">
								<c:forEach var="ibDTO" items="${list}">
									<!-- 추가한 부분 -->
									<div class="col-4 col-6-medium col-12-small">
										<section class="box">
											<a href="#" class="image featured" onclick="dogView('${ibDTO.petid}','<%=pg%>')"><img
												src="/bbs/storage/${ibDTO.pic}" alt="" /></a>
											<header>
												<h3>${ibDTO.dogkortype}${ibDTO.dogengtype}</h3>
												<form style="margin-top: 10px">
													<input type="checkbox" style="margin-top: 210px"
														onclick="javascript:this.form.amount5.value++;"
														id="heart6" /> <label for="heart6">❤</label> <input
														type="text" name="amount5"
														style="width: 70px; height: 20px; font-size: 20px; text-align: center;"
														value="1" disabled />

												</form>
											</header>
										</section>

									</div>
								</c:forEach>
								<!--  여기 까지 -->
							</div>
						</section>
						<div class=doglist_bottom_search_form>
							<%
								if (entity != null) {
							%>
							<button id="hi"
								onclick="location.href='/bbs/dogboard/imageBoardWrite.html'">글등록</button>
							<%
								} else {
							%>
							<button id="hi" onclick="location.href='/bbs/login/login.jsp'">글등록</button>

							<%
								}
							%>
						</div>
						<div class="paging-block">
							<table>
								<tr>
									<td colspan="6" align="center"><%=paging.getPagingHTML()%></td>
								</tr>
							</table>
						</div>

					</div>
				</div>
			</div>
		</section>

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