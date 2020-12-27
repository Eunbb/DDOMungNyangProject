<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ib.dto.Ibpaging"%>
<%@page import="com.ib.dto.IbDTO"%>
<%@page import="com.login.dto.LoginDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	int pg = (Integer) request.getAttribute("pg");
Ibpaging paging = (Ibpaging) request.getAttribute("ibpaging");
%>
<!DOCTYPE html>
<html>
<head>
<title>Dopetrope by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<!-- <link rel="stylesheet" href="assets/css/selector.css" /> -->
<link rel="stylesheet" href="assets/css/styleImageBoard.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
   function dogView(petid,pg){
      location.href="/bbs/dogView.do?petid="+petid+"&pg="+pg;   
   }
    function heartbtnFunction(petid){
       var petid = petid;
       var heart = $('input[name='+petid+']').val();
        $.ajax({
           type:'POST',
           url:'./PlusHeartServlet',
           data: {petid : petid, heart : heart},
           async: false,
           success:function (jsonObj) {
              var obj = JSON.parse(jsonObj);
              $('input[name='+obj.petid+']').attr('value',obj.heart);
           },
           error : function(data,textStatus) {
               console.log('error!!')
        }
     })
    }
    function heartSadbtnFunction(petid){
       var petid = petid;
       var heart = $('input[name='+petid+']').val();
        $.ajax({
           type:'POST',
           url:'./MinusHeartServlet',
           data: {petid : petid, heart : heart},
           async: false,
           success:function (jsonObj) {
              var obj = JSON.parse(jsonObj);
              $('input[name='+obj.petid+']').attr('value',obj.heart);
           },
           error : function(data,textStatus) {
               console.log('error!!')
        }
     })
    }
    
    function notGwanrija() {
       alert("업체분양 페이지 강아지등록은 관리자만 가능합니다.")
    }
    
    $(document).ready(function() {
    	$("#petgender").change(function(){
    		var petgender = $("#petgender option:selected").val();
    		location.href="/bbs/genderdogcompany.do?pg=1&petgender="+petgender;
          })
          
    	$("#petprice").change(function(){
    		var petprice = $("#petprice option:selected").val();
    		if(petprice =="가격(높은 순)"){
    			location.href="/bbs/priceupdogcompany.do?pg=1";
    		} else if(petprice =="가격(낮은 순)"){
    			location.href="/bbs/pricedowndogcompany.do?pg=1";	
    		}
          })
          
    	$("#searchdogbtn").click(function(){
    		var dogname = $("#searchdog").val();
    		location.href="/bbs/dognamedogcompany.do?pg=1&dogname="+dogname; 
          })
    	
    	});
</script>

