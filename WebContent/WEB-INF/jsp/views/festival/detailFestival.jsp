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
	<h1>공연 상세 페이지</h1>
	<br>
	<img src="${requestScope.festival.src}"/>
	<h2>${requestScope.festival.fname}</h2>
	<h2>${requestScope.festival.startDate}</h2>
	<h2>${requestScope.festival.endDate}</h2>
	<h2>${requestScope.festival.floc}</h2>
	
	<h1>---라인업----</h1>
	<c:forEach items="${requestScope.artistList }" var="artist">
		<!-- 이미지 엑박 처리 필요 -->
		<img src="${artist.src }">
		<h3><a href="${pageContext.request.contextPath}/artist/${artist.aid }">${artist.aname }</a></h3>
		<hr>
	</c:forEach>
</body>
</html>