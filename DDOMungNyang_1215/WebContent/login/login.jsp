<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
      <link rel="stylesheet" href="/bbs/assets/css/login.css" />
   </head>
   <body class="/main/homepage is-preload">
      <div id="page-wrapper">
         <!-- 로그인/회원가입 버튼 -->
         <section id="starter">
         <div id="menu">
         
            <button id="home_btn" onclick="location.href='/bbs/index.jsp' " >HOME</button>
            <button id="register_btn" onclick="location.href='/bbs/login/register.jsp'">회원가입</button>
            
            </div>
          </section>
          
            
      
         <!-- Header -->
            <section id="header">
            
               <!-- Logo -->
                  <h1><a href="/bbs/index.jsp">DDO:MUNGNYANG</a></h1>
               <div >      
       <p>&nbsp;</p>
      
      <form class="form-horizontal" action="/bbs/login.do" method="post">
       <div class="form-group">
          <div class="col-sm-6 text-left">
             <input type="text" class="form-control" placeholder="아이디" name="id" id="id" value="${member.id }">
             <p style="color:red;">${idError}</p>
          </div>
       </div>
       
       <div class="form-group">
          <div class="col-sm-6">
             <input type="password" class="form-control" placeholder="비밀번호" name="pwd" id="pwd" >
             <p style="color:red;">${pwdError}</p>
          </div>
       </div>
       
       <div class="form-group" >
          <div class="col-sm-12  text-center">
          <input type="hidden" name="ip" value="${GetIpAddress.getIp()}">
          <input type="submit" value="로그인" class="btn btn-success">
          </div>
       </div>
      </form> 
     </div>
   </div>
               <!-- Banner -->
                  <section id="banner">
                     <header>

                     </header>
                  </section>
   </body>
</html>
