<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>검색 결과 페이지</h1>
	<hr>
	<br>
	<h1>페스티벌 검색결과</h1>
	<c:forEach items="${requestScope.searchList }" var="result">
		<h5><a href="${pageContext.request.contextPath }/festival/${result.fid}">${result.fname }</a></h2>
	</c:forEach>
	<hr>
	<h1>아티스트 검색결과</h1>
</body>
</html>