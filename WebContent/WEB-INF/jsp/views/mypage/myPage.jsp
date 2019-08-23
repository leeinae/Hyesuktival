<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>마이페이지</h1>
<c:choose>
	<c:when test="${msg == true }">
		<form action="${pageContext.request.contextPath }/myPageEdit" method="POST">
			<input type="text" name="email" value="${requestScope.userData.email }"/><br>
			<input type="text" name="nickname" value="${requestScope.userData.nickname }"/><br>
			<input type="password" name="password" value="${requestScope.userData.password }"/><br>
			<input type="password" placeholder="비밀번호 확인">
			<button type="submit">회원정보 수정</button>
		</form>
	</c:when>
	<c:otherwise>
		<h2> 네이버, 구글 로그인 회원은 회원정보 수정이 불가합니다.</h2>
		<a href="${pageContext.request.contextPath }/"><button>돌아가기</button></a>
	</c:otherwise>
</c:choose>
</body>
</html>