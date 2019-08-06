<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset='utf-8' />
<link href='/resources/fullcalendar/packages/core/main.css'
	rel='stylesheet' />
<link href='/resources/fullcalendar/packages/daygrid/main.css'
	rel='stylesheet' />
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src='/resources/fullcalendar/packages/core/main.js'></script>
<script src='/resources/fullcalendar/packages/interaction/main.js'></script>
<script src='/resources/fullcalendar/packages/daygrid/main.js'></script>
<style>
.board_list {
	width: 500px;
	margin: 0 auto;
}

.board_list tfoot {
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>Signup Page</h1>
	<section>
		<form:form role="form" commandName="signupRequest"
			action="/signupSuccess" method="post">
			<table class="board_list">
				<tr>
					<th scope="row">아이디</th>
					<td><form:input type="text" class="form-control"
							placeholder="ID" path="id" /> <form:errors path="id" /></td>
					<td></td>
				</tr>

				<tr>
					<th scope="row">비밀번호</th>
					<td><form:password class="form-control" placeholder="Password"
							path="password" /> <form:errors path="password" /></td>
					<td></td>
				</tr>

				<tr>
					<th scope="row">비밀번호 확인</th>
					<td><form:password class="form-control"
							placeholder="Password Check" path="password2" /> <form:errors
							path="password2" /></td>
					<td></td>
				</tr>

				<tr>
					<th scope="row">닉네임</th>
					<td><form:input type="text" class="form-control"
							placeholder="Nickname" path="nickname" /> <form:errors
							path="nickname" /></td>
					<td></td>
				</tr>

				<tr>
					<th scope="row">이메일</th>
					<td><form:input type="email" class="form-control"
							placeholder="E-mail" path="email" /></td>
					<td></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<button type="submit" class="btn btn-default">가입하기</button>
				<button type="reset" class="btn btn-default">취소하기</button>
			</div>
		</form:form>
	</section>
</body>
</html>