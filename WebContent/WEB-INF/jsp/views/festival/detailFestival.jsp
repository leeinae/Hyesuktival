<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- <script src="/resources/js/jquery-3.4.1.min.js"></script> -->
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	
 	function getComments() {
		var param = {
				content : "${list.content}",
				writer : "${list.writer}"
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/festival/${requestScope.festival.fid}",
			type:"POST",
			data : param,
			dataType :"json",
			success : function(data) {
				console.log("��� ����");
				var htmls ="";
				if (data.length < 1) {
					html.push("��ϵ� ��� x");
				} else {
					$(data).each(function(){
						htmls+="<h2>" +this.content+"</h2>"
					})
					$("#commentsList").html(htmls);
				}
			}
		});
	} 

	function btnClick() {
		if($("#content").val().trim()==="") {
			alert("����� �Է��ϼ���");
			$("#content").val("").focus();
		} else {
			alert("���� OK");
			$.ajax({
				url: "${pageContext.request.contextPath}/festival/${requestScope.festival.fid}",
				type : "POST",
				data : $("#comments").serialize(),
				success: function(data) {
					$("#content").text("");
					console.log("data ��� �Ϸ�~");
					getComments();
				}
			});
		}
	}
</script>

<title>Insert title here</title>
</head>
<body>
	<h1>���� �� ������</h1>
	<br>
	<img src="${requestScope.festival.src}" />
	<h2>${requestScope.festival.fname}</h2>
	<h2>${requestScope.festival.startDate}</h2>
	<h2>${requestScope.festival.endDate}</h2>
	<h2>${requestScope.festival.floc}</h2>

	<h1>---���ξ�----</h1>
	<!-- �̹��� ���� ó�� �ʿ� -->
	<c:forEach items="${requestScope.artistList }" var="artist">
		<span> <a
			href="${pageContext.request.contextPath}/artist/${artist.aid }">
				<img src="${artist.src }" width="150" height="150">
		</a>
			<h5>${artist.aname }</h5>
		</span>
	</c:forEach>

	<hr>
	<h1>���</h1>
	<form id="comments">
		writer : <input type="text" placeholder="�ۼ���" name="writer" id="writer"><br>
		content : <input type="text" placeholder="����� �Է��ϼ���" name="content" id="content">
	</form>
	<input id="btn" type="button" onclick="btnClick()" value="���">
	<br>
	<div id="commentsList">
		
	</div>
	
	

</body>
</html>