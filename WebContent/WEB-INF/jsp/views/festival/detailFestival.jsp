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
	
	function deleteComment(no) {
		if(confirm("���� �����Ͻðڽ��ϱ�?")==true) {
	 		$.ajax({
				url : "${pageContext.request.contextPath}/festival/comments/delete/" +no,
				type : "post",
				success : function(data) {
					alert("���� �Ϸ�!");
					getComments();
				}
			});			
		} else {
			return;
		}
	}
	
	function updateComment(no) {
 		var content = $('#comment'+no+' #content').val().trim();
 		if (content ==="") {
			alert("����� �Է��ϼ���");
			$('#comment'+no+' #content').focus();
 		} else {
			$.ajax({
				url : "${pageContext.request.contextPath}/festival/comments/update/"+no,
				type: "post",
				data : {
					'content' : content,
					'no' : no
				},
				success : function(data) {
					getComments();
				},
			    error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
			});	
 		}
	}
	
	function editComment(no, content){
 		var date = $('#comment'+no+ '> #commentDate').text();
 		var writer = $('#comment'+no+ '> #commentWriter').text();
	    var editForm ='';
	    editForm += "<td>"+writer+"</td>";
	    editForm += "<td><input type='text' placeholder='����� �Է��ϼ���' name='content' id='content'></td>";
	    editForm += "<td>"+date+"</td>";	    
	    editForm += "<td><input id='btn' type='button' onclick='updateComment("+no+")' value='����'>";
	    editForm += "<input id='btn' type='button' onclick='getComments()' value='���'></td>";
	    
	    $('#comment'+no).html(editForm);
	}
	
	function insertComment() {
		var content = $("#content").val().trim();
		if(content ==="") {
			alert("����� �Է��ϼ���");
			$("#content").focus();
		} else {
			$.ajax({
				url: "${pageContext.request.contextPath}/festival/comments/${requestScope.festival.fid}",
				type : "POST",
				data : $("#comments").serialize(),
				success: function(data) {
					$("#content").val("");
					$("#writer").val("");
					getComments();
				},
				error: function(error) {
					console.log(error);
				}
			});
		}
	}
	
	function getComments() {
		$.ajax({
			type: "get",
			url : "${pageContext.request.contextPath}/festival/comments/${requestScope.festival.fid}",
			success: function(data) {
				var output = "";
				for(var i in data) {
					output += "<tr id='comment"+data[i].no+"'>";
					output += "<td id='commentWriter'>"+data[i].writer +"</td>";
					output += "<td id='commentContent'>"+data[i].content +"</td>";
					output += "<td id='commentDate'>"+data[i].regDate +"</td>";
					output += "<td>";
					output += "<button type='button' id='btnDelete' onclick='deleteComment("+data[i].no+")'>����</button>";
					output += "<button type='button' id='btnUpdate' onclick='editComment("+data[i].no+",\""+data[i].content+"\")'>����</button>";
					output += "</td>";
					output += "</tr>";
				}
				$("#commentsList").html(output);
			}
		});

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
	<input id="btn" type="button" onclick="insertComment()" value="���">
	<br><hr>
	
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>�ۼ���
					<th>���
					<th>�ۼ���
					<th>��ư?
				</tr>
			</thead>
			<tbody id="commentsList">
			</tbody>
		</table>
	</div>
</body>
</html>