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
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
   $(document).ready(function() {
      //jQuery
      $("#repw").keyup(function() {
         pw = $("#pw").val();
         repw = $("#repw").val();

         if (pw == repw) {
            $("#pwdchk").text("비밀번호가 일치합니다.").css({
               'font-weight' : 'bold',
               'color' : 'green'
            });
         } else {
            $("#pwdchk").text("비밀번호가 일치하지않습니다").css({
               'font-weight' : 'bold',
               'color' : 'red'
            });
         }
      })
      
      $("#pwmodifybtn").click(function() {
         var id = $("[name=id]").val();
         var popupX = (document.body.offsetWidth / 2) - (500 / 2);
         var popupY= (window.screen.height / 2) - (500 / 2);
         window.open('/bbs/login/pwVerify.jsp?&id='+id+'', '비밀번호 확인', 'width=500, height=500, left='+ popupX + ', top='+ popupY + ', scrollbars = no');
      })
      
      $("#namemodifybtn").click(function() {
         $("[name=name]").attr("readonly",false);
         $("[name=name]").focus();
         $("[name=name]").css({'background-color' : '#d1d1d1'});
      })
      
      $("#nickmodifybtn").click(function() {
         $("[name=nick]").attr("readonly",false);
         $("[name=nick]").focus();
         $("[name=nick]").css({'background-color' : '#d1d1d1'});
      })
      
      $("#birthmodifybtn").click(function() {
         $("[name=birth]").attr("readonly",false);
         $("[name=birth]").focus();
         $("[name=birth]").css({'background-color' : '#d1d1d1'});
      })
   });
   function verification(){
         $("[name=pw]").attr("readonly",false);
         $("[name=repw]").attr("readonly",false);
         $("[name=pw]").css({'background-color' : '#d1d1d1'});
         $("[name=pw]").focus();
         $("[name=repw]").click(function() {
            $("[name=repw]").css({'background-color' : '#d1d1d1'});
         })
   }
   
   function homeBtn() {
      location.href = "index.jsp";
   }
   function loginModify() {
      pw = $("[name=pw]").val();
      repw = $("[name=repw]").val();
      if(pw == repw){
         document.profileForm.submit();
      } else{
         alert('비밀번호가 서로 일치하지 않습니다.');
      }
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
            <a href="/bbs/index.jsp">내 정 보</a>
         </h1>

      </section>

      <!-- profile -->
      <form name="profileForm" method="post" action="/bbs/myProModify.do">
         <table border="1">
            <tr>
               <td>아이디</td>
               <td colspan="2"><input type="text" name="id" size="50"
                  value="<%=dto.getId()%>" readonly></td>
            </tr>
            <tr>
               <td>비밀번호<br><br><br>비밀번호확인</td>
               <td><input type="password" name="pw" size="50" id="pw" placeholder="비밀번호를 입력해주세요" value="<%=dto.getPw()%>" readonly>   <br>
                  <input type="password" name="repw" size="50" id="repw" placeholder="비밀번호를 다시한번 입력해주세요"   value="<%=dto.getRepw()%>" readonly>
                  <p style="color: red;" id="pwdchk">${pwdchk}</p></td>
               <td><button type="button" id="pwmodifybtn">수정하기</button></td>
            </tr>
            <tr>
               <td>이름</td>
               <td colspan="2"><input type="text" name="name" size="50"
                  value="<%=dto.getName()%>" readonly></td>
            </tr>
            <tr>
               <td>닉네임</td>
               <td><input type="text" name="nick" size="50"
                  value="<%=dto.getNick()%>" readonly></td>
               <td><button type="button" id="nickmodifybtn">수정하기</button></td>
            </tr>
            <tr>
               <td>생일</td>
               <td><input type="text" name="birth" size="50"
                  value="<%=dto.getBirth()%>" readonly></td>
               <td><button type="button" id="birthmodifybtn">수정하기</button></td>
            </tr>
            <tr>
               <td colspan="3" align="center"><input type="button"
                  value="저장" onclick="loginModify()"> <input type="button"
                  value="HOME" onclick="homeBtn()">
            </tr>
         </table>
      </form>

      <br> <br> <br>
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