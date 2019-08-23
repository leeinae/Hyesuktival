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
	<c:forEach items="${requestScope.searchArtistList }" var="result2">
		<table>
			<tr>
				<td>
					<img alt="" src="${result2.src }" width="200px">
				</td>
				<td rowspan="2">
					<c:forEach items="${ resultMap }" var="map">
					<c:if test="${ map.key == result2.aid }">
						<c:forEach items="${ map.value }" var="mapvalue">
						<h5><a href="${pageContext.request.contextPath }/festival/${mapvalue.fid}">${ mapvalue.fname }</a><br></h5>
						</c:forEach>
					</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>
					<h5><a>${result2.aname }</a></h5>
				</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>