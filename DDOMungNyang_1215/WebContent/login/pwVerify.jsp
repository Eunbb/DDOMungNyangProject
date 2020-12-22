<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%
   String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url("fontawesome-all.min.css");
@import url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,900,300italic");

@import url('https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    input[type="button"],
   input[type="password"],
   button,
   .button {
      -webkit-appearance: none;
      display: inline-block;
      text-decoration: none;
      border-radius: 5px;
      border: 2px solid #FF6347;
      background: transparent;
      font-family: 'Jua', sans-serif;
      color: #FA8072 !important;
      font-weight: 700;
      outline: 0;
      font-size: 1.1em;
      margin-top: 0.6em;
      padding: 0.5em 1.5em 0.5em 1.5em;
   }
   
   input[type="button"]:hover,
       button:hover,
      .button:hover {
         background: transparent;
         color: #808080 !important;
      }

</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
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
                   alert('비밀번호를 입력해주세요');
             }
          });
       } else{
          alert('비밀번호가 일치하지 않습니다.');
       }
     }
</script>
<body>
<p style="font-family:'Jua', sans-serif; color: #FA8072; font-size: 1.4em; text-align: center; margin-top: 2.5em">현재 비밀번호를 입력해주세요 </p>
   <form class="form-horizontal">
      <div class="form-group">
         <div class="col-sm-6 text-left" style="text-align: center; margin-top: 4em">
            <input type="password" class="form-control" placeholder="비밀번호" name="pw" id="pw">
         </div>
      </div>

      <div class="form-group">
         <div class="col-sm-6" style="text-align: center">
            <input type="password" class="form-control" placeholder="비밀번호확인"
               name="pwchk" id="pwchk">
            <p style="color: red;" id="pwdmg">${pwdmg}</p>
         </div>
      </div>

      <div class="form-group">
         <div class="col-sm-12  text-center" style="text-align: center">
            <input type="hidden" name="id" value="<%=id%>">
            <button type="button" style="cursor: pointer;" onclick="pwchkfunction()">확인</button>
         </div>
      </div>
   </form>
</body>
</html>