<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>HYESUKTIVAL</title>
	<meta charset="EUC-KR">
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login_v2/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login_v2/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login_v2/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login_v2/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/Login_v2/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login_v2/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login_v2/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/Login_v2/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login_v2/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/Login_v2/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form:form role="form" commandName="loginCommand" action="/loginS"
				method="post">
					<span class="login100-form-title p-b-26">
						Welcome To
					</span>
					<span class="login100-form-title p-b-48">
						<!-- <i class="zmdi zmdi-font"></i> -->
						<h1 style="font-family:Summer Festival;"><strong>HYESUKTIVAL</strong></h1>
					</span>
					<!-- 아이디 -->										
					<div class="form-group wrap-input100 validate-input">
						<form:input type="text" class="input100"  placeholder="ID" path="id" />
						<form:errors path="id" />
					</div>
					<!-- 비밀번호 -->
					<div class="form-group wrap-input100 validate-input" >
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<form:password class="input100" placeholder="Password" path="password"/>						
						<form:errors path="password" />
					</div>
					
					<div class="checkbox">
						<label> <form:checkbox path="rememberId" />아이디 저장
						</label>
					</div>
					

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="submit" >
								Login
							</button>
						</div>
					</div>
					<br>
				</form:form>
					<!-- 네이버 로그인 창으로 이동 -->
					<div id="naver_id_login" style="text-align: center">
						<a href="${url}"> <img width="280" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a></div>
					<!-- 구글 로그인 창으로 이동 -->
					<br>
					<div id="google_id_login" style="text-align: center">
						<a href="${google_url}"><button id="btnJoinGoogle" class="btn btn-primary btn-round" style="width: 100%"> Google Login</button></a>
					</div>
					<br>
					<br>
					
					<div class="text-center p-t-40">
						<span class="txt1">
							Don't have an account?
						</span>

						<a class="txt2" href="/signup">
							Sign Up
						</a>
					</div>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/resources/Login_v2/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/Login_v2/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/Login_v2/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/Login_v2/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/Login_v2/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/Login_v2/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/Login_v2/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/resources/Login_v2/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/resources/Login_v2/js/main.js"></script>

</body>
</html>