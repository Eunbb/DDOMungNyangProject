<%@page import="com.login.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.board.dto.BoardPaging"%>
<%@page import="com.board.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<style>
#header {border-bottom: 1px #ccc;}
div.write {background-color:#ffffff;}
input[type="submit"]{padding: 0.6em 1.5em 0.65em 0.5em;}

table.QnA-table tr th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #000000;
  background: #FFFAFA;
  margin: 20px 10px;
  
}

table.QnA-table td.td1  {
  width: 150px;
  padding: 10px;
  
  vertical-align: top;
  color: #A9A9A9;
  background: #FFFAFA;
  margin: 20px 10px;
}

.subjectA {
  width: 150px;
  font-weight: bold;
  vertical-align: top;
  color: #FFA07A;
  background: #FFFAFA;
  text-align:left;
}

table.QnA-table tr th.th1 {
  text-align: center;
}

a {
 color: #FFA07A;
 text-decoration: underline;
}
font {
 color: #FFA07A;
}
</style>

<script>				
function btn_write() {
 	var entity ='<%=(LoginDTO)session.getAttribute("logOK")%>';
	if(entity == "null") {
 	   alert('로그인이 필요합니다');
	} else {
 		writeUp.action="/bbs/qna/qnaWrite.jsp"
	}
  } 

function boardView(seq,pg){
	location.href="/bbs/boardView.do?seq="+seq+"&pg="+pg;	
}
</script>

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
								<li class="current"><a href="#">Q&A</a></li>
							</ul>
						</nav>
				</section>



<!-- QnA board -->

<%
	List<BoardDTO> list=(List<BoardDTO>)request.getAttribute("list");
	int pg=(Integer)request.getAttribute("pg");
	BoardPaging paging=(BoardPaging)request.getAttribute("paging");
%>

<form class="form-horizontal"  method="post" name="writeUp">
<div class="write">        
<input type="submit" id="register_btn" onclick="btn_write()"
		style="font-size:1.5em; margin:0" value="글등록하기★" class="btn">
</div>
<table class="QnA-table">
	<tr>
		<td colspan="5" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<th width="100">글번호</th>
		<th width="300">제목</th>
		<th class="th1" width="100">작성자</th>
		<th class="th1" width="100">조회수</th>
		<th class="th1" width="100">작성일</th>
	</tr>
	<tr>
		<td colspan="5" bgcolor="#ffffff"></td>
	</tr>
<%
	if(list != null)
	{
		for(BoardDTO ob:list)
		{
%>	
		<tr>
			<td class="td1"><%=ob.getSeq()%></td>
			<td class="td1">
<%
				for(int i=0; i<ob.getLev(); i++)  //댓글 들여쓰기
				{
%>				
				&nbsp;
<%
				}

				if(ob.getPseq() != 0)    // 원래글은 표식(X), 댓글에 표식(O)
				{
%>				
				<img src="images/qna/reply.gif">
<%
				}
%>			
			   <a href="#" 
			   onclick="boardView('<%=ob.getSeq()%>','<%=pg%>')" 
			   class="subjectA"><%=ob.getSubject()%></a>
		
			</td>
			<td class="td1" align="center"><%=ob.getId()%></td>
			<td class="td1" align="center"><%=ob.getHit()%></td>
			<td class="td1" align="center"><%=ob.getLogtime()%></td>
		</tr>
		<tr>
			
		</tr>
<%
		}//end for
	} //end if
%>	
	<tr>
		<td colspan="5" bgcolor="#ffffff"></td>
	</tr>
	<tr>	
		<td colspan="5" align="center" bgcolor="#ffffff"><%=paging.getPagingHTML()%> </td>
	</tr>
</table><br>
</form>                  


			<!-- Footer -->
				<section id="footer">
            <div class="container">
               <div class="row">
                  <div class="col-8 col-12-medium">
                     <section id="footer">
                        <header>
                           <h2></h2>
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
                              <li><a class="fab fa-facebook-f" href="#"><span
                                    class="label"></span></a></li>
                              <li><a class="fab fa-twitter" href="#"><span
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