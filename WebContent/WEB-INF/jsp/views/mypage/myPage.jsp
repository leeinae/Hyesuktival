<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
    $(function(){
        var errors = "<c:out value="${errors}" />";
        if(errors != ""){
            alert(errors)
        }
    }) 
</script>
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
	<h1>마이페이지</h1>
	<section>
		<div class="panel-body" align="center">
			<form:form role="form" commandName="vo"
				action="${pageContext.request.contextPath }/myPageEdit"
				method="post">
				<table class="board_list">
					<tr>
						<th scope="row">이메일</th>
						<td><form:input type="email" class="form-control"
								value="${requestScope.userData.email }" path="email" /></td>
						<td></td>
					</tr>

					<tr>
						<th scope="row">닉네임</th>
						<td><form:input type="text" class="form-control"
								value="${requestScope.userData.nickname }" path="nickname" /> <form:errors
								path="nickname" /></td>
						<td></td>
					</tr>

					<tr>
						<th scope="row">비밀번호</th>
						<td><form:password class="form-control"
								placeholder="Password" path="password" /> <form:errors
								path="password" /></td>
						<td></td>
					</tr>

					<tr>
						<th scope="row">비밀번호 확인</th>
						<td><form:password class="form-control"
								placeholder="Password Check" path="password2" /> <form:errors
								path="password2" /></td>
						<td></td>
					</tr>
				</table>
				<br>
				<button type="submit" class="btn btn-default">수정하기</button>
			</form:form>
		</div>
	</section>
</body>
</html>