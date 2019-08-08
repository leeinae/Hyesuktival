<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script>
function insertDB() {
	alert("Ŭ����")
}

</script>
<title>Insert title here</title>
</head>
<body>
	<h1>���� �� ������</h1>
	<br>
	<img src="${requestScope.festival.src}"/>
	<h2>${requestScope.festival.fname}</h2>
	<h2>${requestScope.festival.startDate}</h2>
	<h2>${requestScope.festival.endDate}</h2>
	<h2>${requestScope.festival.floc}</h2>
	
	<h1>---���ξ�----</h1>
	<c:forEach items="${requestScope.artistList }" var="artist">
		<!-- �̹��� ���� ó�� �ʿ� -->
		<span>
			<a href="${pageContext.request.contextPath}/artist/${artist.aid }">
				<img src="${artist.src }" width="150" height="150">		
			</a>			
			<h5>${artist.aname }</h5>
		</span>
	</c:forEach>
	
	<hr>
	<h1>���</h1>
	<form>
		<textarea rows="3" placeholder="����� �Է��ϼ���"></textarea>
		<button type="submit" id="submit" onclick="insertDB()">���</button>
	</form>
	
	<table>
		<thead>
			<th>�ۼ���</th>
			<th>����</th>
			<th>�ۼ��ð�</th>
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