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
				
				<form:form role="form" commandName="signupRequest" action="/signupSuccess" method="post">
					
					<span class="login100-form-title p-b-26" style="font-family: 'S-CoreDream-8Heavy';">
						회원가입
					</span>									

					<table  class="board_list" style="border-collapse: separate; border-spacing: 0 20px;">
					<tr>
						<th scope="row" style="font-family: 'LotteMartDream';">아이디</th>
						<td><form:input type="text" class="form-control"
								placeholder="ID" path="id" /> <form:errors path="id" /></td>
						<td></td>
					</tr>					
				
					<tr>
						<th scope="row" style="font-family: 'LotteMartDream';">비밀번호</th>
						<td><form:password class="form-control" placeholder="Password"
								path="password" /> <form:errors path="password" /></td>
						<td></td>
					</tr>					
						
					<tr>
						<th scope="row" style="font-family: 'LotteMartDream';">비밀번호 &nbsp;&nbsp;확인</th>
						<td><form:password class="form-control"
								placeholder="Password Check" path="password2" /> <form:errors
								path="password2" /></td>
						<td></td>
					</tr>					
	
					<tr>
						<th scope="row" style="font-family: 'LotteMartDream';">닉네임</th>
						<td><form:input type="text" class="form-control"
								placeholder="Nickname" path="nickname" /> <form:errors
								path="nickname" /></td>
						<td></td>
					</tr>					
	
					<tr>
						<th scope="row" style="font-family: 'LotteMartDream';">이메일</th>
						<td><form:input type="email" class="form-control"
								placeholder="E-mail" path="email" /></td>
						<td></td>
					</tr>
					
				</table>
			
			<br>
			<div align="center">								
				<button type="submit" class="btn btn-defualt"
				 style="background: teal;font-family: 'LotteMartDream';width: 130px;" >가입</button>				
				<button type="reset"  class="btn btn-defualt" style="background:gray;
				   font-family: 'LotteMartDream';width: 130px;margin-left: 10px; ">취소</button>
			</div>	
		
			</form:form>				
			</div>	
			<br>
			<br>
		
			</div>
		</div>
	
	

	<!-- <div id="dropDownSelect1"></div> -->
	
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
	
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	

</body>
</html>