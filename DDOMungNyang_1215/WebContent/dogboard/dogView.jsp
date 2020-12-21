<!--  건우 수정 부분 -->

<%@page import="com.login.dto.LoginDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ib.dto.Ibpaging"%>
<%@page import="com.ib.dto.IbDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	IbDTO dto=(IbDTO)request.getAttribute("dto");
	int pg=(Integer)request.getAttribute("pg");
	int petid=(Integer)request.getAttribute("petid");
%>
<!DOCTYPE HTML>


<html>
<script>
function del() {
	   var del = confirm("삭제할까요?");
	   if(del){
    	  location.href='dogDelete.do?petid=<%=petid%>&pg=<%=pg%>'
	   }
	}

//건우 수정부분1
function replyBtn() {
	var replywrite = document.getElementById("replywrite");
    	if(replywrite.style.display=="none") {
    		replywrite.style.display = "block";
    	}else {
    		replywrite.style.display = "none";
    }
}


	
</script>
	<head>

<!--  건우수정부분2 -->	
<style>
#lg1 {
	margin: 21px;
	float: left;
}

#lg2 {
	border-left: 1px solid black;
	padding-left: 40px;
	margin: 20px;
	float: left;
}

#lg3 {
	margin: 30px;
	float: right;
}

#searchbox {
	margin-top: 30px;
	margin-left: 100px;
	float: left;
}

.content {
 	margin: 0 auto; 
	width: 700px;
	margin-top: 100px;
	background-color: white;
	border-bottom: 1px solid black;
	border-left: 1px solid black;
	border-right: 1px solid black;
	border-top: 1px solid black;
	font-family: 'Jua', sans-serif;
	font-weight: bold;
	
	
}

#userimg {
	border-radius: 100px;
	width: 50px;
	height: 50px;
	border: 2px solid #FFE4E1;
	margin: 10px;
	float: left;
	align: bottom;
}
.user {
	font-size: 20px;
	float: left;
	margin-top: 25px;
	
}

#userphoto {
	width:100%;
	height: 400px;
}

#instaticon {
	width: 40px;
	height: 40px;
    
}

.like {
	margin-left: 10px;
}

.comment {
	margin-left: 10px;
	font-size: 13px;
}

#commentin {
	border: none;
	width: 80%;
	height: 40px;
	font-size: 15px;
	margin-left: 10px;
}

#commentin:-webkit-input-placeholder {
	font-size: 15px;
}

#menuimg {
	width: 50px;
	height: 40px;
	margin-left: 10px;
}

.comment2 {
	width: 99%;
	margin: 20px;
	float: left;
}

#replyBtn {
   -webkit-appearance: none;
		display: inline-block;
		text-decoration: none;
		cursor: pointer;
		background: transparent;
		color: slategray;
		font-family: 'Jua', sans-serif;
		outline: 0;
/* 		font-size: 1.3em; */
 		padding: 0em 0em 1em 0em; 
		text-align: left;
		-moz-transition: background-color .25s ease-in-out;
		-webkit-transition: background-color .25s ease-in-out;
		-ms-transition: background-color .25s ease-in-out;
		transition: background-color .25s ease-in-out;
}

#replyBtn:hover{
              background-color:transparent !important;
	          color: rgba(96, 87, 87, 0.55) !important;
	          display: inline-block;
}

section#btn {
   text-align:center;
}

</style>	
	
	   <meta name= "viewport" content="width=device-width, initial-scale=1.0">
	   <meta http-equiv="X-UA-Compatible" content="ie=edge">
	  

<!--  건우수정 부분3 -->	
		<div id="page-wrapper">
			<!-- 로그인/회원가입 버튼 -->
			<section id="starter">
			<div id="menu">
			<!-- 로그인/회원가입 버튼 -->
			
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
				<form name="MyProfile" method="post" action="/bbs/myPro.do?id=<%= entity.getId() %>">
					<button id="profile_btn" onclick="myProfile()">내정보</button><br>
				</form>
<%                         
   }
