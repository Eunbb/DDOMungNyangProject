<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/login/login.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	

<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
window.onload = function () {
	alert("아이디나 비밀번호가 틀렸습니다"); 
	history.go(-1);
}

$(document).ready(function() { 
});

</script>
</body>
</html>

