<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   int pg=(Integer)request.getAttribute("pg");
%>
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Dopetrope by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="right-sidebar is-preload" onload = "alert('댓글을 저장했습니다.'); location.href='/bbs/boardList.do?pg=<%=pg%>';">
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

<!-- boardView -->

<br><br><br>
			<!-- Footer -->
				<section id="footer">
            <div class="container">
               <div class="row">
                  <div class="col-8 col-12-medium">
                     <section id="footer">
                      <header>
                      <h2 style="text-align:left; color:white; font-size:2.3em; margin-bottom:2.2em ">DDO:MungNyang</h2>
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