</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<!-- 로그인/회원가입 버튼 -->
		<section id="starter">
			<div id="menu">
				<!-- 로그인/회원가입 버튼 -->

				<%
					LoginDTO entity = (LoginDTO) session.getAttribute("logOK");
					IbDTO dto = (IbDTO) request.getAttribute("dto");
					if (entity == null) {
				%>
				<button id="login_btn"
					onclick="location.href='/bbs/login/login.jsp'">로그인</button>
				<button id="register_btn"
					onclick="location.href='/bbs/login/register.jsp'">회원가입</button>
				<%
					} else if (entity != null && entity.getId().equals("ddomungyang@gmail.com")) {
				%>
				<button id="logout_btn"
					onclick="location.href='/bbs/member.do'">회원관리</button>
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
	</div>
	<!-- Header -->
	<section id="header">

		<!-- Logo -->
		<h1>
			<a href="/bbs/index.jsp">강아지 분양</a>
		</h1>

		<!-- Nav -->
		<nav id="nav">

			<ul>
				<li><a href="/bbs/index.jsp">ABOUT US</a></li>
				<li class="current"><a href="/bbs/Iblist1.do?pg=1">강아지 분양</a>
					<ul>
						<li><a href="/bbs/Iblist1.do?pg=1" style="color: #FA8072">업체
								분양</a></li>
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

	<!-- Main -->
	<section id="main">
		<div class="container">
			<div class="row">
				<div class="col-12">

					<!-- 또멍냥 인기 Top3    -->
					<section>
						<header class="major">
							<h2>인기 Top3</h2>
						</header>
						<div class="row">
							<c:forEach var="ibDTO" items="${toplist}">
								<!-- 추가한 부분 -->
								<div class="col-4 col-6-medium col-12-small">
									<section class="box">
										<a href="#" class="image featured"
											onclick="dogView('${ibDTO.petid}','<%=pg%>')"><img
											src="/bbs/storage/${ibDTO.pic}" alt="" /></a>
										<header>
											<h3>${ibDTO.dogkortype}${ibDTO.dogengtype}</h3>
											<%
												if (entity != null) {
											%>
											<form id="heart">
												<button type="button" style="color: red; cursor: pointer;"
													onclick="heartbtnFunction(${ibDTO.petid})">😍</button>
												<button type="button" style="color: red; cursor: pointer;"
													onclick="heartSadbtnFunction(${ibDTO.petid})">🙁</button>
												<input type="text" name="${ibDTO.petid}"
													value="${ibDTO.heart}"
													style="width: 70px; height: 20px; font-size: 20px; text-align: center;"
													readonly />
											</form>
											<%
												} else {
											%>
											<form id="heart">
												<button type="button" style="color: red; cursor: pointer;"
													onclick="location.href='/bbs/login/login.jsp'">😍</button>
												<button type="button" style="color: red; cursor: pointer;"
													onclick="location.href='/bbs/login/login.jsp'">🙁</button>
												<input type="text" name="${ibDTO.petid}"
													value="${ibDTO.heart}"
													style="width: 70px; height: 20px; font-size: 20px; text-align: center;"
													readonly />
											</form>
											<%
												}
											%>
										</header>
									</section>

								</div>
							</c:forEach>
							<!--  여기 까지 -->
						</div>
					</section>
					<br>
					<br>



					<!-- 업체분양    -->
					<section>
						<header class="major">
							<h2>업체분양</h2>
						</header>

						<!-- 강아지 검색하기 -->
						<div>
							<form>
								<div class="selectform"
									style="margin-bottom: 4em; text-align: center;">
									<select data-trigger="" id="petgender"
										style="width: 20em; display: inline">
										<option placeholder="">성별(전체)</option>
										<option>수컷</option>
										<option>암컷</option>
									</select> <select data-trigger="" id="petprice"
										style="width: 20em; display: inline">
										<option placeholder="">가격</option>
										<option>가격(높은 순)</option>
										<option>가격(낮은 순)</option>
									</select> <input id="searchdog" type="text"
										placeholder="찾으시는 종의 이름을 입력해주세요"
										style="width: 20em; display: inline" />

									<button id="searchdogbtn" type="button" style="display: inline">검색</button>
								</div>
							</form>
						</div>

						<!-- --------------------------------------------------------------------->


						<div class="row">
							<c:forEach var="ibDTO" items="${list}">
								<!-- 추가한 부분 -->
								<div class="col-4 col-6-medium col-12-small">
									<section class="box">
										<a href="#" class="image featured"
											onclick="dogView('${ibDTO.petid}','<%=pg%>')"><img
											src="/bbs/storage/${ibDTO.pic}" alt="" /></a>
										<header>
											<h3>${ibDTO.dogkortype}${ibDTO.dogengtype}</h3>
											<%
												if (entity != null) {
											%>
											<form id="heart">
												<button type="button" style="color: red; cursor: pointer;"
													onclick="heartbtnFunction(${ibDTO.petid})">😍</button>
												<button type="button" style="color: red; cursor: pointer;"
													onclick="heartSadbtnFunction(${ibDTO.petid})">🙁</button>
												<input type="text" name="${ibDTO.petid}"
													value="${ibDTO.heart}"
													style="width: 70px; height: 20px; font-size: 20px; text-align: center;"
													readonly />
											</form>
											<%
												} else {
											%>
											<form id="heart">
												<button type="button" style="color: red; cursor: pointer;"
													onclick="location.href='/bbs/login/login.jsp'">😍</button>
												<button type="button" style="color: red; cursor: pointer;"
													onclick="location.href='/bbs/login/login.jsp'">🙁</button>
												<input type="text" name="${ibDTO.petid}"
													value="${ibDTO.heart}"
													style="width: 70px; height: 20px; font-size: 20px; text-align: center;"
													readonly />
											</form>
											<%
												}
											%>
										</header>
									</section>

								</div>
							</c:forEach>
							<!--  여기 까지 -->
						</div>
					</section>


					<!-- 					<div class=doglist_bottom_search_form> -->
					<%
						if (entity != null && entity.getId().equals("ddomungyang@gmail.com")) {
					%>
					<button id="hi"
						onclick="location.href='/bbs/dogboard/imageBoardWrite.jsp'"
						style="text-align: right;">글등록</button>
					<%
						} else {
					%>
					<button id="hi" onclick="notGwanrija()" style="float: right;">글등록</button>
					<%
						}
					%>
					<!-- 					</div> -->
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
							<h2
								style="text-align: left; color: white; font-size: 2.3em; margin-bottom: 2.2em">DDO:MungNyang</h2>
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