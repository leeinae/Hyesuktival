<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Login V2</title>
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
			<div class="wrap-login100" style="height: 400px;width: 500px;">	
				<c:choose>
					<c:when test="${msg == true }">				
							<form action="${pageContext.request.contextPath }/myPageEdit" method="POST">				
								<span class="login100-form-title p-b-26" style="font-family: 'S-CoreDream-8Heavy';">
									회원정보 수정
								</span>							
			
								<table  class="board_list" style="border-collapse: separate; border-spacing: 0 20px;">
							
								<tr>
									<th scope="row" style="font-family: 'LotteMartDream';">이메일</th>
									<td><input type="text" name="email" value="${requestScope.userData.email }"/><br></td>
									<td></td>
								</tr>					
							
								<tr>
									<th scope="row" style="font-family: 'LotteMartDream';">비밀번호</th>
									<td><input type="password" name="password" value="${requestScope.userData.password }"/></td>
									<td></td>
								</tr>					
									
								<tr>
									<th scope="row" style="font-family: 'LotteMartDream';">비밀번호 &nbsp;&nbsp;확인</th>
									<td><input type="password" placeholder="비밀번호 확인"></td>
									<td></td>
								</tr>					
				
								<tr>
									<th scope="row" style="font-family: 'LotteMartDream';">닉네임</th>
									<td><input type="text" name="nickname" value="${requestScope.userData.nickname }"/><br></td>
									<td></td>
								</tr>					
												
								
							</table>
						
							<br>
							
							<div align="center">								
								<button type="submit" class="btn btn-defualt"
								 style="background: teal;font-family: 'LotteMartDream';width: 130px;" >수정</button>
							</div>	
						
							</form>
					</c:when>
					<c:otherwise>
						<img src='/resources/Detail/img/notice.png' width="60" height="60" style="margin-left: 160px;">
						<br>
						<br>
						<h4 style="text-align: center;"> 네이버와 구글 로그인 회원은 </h4><p><h4 style="text-align: center;">회원정보 수정이 불가합니다.</h4>
						<br>
						<br>
						<a href="${pageContext.request.contextPath }/"><button style="margin-left: 160px;">돌아가기</button></a>					
					</c:otherwise>	
				</c:choose>			
			</div>	
			<br>
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