<%@ page import="com.login.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>DDO:MUNGNYANG</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<!--  <body class="homepage is-preload"> -->
		<div id="page-wrapper">
			<!-- 로그인/회원가입 버튼 -->
			<section id="starter">
			<div id="menu">
<%
   LoginDTO entity = (LoginDTO)session.getAttribute("logOK");
   if(entity == null)
   {
%>
				<button id="login_btn" onclick="location.href='/bbs/login/login.jsp' ">로그인</button>
				<button id="register_btn" onclick="location.href='/bbs/login/register.jsp' ">회원가입</button>
<%
   }else{
%>
				<button id="logout_btn" onclick="location.href='/bbs/logout.do'">로그아웃</button>
				<button id="profile_btn">내정보</button><br>
				<%= entity.getNick() %>님 반가워요^^
<%                         
   }
%>
				</div>
			 </section>
				
		
			<!-- Header -->
				<section id="header">
					
					<!-- Logo -->
						<h1><a href="/bbs/index.jsp">DDO:MUNGNYANG</a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="/bbs/index.jsp">ABOUT US</a></li>
								<li>
									<a >강아지분양</a>
									 <ul>
										<li><a href="/bbs/Iblist.do?pg=1">업체 분양</a></li>
										<li><a href="/bbs/dogPeople.jsp">개인 분양 </a></li>
										<li><a href="abandoned.html">유기 분양</a></li>
									</ul> 
								</li>
											<!-- <ul>
												<li><a href="#">Magna phasellus</a></li>
												<li><a href="#">Etiam dolore nisl</a></li>
												<li><a href="#">Veroeros feugiat</a></li>
												<li><a href="#">Nisl sed aliquam</a></li>
												<li><a href="#">Dolore adipiscing</a></li>
											</ul>
										</li>
										<li><a href="#">Veroeros feugiat</a></li> -->
									
								
								<li><a>고양이 분양</a>
								<ul>
										<li><a href="#">업체 분양</a></li>
										<li><a href="#">개인 분양 </a></li>
										<li><a href="#">유기 분양</a></li>
										</ul> 
										</li>
								<li><a href="#">심리테스트</a></li>
								<li><a href="service.html">서비스</a></li>
								<li><a href="/bbs/boardList.do?pg=1">Q&A</a></li>
							</ul>
						</nav>

					<!-- Banner -->
						<section id="banner">
							<header>
								
								
							</header>
						</section>

         <!-- Main -->
            <section id="main">
               <div class="container">
                  <div class="row">
                     <div class="col-12">
                        <!-- Blog -->
                           <section>
                              <header class="major">
                                 <h2>또멍냥</h2>
                              </header>
                              <div class="row">
                                 <div class="col-6 col-12-small">
                                    <section class="box">
                                       <a href="#" class="image featured"><img src="images/event.jpg" alt="" /></a>
                                       <header>
                                          <h3>또멍냥의 겨울맞이 이벤트</h3>
                                          <p>2020년 연말을 또멍냥과 함께</p>
                                       </header>
                                       <p>또멍냥에서 반려동물 입양하시는 모든분들께 반려견의 건강을 위한 덴티껌과 반려묘의 피부를 위한 간식 5종세트를 무료로드리고 있습니다. 연말연시 반려동물과 따뜻하게 보내시라고 추첨을 통하여 "코타츠"를 드립니다~ 많은참여 부탁드려요</p>
                                       <footer>
                                          <ul class="actions">
                                             <li><a href="#" class="button icon solid fa-file-alt">Continue Reading</a></li>
                                             <li><a href="#" class="button alt icon solid fa-comment">33 comments</a></li>
                                          </ul>
                                       </footer>
                                    </section>
                                 </div>
                                 <div class="col-6 col-12-small">
                                    <section class="box">
                                       <a href="#" class="image featured"><img src="images/reward.jpg" alt="" /></a>
                                       <header>
                                          <h3>반려동물분양사이트 선호도 1위</h3>
                                          <p>"또멍냥" 올해도 반려동물분양사이트 선호도 1위를 차지</p>
                                       </header>
                                       <p>제 200회 글로벌 분양 대상 또멍냥이 반려동물 분양사이트 부분 선호도1위를 차지했습니다. 5년연속 선호도 1위를 달성하여 반려동물분양사이트 부문 1위를 놓치지않으며 고객님들의 열화와 같은 성원에 늘 감사드립니다. 앞으로도 반려동물의 행복과 건강을 위해 노력하는 또멍냥이 되도록 노력하겠습니다.   </p>
                                       <footer>
                                          <ul class="actions">
                                             <li><a href="#" class="button icon solid fa-file-alt">Continue Reading</a></li>
                                             <li><a href="#" class="button alt icon solid fa-comment">33 comments</a></li>
                                          </ul>
                                       </footer>
                                    </section>
                                 </div>
                              </div>
                           </section>

                     </div>
                  </div>
               </div>
            </section>
                 <section id="main">
               <div class="container">
                <header class="major">
                            <h2>인기순위</h2>
                             </header>
							<div class="row">
								<div class="col-4 col-12-medium">
									<section class="first">
									
										<i class="icon solid featured fa-cog"></i>
										<header>
											<h2>인기순위 1위</h2>
										</header>
										<p>귀여운 갱얼쥐1</p>
									</section>
								</div>
								<div class="col-4 col-12-medium">
									<section class="middle">
										<i class="icon solid featured alt fa-bolt"></i>
										<header>
											<h2>인기순위 2위</h2>
										</header>
										<p>앙칼진 냥이</p>
									</section>
								</div>
								<div class="col-4 col-12-medium">
									<section class="last">
										<i class="icon solid featured alt2 fa-star"></i>
										<header>
											<h2>인기순위3위</h2>
										</header>
										<p>멍냥</p>
									</section>
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
                              <li><a class="fab fa-facebook-f " href="https://www.facebook.com"><span
                                    class="label"></span></a></li>
                              <li><a class="fab fa-twitter " href="#"><span
                                    class="label"></span></a></li>
                              <li><a class="fab fa-instagram" href="#"><span
                                    class="label"></span></a></li>
                              <li><a class="fab fa-youtube" href="#"><span
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