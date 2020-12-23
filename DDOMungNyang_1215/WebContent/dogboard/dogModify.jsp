<%@page import="java.awt.print.Printable"%>
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
      <title>글수정</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
   </head>
   <body class="right-sidebar is-preload">
      <div id="page-wrapper">

         <!-- Header -->
            <section id="header">

               <!-- Logo -->
                  <h1><a href="/bbs/index.jsp">DDO:MUNGNYANG</a></h1>

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
<form name="dogModifyForm" method="post"  enctype="multipart/form-data"
                   action="/bbs/dogUpdate.do?petid=<%=petid%>&pg=<%=pg%>">
<!-- boardView -->
<section id="board">
<section id="board2">


   <h2 style="margin-top:20pt; margin-left:20pt;">관리자 수정</h2>
      
      <div><img style="display:block;margin:0 auto;margin-top:20pt;" name="imagepath" id="imagepath" class="pic" src="/bbs/storage/<%=dto.getPic()%>" alt="" /><br>
      
      <div style="text-align:center;"><input type="file" style="color:#f44336;"name="pic" id="pic" size="40">
                                      <input type="hidden" name="pichi" id="pichi" value="<%=dto.getPic()%>">
      </div>  
   	</div>
   
   <div>
      
      <div style="color:#f44336; margin-left:20pt">종류(한글)<input type="text" style="width:200pt;" name="dogkortype" value="<%=dto.getDogkortype()%>"></div>      
   </div>
      <div>
     
      <div style="color:#f44336; margin-left:20pt">종류(영어)<input type="text" style="width:200pt;"name="dogengtype" size="50"  value="<%=dto.getDogengtype()%>"></div>   
   </div>
   <div>
     
      <div style="color:#f44336; margin-left:20pt">동물(강아지 : 1, 고양이 : 2)<input type="text" style="width:200pt;" name="classify1" size="50"  value="<%=dto.getClassify1()%>" readonly></div>
   </div>   
   <div>
      
      <div style="color:#f44336; margin-left:20pt">분양방법(업체분양 : A1 , 개인분양 : A2, 유기분양 :A3)<input type="text" style="width:200pt;" name="classify2" size="50"  value="<%=dto.getClassify2()%>"></div>
   </div>
   <div>
      
      <div style="color:#f44336; margin-left:20pt">나이(세)<input type="text" style="width:200pt;" name="age" size="50" value="<%=dto.getAge()%>"></div>
   </div>   
   <div>
      <div style="color:#f44336; margin-left:20pt">성별(수컷 M, 암컷 F)<input type="text" style="width:200pt;" name="gender" size="50" value="<%=dto.getGender()%>"></div>
   </div>
   <div>
    
      <div style="color:#f44336; margin-left:20pt">가격(원)<input type="text" style="width:200pt;" name="price" value="<%=dto.getPrice()%>원" size="50"></div>
   </div>
   
   <div>
      
      <div style="color:#f44336; margin-left:20pt">접종여부(O,X)<input type="text" style="width:200pt;" name="jusa" value="<%=dto.getJusa()%>" size="50"></div>
   </div>
   
   
      <section id="btn">
      <input type="button" value="수정완료" onclick="checkdogModify()">
      <input type="button" value="목록" onclick="location.href='/bbs/Iblist.do?pg=<%=pg%>'">
      </section>
      </section>
      </section>
      
  

</form>

<br><br><br>
         <!-- Footer -->
            <section id="footer">
            <div class="container">
               <div class="row">
                  <div class="col-8 col-12-medium">
                     <section id="footer">
                        <header>
                           <h2>또멍냥 분양사이트 정보</h2>
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