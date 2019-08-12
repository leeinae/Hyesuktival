<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

	$(document).ready(function(){
		getComments();
	});
	
	function btnClick() {
		if($("#content").val().trim()==="") {
			alert("댓글을 입력하세요");
			$("#content").focus();
		} else {
			alert("실행 OK");
			$.ajax({
				url: "${pageContext.request.contextPath}/festival/comments/${requestScope.festival.fid}",
				type : "POST",
				data : $("#comments").serialize(),
				success: function(data) {
					$("#content").val("");
					$("#writer").val("");
					alert("data 등록 완료~");
					getComments();
				},
				error: function(error) {
					console.log(error);
				}
			});
		}
	}
	
	function btnDelete() {
		alert("삭제버튼");
	}
	
	
	
	
	function getComments() {
		$.ajax({
			type: "get",
			url : "${pageContext.request.contextPath}/festival/comments/${requestScope.festival.fid}",
			success: function(data) {
				console.log(data);
				var output = "";
				for(var i in data) {
					output += "<tr>";
					output += "<td>"+data[i].writer +"</td>";
					output += "<td>"+data[i].content +"</td>";
					output += "<td>"+data[i].regDate +"</td>";
					output += "<td><button type='button' id='btnDelete' onclick='btnDelete()'">삭제</button></td>"
					output += "<td><button type='button' id='btnUpdate' onclick='btnUpdate()'">수정</button></td>"
					output += "<tr>";
				}
				$("#commentsList").html(output);
			}
		});
	}
</script>

<title>Insert title here</title>
</head>
<body>
	<h1>공연 상세 페이지</h1>
	<br>
	<img src="${requestScope.festival.src}" />
	<h2>${requestScope.festival.fname}</h2>
	<h2>${requestScope.festival.startDate}</h2>
	<h2>${requestScope.festival.endDate}</h2>
	<h2>${requestScope.festival.floc}</h2>

	<h1>---라인업----</h1>
	<!-- 이미지 엑박 처리 필요 -->
	<c:forEach items="${requestScope.artistList }" var="artist">
		<span> <a
			href="${pageContext.request.contextPath}/artist/${artist.aid }">
				<img src="${artist.src }" width="150" height="150">
		</a>
			<h5>${artist.aname }</h5>
		</span>
	</c:forEach>

	<hr>
	<h1>댓글</h1>
	<form id="comments">
		writer : <input type="text" placeholder="작성자" name="writer" id="writer"><br>
		content : <input type="text" placeholder="댓글을 입력하세요" name="content" id="content">
	</form>
	<input id="btn" type="button" onclick="btnClick()" value="등록">
	<br><hr>
	
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>작성자
					<th>댓글
					<th>작성일
				</tr>
			</thead>
			<tbody id="commentsList">
			</tbody>
		</table>
	</div>
</body>
</html>