%>
			</div>
			</section>
			</div>
		<title>이미지 상세보기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="right-sidebar is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">

					<!-- Logo -->
						<h1><a href="/bbs/index.jsp">상세페이지</a></h1>

                   
					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="/bbs/index.jsp">Home</a></li>
								<li><a>강아지분양</a>
								    <ul>
										<li><a href="/bbs/Iblist1.do?pg=1">업체 분양</a></li>
										<li><a href="/bbs/Iblist2.do?pg=1">개인 분양 </a></li>
				                        <li><a href="/bbs/Iblist3.do?pg=1">유기 분양</a></li>
									</ul> 
								</li>
								
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

				</section>
				</div>


<!--  건우수정부분4 -->
<%
   if(dto.getGender().equals("M")) {
	  dto.setGender("남자");
   }else if(dto.getGender().equals("F")) {
	   dto.setGender("여자");
   }
%>

<%
   if(dto.getJusa().equals("O")) {
	  dto.setJusa("예방접종해서 건강해요!");
   }else if(dto.getJusa().equals("X")) {
	   dto.setJusa("예방접종은 아직이에요..");
   }
%>

<div class="content">
   <img id="userimg" src="/bbs/storage/<%=dto.getPic()%>">
   <p class="user"><%=dto.getDogkortype()%></p>
   <img id="userphoto" src="/bbs/storage/<%=dto.getPic()%>">
<%--    <div style=text-align:center;>성별 :<%=dto.getGender()%></div> --%>
<%-- 	<div style=text-align:center;>나이 : <%=dto.getAge() %></div> --%>
<%-- 	<div style=text-align:center;>접종여부 : <%=dto.getJusa() %></div> --%>
	
	<div style="text-align:center; font-size:2.0em;">분양가 : <span style= color:#3f729b><%=dto.getPrice() %></span>원</div>
   <img id="instaticon" src="/bbs/images/like.png">
   <p style="margin-bottom:0em; font-size:1.5em;" class="like">좋아요 <%=dto.getHeart()%>개</p>
   <div class="comment">
   <p style="margin-bottom:0em; font-size:1.5em;"><%=dto.getDogkortype()%> <span style="color: #3f729b;"> #<%=dto.getAge()%>살  #<%=dto.getGender()%>구요 #<%=dto.getJusa()%></span></p>
   <p style="margin-bottom:0em; margin-top:1em; font-size:1.5em">건우&nbsp;&nbsp;<span style=color:#3d3c3c>퍼가요~♥</span></p>
   <input type="button" id="replyBtn" onclick='replyBtn()' value="댓글 3개 모두 보기">
   
   <div id="replywrite" style="display:none;">
  
   <p style="margin-bottom:0em; font-size:1.5em">재혁&nbsp;&nbsp;<span style=color:#3d3c3c>비싸요</span></p>
   <p style="margin-bottom:0em; font-size:1.5em">동욱&nbsp;&nbsp;<span style=color:#3d3c3c>울집 강아지가 더귀엽네 ㅋ</span></p>
   <p style="margin-bottom:0em; font-size:1.5em">은비&nbsp;&nbsp;<span style=color:#3d3c3c>배고파</span></p>
   <p style="font-size:10px; color: slategray; margin-top:1em; font-size:1em">13시간 전 </p>
   
   </div>

</div>
<br><br><br>
<section id="btn">
 <!--  또멍냥(관리자계정) 으로 로그인했을떄만 뜨게함(건우 수정부분5) -->
 <%
	if(entity == null) {
%>      
      <input type="button" value="목록" onclick="location.href='/bbs/Iblist1.do?pg=1'">
<% 
     }else if(session.getAttribute("id") !=null) {
         if(session.getAttribute("id").equals(entity.getId())) {
%>
        <input type="button" value="목록" onclick="location.href='/bbs/Iblist1.do?pg=1'">
		<input type="button" value="글수정" onclick="location.href='dogModify.do?petid=<%=petid%>&pg=<%=pg%>'">
		<input type="button" value="글삭제" onclick="del()"> 
<%
    }
     }else {
%>
        <input type="button" value="목록" onclick="location.href='/bbs/Iblist1.do?pg=1'">
        <input type="button" value="찜하기" onclick="location.href='#'">
<%
    }
%>        
		</section>		   
</div>
<br>
			

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>