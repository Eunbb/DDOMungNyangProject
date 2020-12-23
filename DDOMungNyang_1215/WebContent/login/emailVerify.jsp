<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
@import url("fontawesome-all.min.css");
@import url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,900,300italic");

@import url('https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
   
   button[type="submit"],
   .button {
      -webkit-appearance: none;
      display: inline-block;
      text-decoration: none;
      border-radius: 5px;
      border: 2px solid #FF6347;
      background: transparent;
      font-family: 'Jua', sans-serif;
      font-weight: 700;
      color: #FA8072 !important;
      outline: 0;
      font-size: 1.1em;
      margin-top: 0.6em;
      padding: 0.5em 1.5em 0.5em 1.5em;
     
   }
   
   input[type="text"] {
    -webkit-appearance: none;
      display: inline-block;
      text-decoration: none;
      border-radius: 5px;
      border: 2px solid #FF6347;
      background: transparent;
      font-family: 'Jua', sans-serif;
      font-weight: 700;
      color: #000000 !important;
      outline: 0;
      text-align:center;
      font-size: 1.3em;
      margin-top: 0.6em;
      padding: 0.5em 1.5em 0.5em 1.5em;
   }
   
   button[type="submit"]:hover,
       button:hover,
      .button:hover {
         background: transparent;
         color: #808080 !important;
      }

</style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function pwchkfunction() {
		signup.action = "/bbs/email/sendMail.jsp"
	}
</script>
<body>
	<p style="font-family:'Jua', sans-serif; color: #FA8072; font-size: 1.4em; text-align: center; margin-top: 2.5em">이메일 인증화면입니다.</p>
	<form class="form-horizontal" method="post"
		name="signup">
		<div class="form-group">
			<div class="col-sm-6 text-left" style="text-align: center; margin-top: 4em">
				<input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="pw" id="pw" value=<%=id%> readonly >
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-12  text-center" style="text-align: center;">
				<input type="hidden" name="id" value="<%=id%>">
				<button type="submit" style="cursor: pointer; " onclick="pwchkfunction()">이메일 인증하기</button>
			</div>
		</div>
	</form>
</body>
</html>