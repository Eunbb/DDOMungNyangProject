<!-- 12/21 수정부분 -->
<%@ page import="com.login.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<script>
function myProfile(){
   document.MyProfile.submit();
}
</script>
	<head>
		<title>DDO:MUNGNYANG</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/styleImageBoard.css">
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
				<button id="login_btn" onclick="location.href='/bbs/login/login.jsp'">로그인</button>
				<button id="register_btn" onclick="location.href='/bbs/login/register.jsp'">회원가입</button>
<%
   }else{
%>
				<button id="logout_btn" onclick="location.href='/bbs/logout.do'">로그아웃</button>
				<form name="MyProfile" method="post" action="/bbs/myPro.do?id=<%= entity.getId() %>">
					<button id="profile_btn" onclick="myProfile()">내정보</button><br>
				</form>
				<%= entity.getNick() %>님 반가워요<img src="images/mypage.png" width="15" height="15" style=margin-right:20px;>
<%                         
   }
%>
				</div>
			 </section>
				
		
			<!-- Header -->
				<section id="header">
					
					<!-- Logo -->
						<h1><a href="/bbs/index.jsp" style="color:black">DDO:MUNGNYANG</a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="/bbs/index.jsp">ABOUT US</a></li>
								<li>
									<a href="/bbs/Iblist1.do?pg=1">강아지 분양</a>
									 <ul>
										<li><a href="/bbs/Iblist1.do?pg=1">업체 분양</a></li>
										<li><a href="/bbs/Iblist2.do?pg=1">개인 분양 </a></li>
										<li><a href="/bbs/Iblist3.do?pg=1">유기 분양</a></li>
									</ul> 
								</li>
											
								<li><a href="/bbs/Iblist4.do?pg=1">고양이 분양</a>
								<ul>
										<li><a href="/bbs/Iblist4.do?pg=1">업체 분양</a></li>
										<li><a href="/bbs/Iblist5.do?pg=1">개인 분양 </a></li>
										<li><a href="/bbs/Iblist6.do?pg=1">유기 분양</a></li>
										</ul> 
										</li>
								<li><a href="/bbs/psychology/PsychologyTest.html">심리테스트</a></li>
								<li><a href="/bbs/service/service.jsp">서비스</a></li>  <!-- 수정해야됨2 -->
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
                                          <p style="color:#F44336; font-family:'Jua', sans-serif; font-size: 1.3em">또멍냥 유튜브 구독시 간직 5종세트 무료증정</p>
                                       </header>
                                       <p><span style="color:#F44336">또멍냥 유튜브 구독</span>시 반려동물 입양하시는 모든분들께 반려견의 건강을 위한 덴티껌과 반려묘의 피부를 위한 간식 5종세트를 무료로드리고 있습니다.<br>많은참여 부탁드려요<img src="images/mypage.png" width="30" height="30" ></p>
                                       <footer>
                                          <ul class="actions">
                                             <li><a href="https://www.youtube.com/channel/UCSmmLUH4x14hzJNpLshJIGA" class="fab fa-youtube fa-2x" ><span style="color:#000000; font-family:'Jua', sans-serif">구독하러가기</span></a></li>
                                          </ul>
                                       </footer>
                                    </section>
                                 </div>
                                 <div class="col-6 col-12-small">
                                    <section class="box">
                                       <a href="#" class="image featured"><img src="images/reward.jpg" alt="" /></a>
                                       <header>
                                          <h3>반려동물분양사이트 선호도 1위</h3>
                                          <p style="color:#F44336; font-family:'Jua', sans-serif; font-size: 1.3em">"또멍냥" 올해도 반려동물분양사이트 선호도 1위를 차지</p>
                                       </header>
                                       <p>제 200회 글로벌 분양 대상 또멍냥이 반려동물 분양사이트 부분 선호도1위를 차지했습니다.5년연속 선호도 1위를 달성하여 반려동물분양사이트<br> 부문 1위를 놓치지않으며 고객님들의 열화와 같은 성원에<br> 늘 감사드립니다. 앞으로도 반려동물의 행복과 건강을 위해<br> 노력하는 또멍냥이 되도록 노력하겠습니다.   </p>
                                       <footer>
                                          <ul class="actions">
                                             <li><a href="#" class="button icon solid fa-file-alt">3조 또멍냥</a></li>
                                             <li><a href="#" class="button alt icon solid fa-comment">화이팅★</a></li>
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
                 <section id="main" style="margin-bottom:7em">
               <div class="container">
                <header class="major">
                            <h2 style="color: #FA8072; font-size: 2em">또멍냥's Pick</h2>
                             </header>
							<div class="row">
								<div class="col-4 col-12-medium">
									<section class="first">
										
										<button type="button" style="color: red; cursor: pointer;" onclick="petranking()">❤</button>
										
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