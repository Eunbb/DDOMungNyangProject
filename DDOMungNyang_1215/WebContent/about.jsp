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
<style>
#img1 {
   display:inline;
   width: 50%;
   float: left;
}

#img2 {
   display:inline;
   width: 40%;
}

</style>	
	
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
					<a href="/bbs/index.jsp"><img src="/bbs/images/logo.png" width="100" height="100"></a>
						<h1 style="display:inline"><a href="/bbs/index.jsp" style="color:black">DDO:MUNGNYANG</a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="#">ABOUT US</a></li>
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
                              <div class="row" style="margin-top:100px">
                                    <img src="images/about3.jpg" id = "img1" width= "50" height="300" style="object-fit:cover; " alt="" > 
                                    <p style="display:inline; text-align:center; font-size:2em; margin-top:80px">새로운 인연을<br>또멍냥에서 시작하세요!</p>
                                    <p style="font-size:1.3em; margin-top:200px; display:inline;" >나에게 딱 맞는 반려동물을 결정할 수 있는 <span style="color:#FA8072">심리테스트</span>도입
                                    <br>전국의 가장 아름다운 반려동물 선발대회 <span style="color:#FA8072"> Miss.dog 1등</span> 반려동물 다수 보유<br>지금 또멍냥에서 만나보세요</p>
                                    <img src="images/about2.jpg" id = "img2" width= "40" height="300" style="object-fit:cover; margin-top:120px;" alt="" > 
                                    
                                    
                                    
                                    <img src="images/about1.png" style="margin-top:100px; margin-bottom: 100px" alt="" > 
                              </div>
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