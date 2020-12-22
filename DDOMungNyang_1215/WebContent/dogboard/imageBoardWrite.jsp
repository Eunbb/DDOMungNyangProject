<%@page import="com.login.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>이미지 업로드</title></head>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/bbs/assets/css/Ib.css"/>
</head>
<body>
	<body class="right-sidebar is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">

					<!-- Logo -->
						<h2><a href="/bbs/index.jsp">DDO:MUNGNYANG</a></h2>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="/bbs/index.jsp">Home</a></li>
								<li>
									<a >강아지분양</a>
									 <ul>
										<li><a href="/bbs/Iblist1.do?pg=1">업체 분양</a></li>
										<li><a href="/bbs/Iblist2.do?pg=1">업체 분양</a></li>
										<li><a href="/bbs/Iblist3.do?pg=1">업체 분양</a></li>
									</ul> 
								</li> 
								<li><a>고양이 분양</a>
								<ul>
										<li><a href="/bbs/Iblist4.do?pg=1">업체 분양</a></li>
										<li><a href="/bbs/Iblist5.do?pg=1">개인 분양 </a></li>
										<li><a href="/bbs/Iblist6.do?pg=1">유기 분양</a></li>
										
										</ul> 
										</li>
								<li><a href="#">심리테스트</a></li>
								<li><a href="/bbs/boardList.do?pg=1">Q&A</a></li>		
								
							</ul>
						</nav>

				</section>

   
   <form name="imageBoardWriteForm" method="post" enctype="multipart/form-data"  >
  
      
      <section id="main">
      <h1>업체분양 등록</h1>
      <div class="line">
         <div><b>분류</b></div>
         <div>
         <input type="checkbox" class="pet" id="classify1" name= "classify1" onclick="NoMultiChk(this)" value="1"><label>강아지</label>
         <input type="checkbox" class="pet" id="classify1" name="classify1" onclick="NoMultiChk(this)" value="2"><label>고양이</label></div>
      	 
     </div>
      
<% 
     LoginDTO entity = (LoginDTO)session.getAttribute("logOK");
     if(entity.getId().equals("ddomungyang@gmail.com")) { 
%>        
      <div class="line">
      <div>
         <b>분양 방식</b>
         <br><select id="classify2" name="classify2">
         <option>선택하세요                  
         <option id="company" name="company" value="A1">업체분양
         <option id="people" name="people" value="A2">개인분양
         <option id= "abandoded" name="abandonded" value="A3">유기분양</select></div>
      </div>
<%       
   } else {     
%>    	 
      <div class="line">
      <div>
         <b>분양 방식</b>
         <br><select id="classify2" name="classify2">
         <option>선택하세요                  
         <option id="people" name="people" value="A2">개인분양
         <option id= "abandoded" name="abandonded" value="A3">유기분양</select></div>
      </div>
<% 
     }
%>     
       
      <div class="line">
         <div><b>종류(한글)</b></div>
         <div><input type="text" name="kortype" id="kortype"></div>
      </div>
      
      <div class="line">
         <div><b>종류(영문)</b></div>
         <div><input type="text" name="engtype" id="engtype"></div>
      </div>
      
      <div class="line">
         <div><b>성별</b></div>
         <div><input type="checkbox" style="color:red" class="sex" onclick="NoMultiChk2(this)" name="sex" id="sex" value="M">남자
            <input type="checkbox" class="sex" onclick="NoMultiChk2(this)" name="sex" id="sex" value="F">여자         
         </div>
      </div>
      <div class="line">
         <div><b>나이</b>
         
         <br><input type="text" name="age" id="age">세
         </div>
      </div>
      <div class="line">
         <div><b>판매금액</b>
         <br><input type="text" name="price" id="price">원
         </div>
      </div>
      
      <div class="line">
         <div><b>접종여부</b></div>
         <div><select id="jusaType" name="jusaType">
         <option >선택하세요
         <option id="jusaok" name="jusaok" value="O">O
         <option id="jusano" name="jusano" value="X">X
         </select></div>
      </div>
      
      <div>
         <div><b>사진</b></div>
         <div><input type="file" name="imagepath" id="imagepath" size="40"></div>
       </div>
      
     
       </section>
       <section id="btn">
         <input type="submit" value="등록" onclick="checkImageBoardWrite()">
         <input type="reset" value="취소">
         <input type="button" value="목록" onclick="location.href='/bbs/Iblist.do?pg=1'">
         </section>
 
  
   </form>
   <hr/>
    <script type="text/javascript">
   
      function NoMultiChk(chk){
          var obj = document.getElementsByName("classify1");
          for(var i=0; i < obj.length; i++){
              if(obj[i] != chk){
                  obj[i].checked = false;
              }
          }
      }
      function NoMultiChk2(chk){
          var obj = document.getElementsByName("sex");
          for(var i=0; i < obj.length; i++){
              if(obj[i] != chk){
                  obj[i].checked = false;
              }
          }
      }
      
      function checkImageBoardWrite() {
         if($('input.pet').is(":checked")==false){
            alert("분류코드를 선택하세요");
         }else if(document.imageBoardWriteForm.classify2.value=="") {
            alert("분양 방식을 선택하세요");
         }else if(document.imageBoardWriteForm.kortype.value=="") {
            alert("종류(한글)를 입력하세요");
         }else if(document.imageBoardWriteForm.engtype.value=="") {
            alert("종류(영문)를 입력하세요");
         }else if($('input.sex').is(":checked")==false) {
            alert("성별를 선택하세요");
         }else if(document.imageBoardWriteForm.age.value=="") {
            alert("나이를 입력하세요");
         }else if(document.imageBoardWriteForm.price.value=="") {
            alert("금액을 입력하세요");
         }else if(document.imageBoardWriteForm.jusaType.value==""){
            alert("접종여부를 선택하세요");
         }else if(document.imageBoardWriteForm.imagepath.value=="") {
            alert("사진 이미지를 첨부하세요");
         }else {
            document.imageBoardWriteForm.submit();
                imageBoardWriteForm.action="/bbs/imgBoardWrite.do"
         }
      }


      
      </script>
</body>
</html>

