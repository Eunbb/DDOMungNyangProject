<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ib.dto.Ibpaging"%>
<%@page import="com.ib.dto.IbDTO"%>
<%@page import="java.util.List"%>
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
 function checkdogModify(){
	document.dogModifyForm.submit();
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
<form name="dogModifyForm" method="post" 
                   action="/bbs/dogUpdate.do?petid=<%=petid%>&pg=<%=pg%>">
<h3>글수정</h3>
<table border="1" >
	<tr>
		<td>사진</td>
		<td><img name="pic" src="/bbs/uploadImage/<%=dto.getPic()%>" alt="" /></td>		
	</tr>
	<tr>
		<td>종(한글)</td>
		<td><input type="text" name="korname" size="50"  value="<%=dto.getDogkortype()%>"></td>		
	</tr>
		<tr>
		<td>종(영어)</td>
		<td><input type="text" name="engname" size="50"  value="<%=dto.getDogengtype()%>"></td>	
	</tr>
	<tr>
		<td>동물</td>
		<td><input type="text" name="classify1" size="50"  value="<%=dto.getClassify1()%>(강아지 : 1, 고양이 : 2)" readonly></td>
	</tr>	
	<tr>
		<td>분양방법</td>
		<td><input type="text" name="classify2" size="50"  value="<%=dto.getClassify2()%>(업체분양 : A1 , 개인분양 : A2, 유기분양 :A3)"></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="age" size="50" value="'<%=dto.getAge()%>' 살"></td>
	</tr>	
	<tr>
		<td>성별</td>
		<td><input type="text" name="gender" size="50" value="<%=dto.getGender()%>(수컷 M, 암컷 F)"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" name="price" value="<%=dto.getPrice()%>원" size="50"></td>
	</tr>
	
	<tr>
		<td>접종여부</td>
		<td><input type="text" name="jusa" value="<%=dto.getJusa()%>(O,X)" size="50"></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="button" value="수정완료" onclick="checkdogModify()">
		<input type="button" value="목록" onclick="location.href='/bbs/Iblist.do?pg=<%=pg%>'">
		</td>
		
	</tr>
</table>
</form>

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