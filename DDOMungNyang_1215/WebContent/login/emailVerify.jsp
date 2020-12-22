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
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function pwchkfunction() {
		signup.action = "/bbs/email/sendMail.jsp"
	}
</script>
<body>
	<div>이메일 인증화면입니다.</div>
	<form class="form-horizontal" method="post"
		name="signup">
		<div class="form-group">
			<div class="col-sm-6 text-left">
				<input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="pw" id="pw" value=<%=id%> readonly>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-12  text-center">
				<input type="hidden" name="id" value="<%=id%>">
				<button type="submit" style="cursor: pointer;" onclick="pwchkfunction()">이메일 인증하기</button>
			</div>
		</div>
	</form>
</body>
</html>