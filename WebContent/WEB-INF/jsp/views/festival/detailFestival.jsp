<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script>
function insertDB() {
	alert("클릭됨")
}

</script>
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
		<span>
			<a href="${pageContext.request.contextPath}/artist/${artist.aid }">
				<img src="${artist.src }" width="150" height="150">		
			</a>			
			<h5>${artist.aname }</h5>
		</span>
	</c:forEach>
	
	<hr>
	<h1>댓글</h1>
	<form>
		<textarea rows="3" placeholder="댓글을 입력하세요"></textarea>
		<button type="submit" id="submit" onclick="insertDB()">등록</button>
	</form>
	
	<table>
		<thead>
			<th>작성자</th>
			<th>내용</th>
			<th>작성시간</th>
		</thead>
		<tbody>
			<tr>
				<td>d</td>
				<td>d</td>
				<td>d</td>
			</tr>
		</tbody>
	</table>
</body>
</html>