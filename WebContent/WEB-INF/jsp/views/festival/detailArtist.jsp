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
	<h1>상세 아티스트 페이지</h1>
	<br>
	<h1>${requestScope.artist.aname }</h1>
	<img alt="" src="${requestScope.artist.src }">

		<table border="1">
			<thead>
				<tr>
					<td>곡 명</td>
					<td>앨범 명</td>
					<td>투표수</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.musicList }" var="music">
					<tr>
						<td>${music.mname }</td>
						<td>임시로.. </td>
						<td>${music.mCnt }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

</body>
</html>