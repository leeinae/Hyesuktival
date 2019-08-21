<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset='utf-8' />
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>Login Page</h1>
	<section>
		<div class="panel-body">
			<form:form role="form" commandName="loginCommand" action="/loginS"
				method="post">
				<fieldset>
					<div class="form-group">
						<form:input type="text" class="form-control" placeholder="ID"
							path="id" />
						<form:errors path="id" />
					</div>
					<div class="form-group">
						<form:password class="form-control" placeholder="Password"
							path="password" />
						<form:errors path="password" />
					</div>
					<div class="checkbox">
						<label> <form:checkbox path="rememberId" />아이디 기억
						</label>
					</div>
					<button type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
				</fieldset>
			</form:form>
			<br>
			<!-- 네이버 로그인 창으로 이동 -->
			<div id="naver_id_login" style="text-align: center">
				<a href="${url}"> <img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a></div>
			<!-- 구글 로그인 창으로 이동 -->
			<div id="google_id_login" style="text-align: center">
				<a href="${google_url}"><button id="btnJoinGoogle" class="btn btn-primary btn-round" style="width: 100%"> Google Login</button></a>
			</div>
			<br>
		</div>
	</section>
</body>
</html>