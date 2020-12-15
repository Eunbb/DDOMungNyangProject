<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
%>

<!--
   Dopetrope by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<script language =javascript>
 function btn_click(str) {
         if(str=="success"){
       signup.action="/bbs/SignUp.do"
     }
 }

</script>


<title>DDO:MUNGNYANG</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/bbs/assets/css/register.css" />
<script>
   function pwCheck() {
      if (document.signup.pw.value == "") {
         alert("비밀번호를 입력하세요");
         signup.pw.focus();
      } else if (document.signup.repw.value == "") {
         alert("비밀번호를 입력하세요");
         signup.repw.focus();
      } else if (document.signup.pw.value != document.signup.repw.value) {
         alert("비밀번호가 일치하지 않습니다.")
      } else {
         document.signup.submit();
      }

   }
</script>
</head>
<body class="homepage is-preload">
   <div id="page-wrapper">
      <!-- 로그인/회원가입 버튼 -->
      <section id="starter">
      <div id="btn_group">
         <button id="login_btn" onclick="location.href='/bbs/index.jsp' ">HOME</button>
         <button id="login_btn" onclick="location.href='/bbs/login/login.jsp'">로그인</button>
      </div>
      </section>


      <!-- Header -->
      <section id="header"> <!-- Logo -->
      <h1>
         <a href="/bbs/index.jsp">DDO:MUNGNYANG</a>
      </h1>
      <form class="form-horizontal"  method="post" name="signup">
         <div id="container">
            <div class="join_content">
               <div class="row_group">
                  <div class="join_row">
                     <h3 class="col-sm-2 control-label">
                        <label for="id">아이디</label>
                     </h3>
                     <div class="inputWrap">
                        <!-- div시작 -->
                        <div class="col-sm-3">
                           <input type="email" id="id"
                              placeholder=<%=id%> name="id" class="form-control">
                        </div>
                        <div class="adress_button">
                        
                           <input type="text" id="adress_button" value="인증완료" class="btn">
                        </div>
                        <!-- div 끝 -->
                        <p style="color: red;">${idError}</p>
                     </div>
                     
                     
                     
                     
                  <div class="join_row">
                     <h3 class="col-sm-2 control-label">
                        <label for="pwd" id="pwd">비밀번호</label>
                     </h3>
                     <div class="col-sm-6">
                        <input type="password" class="form-control" name="pw" id="pw">
                        <p style="color: red;">${pwdError}</p>
                     </div>
                     <h3 class="col-sm-2 control-label">
                        <label for="pwdCheck" id="pwdCheck">비밀번호 확인</label>
                     </h3>
                     <div class="col-sm-3">
                        <input type="password" id="repw" name="repw"
                           class="form-control" value="${member.email }">
                     </div>
                     <div class="adress_button">
                        <input type="button" id="pwbtn" onclick="pwCheck()" value="중복확인"
                           class="btn">
                     </div>

                  </div>
               </div>
               <div class="row_group">
                  <div class="join_row">
                     <h3 class="col-sm-2 control-label">
                        <label for="name" id="name">이름</label>
                     </h3>
                     <div class="col-sm-6">
                        <input type="text" class="form-control" name="name" id="name"
                           value="${member.name }">
                        <p style="color: red;">${nameError}</p>
                     </div>
                  </div>
                  <div class="join_row join_birthday">
                     <h3 class="join_title">
                        <label for="yy">생년월일</label>
                     </h3>
                     <div class="bir_wrap">
                        <div class="bir_yy">
                           <span class="ps_box"> <input type="text" id="yy"
                              name="yy" placeholder="년(4자)" aria-label="년(4자)" class="int"
                              maxlength="4">
                           </span>
                        </div>
                        <div class="bir_wrap">
                           <div class="bir_mm">
                              <span class="ps_box"> <select id="mm" class="sel"
                                 name="mm" aria-label="월">
                                    <option value="">월</option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                              </select>
                              </span>
                           </div>
                           <div class=" bir_dd">
                              <span class="ps_box"> <input type="text" id="dd"
                                 name="dd" placeholder="일" aria-label="일" class="int"
                                 maxlength="2"> <label for="dd" class="lbl"></label>
                              </span>
                           </div>
                        </div>
                        <span class="error_next_box" id="birthdayMsg"
                           style="display: none" aria-live="assertive"></span>
                     </div>
                  </div>
                  <div class="join_row">
                     <h3 class="col-sm-2 control-label">
                        <label for="email" id="email">닉네임</label>
                     </h3>
                     <div class="col-sm-6">
                        <input type="text" class="form-control" name="nick" id="nick"
                           value="">
                        <p style="color: red;">${emailError}</p>
                     </div>
                  </div>
               
               </div>
               
               <div class="row_group">
                  <div class="join_row">
                     <div class="col-sm-12  text-center">
                        <input type="hidden" name="ip" value="${GetIpAddress.getIp()}">
                        <input type="submit" value="가입하기" class="btn btn-success" onclick ='btn_click("success");'>
                     </div>
                  </div>
               </div>


            </div>
            </div>
         

         </div>
      </form>
   </div>

</body>
</html>