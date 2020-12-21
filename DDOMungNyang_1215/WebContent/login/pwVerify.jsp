<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
	$(document).ready(function() {

		$("#pwchk").keyup(function() {
			var pw1 = $("#pw").val();
			var pw2 = $("#pwchk").val();

			if (pw1 !== pw2) {
				$("#pwdmg").text("비밀번호가 일치하지않습니다").css({
					'font-weight' : 'bold', 'color' : 'red'
				});
			} else{
				$("#pwdmg").text("");
			}
		})
		
	});
	
    function pwchkfunction(){
		var pw1 = $("#pw").val();
		var pw2 = $("#pwchk").val();
     	if(pw1 == pw2){
            var id = $('input[name=id]').val();            
             $.ajax({
                type:'POST',
                url:'../CheckpwServlet',
                data: {id : id, pwd : pw1},
                success:function(jsonObj) {
                	var obj = JSON.parse(jsonObj);
                	if(obj.pwd == pw1) {
                		alert('확인되었습니다.');
                		opener.location.href="javascript:verification();";
                		window.close();
                	} else{
                		alert('비밀번호가 틀렸습니다.')
                	}
                 }, error : function(data,textStatus) {
                	alert('ajax 연결오류');
             }
          });
    	} else{
    		alert('비밀번호가 일치하지 않습니다.');
    	}
     }
</script>
<body>
<div>현재 비밀번호를 입력해주세요 </div>
	<form class="form-horizontal">
		<div class="form-group">
			<div class="col-sm-6 text-left">
				<input type="password" class="form-control" placeholder="비밀번호" name="pw" id="pw">
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-6">
				<input type="password" class="form-control" placeholder="비밀번호확인"
					name="pwchk" id="pwchk">
				<p style="color: red;" id="pwdmg">${pwdmg}</p>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-12  text-center">
				<input type="hidden" name="id" value="<%=id%>">
				<button type="button" style="cursor: pointer;" onclick="pwchkfunction()">확인</button>
			</div>
		</div>
	</form>
</body>
</html>