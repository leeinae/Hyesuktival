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
	<h1>�� ��Ƽ��Ʈ ������</h1>
	<br>
	<h1>${requestScope.artist.aname }</h1>
	<img alt="" src="${requestScope.artist.src }">

		<table border="1">
			<thead>
				<tr>
					<td>�� ��</td>
					<td>�ٹ� ��</td>
					<td>��ǥ��</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.musicList }" var="music">
					<tr>
						<td>${music.mname }</td>
						<td>�ӽ÷�.. </td>
						<td>${music.mCnt }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

</body>
</html>