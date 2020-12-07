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
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/bbs/assets/css/register.css" />
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
		<form class="form-horizontal" action="/bbs/SignUp.do" method="post">
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
									<input type="email" id="sample6_postcode"
										placeholder="이메일로입력해주세요" name="id" class="form-control"
										value="${member.email }">
								</div>
								<div class="adress_button">
									<input type="button" id="adress_button" onclick=""
										value="인증번호 발송" class="btn">
								</div>

								<!-- div 끝 -->
								<p style="color: red;">${idError}</p>
							</div>
							<h3 class="col-sm-2 control-label">
								<label for="id">인증번호</label>
							</h3>
							<div class="inputWrap">
								<!-- div시작 -->
								<div class="col-sm-3">
									<input type="text" id="sample6_postcode" placeholder="인증번호 입력"
										name="zip_num" class="form-control" value="${member.zip_num }">
								</div>
								<div class="adress_button">
									<input type="button" id="adress_button" onclick="" value="확인"
										class="btn">
								</div>

								<!-- div 끝 -->
								<p style="color: red;">${idError}</p>
							</div>

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
							<div class="col-sm-6">
								<input type="password" class="form-control" name="repw"
									id="repw">
								<p style="color: red;">${pwdCheckError}</p>
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
									<span class="ps_box"> <input type="text" id="yy" name="yy"
										placeholder="년(4자)" aria-label="년(4자)" class="int"
										maxlength="4">
									</span>
								</div>
								<div class="bir_wrap">
									<div class="bir_mm">
										<span class="ps_box"> <select id="mm" class="sel"  name="mm"
											aria-label="월">
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
										<span class="ps_box"> <input type="text" id="dd"  name="dd"
											placeholder="일" aria-label="일" class="int" maxlength="2">
											<label for="dd" class="lbl"></label>
										</span>
									</div>
								</div>
								<span class="error_next_box" id="birthdayMsg"
									style="display: none" aria-live="assertive"></span>
							</div>
						</div>
						<div class="join_row">
							<h3 class="col-sm-2 control-label">
								<label for="email" id="email" >닉네임</label>
							</h3>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="nick" id="ncik"
									value="">
								<p style="color: red;">${emailError}</p>
							</div>
						</div>
						<div class="join_row">
							<h3 class="col-sm-2 control-label">
								<label for="phone" id="phone">전화번호</label>
							</h3>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="phone" id="phone"
									value="${member.phone }">
							</div>
						</div>
					</div>
					<div class="row_group">
						<div class="join_row">
							<h3 class="col-sm-2 control-label">
								<label for="zip_num" id="zip_num">우편번호</label>
							</h3>
							<div class="col-sm-3">
								<input type="text" id="zipcode" placeholder="우편번호"
									name="zipcode" class="form-control" value="${member.zip_num }">
							</div>
							<div class="adress_button">
								<input type="button" id="adress_button"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
									class="btn btn-primary">
							</div>
							<p style="color: red;">${zip_numError}</p>

							<div class="col-sm-3"></div>
						</div>
						<div class="join_row">
							<h3 class="col-sm-2 control-label">
								<label for="address1" id="address1">주소</label>
							</h3>
							<div class="col-sm-6">
								<input type="text" id="addr" placeholder="주소" name="addr"
									class="form-control" value="${member.address1 }">

							</div>
						</div>
						<div class="join_row">
							<div class="col-sm-12">
								<p style="color: red;">${zip_numError}</p>
							</div>
						</div>
						<div class="join_row">
							<h3 class="col-sm-2 control-label">
								<label for="address1" id="address1">상세주소</label>
							</h3>
							<div class="col-sm-6">
								<input type="text" id="addr1" placeholder="상세주소" name="addr1"
									class="form-control" value="${member.address2 }">
							</div>
						</div>
						<div class="join_row">
							<div class="col-sm-2"></div>
							<div class="col-sm-8">
								<p style="color: red;" class="text-center">${addressError}</p>
							</div>
						</div>
					</div>
					<div class="row_group">
						<div class="join_row">
							<div class="col-sm-12  text-center">
								<input type="hidden" name="ip" value="${GetIpAddress.getIp()}">
								<input type="submit" value="가입하기" class="btn btn-success">
							</div>
						</div>
					</div>
					

				</div>

			</div>
			</form>
	</div>
	
</body>
</html>