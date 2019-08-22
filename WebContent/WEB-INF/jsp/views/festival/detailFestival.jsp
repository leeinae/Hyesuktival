<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		getComments("1");
	});

	function deleteComment(no) {
		if (confirm("���� �����Ͻðڽ��ϱ�?") == true) {
			$.ajax({
				url : "${pageContext.request.contextPath}/festival/comments/delete/"
						+ no,
				type : "post",
				success : function(data) {
					alert("���� �Ϸ�!");
					getComments(replyPage);
				}
			});
		} else {
			return;
		}
	}

	function updateComment(no) {
		var content = $('#comment' + no + ' #content').val().trim();
		if (content === "") {
			alert("����� �Է��ϼ���");
			$('#comment' + no + ' #content').focus();
		} else {
			$.ajax({
				url : "${pageContext.request.contextPath}/festival/comments/update/"
						+ no,
				type : "post",
				data : {
					'content' : content,
					'no' : no
				},
				success : function(data) {
					getComments(replyPage);
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:"
							+ error);
				}
			});
		}
	}

	function editComment(no, content) {
		var date = $('#comment' + no + '> #commentDate').text();
		var content = $('#comment' + no + '> #commentContent').text();
		var writer = $('#comment' + no + '> #commentWriter').text();
		var editForm = '';
		editForm += "<td>" + writer + "</td>";
		editForm += "<td><input type='text' placeholder='����� �Է��ϼ���' value='"+content+"' name='content' id='content'></td>";
		editForm += "<td>" + date + "</td>";
		editForm += "<td><input id='btn' type='button' onclick='updateComment("
				+ no + ")' value='����'>";
		editForm += "<input id='btn' type='button' onclick='getComments("
				+ replyPage + ")' value='���'></td>";

		$('#comment' + no).html(editForm);
	}

	function insertComment() {
		var content = $("#content").val().trim();
		var writer = $("#id").text().trim();
		if (content === "") {
			alert("����� �Է��ϼ���");
			$("#content").focus();
		} else {
			$.ajax({
				url : "${pageContext.request.contextPath}/festival/comments/${requestScope.festival.fid}",
				type : "POST",
				data : {
					"content" : content,
					"writer" : writer
				},
				success : function(data) {
					$("#content").val("");
					getComments("1");
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	}

	var replyPage = 1;

	function getComments(pageInfo) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/festival/comments/${requestScope.festival.fid}/"
					+ pageInfo,
			success : function(data) {
				printPaging(data.paging, $("#pagination"));
				console.log(data);
				replyPage = pageInfo;
				var output = "";
				for ( var i in data.list) {
					output += "<tr id='comment"+data.list[i].no+"'>";
					output += "<td id='commentWriter'>"
							+ data.list[i].writer + "</td>";
					output += "<td id='commentContent'>"
							+ data.list[i].content + "</td>";
					output += "<td id='commentDate'>"
							+ data.list[i].regDate + "</td>";
					output += "<td>";
					if ("${sessionScope.sessionName}" == data.list[i].writer
							|| "${sessionScope.AuthInfoId}" == data.list[i].writer) {
						output += "<button type='button' id='btnDelete' onclick='deleteComment("
								+ data.list[i].no + ")'>����</button>";
						output += "<button type='button' id='btnUpdate' onclick='editComment("
								+ data.list[i].no
								+ ",\""
								+ data.list[i].content
								+ "\")'>����</button>";
					}
					output += "</td>";
					output += "</tr>";
				}
				$("#commentsList").html(output);
			}
		});
	}

	var printPaging = function(pageMaker, target) {
		var str = "";
		if (pageMaker.curPage > 1) {
			str += str += "<li><a href='javascript:getComments(1)'> [����] </a></li>";
		}

		for (var i = pageMaker.blockBegin; i <= pageMaker.blockEnd; i++) {
			var strClass = pageMaker.curPage == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='javascript:getComments(" + i
					+ ")'>" + i + "</a></li>";
		}

		if (pageMaker.curBlock < pageMaker.blockEnd) {
			str += "<li><a href='javascript:getComments(" + pageMaker.blockEnd
					+ ")'> [����] </a></li>";
		}
		target.html(str);
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
	<c:forEach items="${requestScope.artistList }" var="artist">
		<span>
      		<a href="${pageContext.request.contextPath}/artist/${artist.aid }">
        		<c:choose>
					<c:when test="${artist.src == 'https://cdnticket.melon.co.kr/melon/thumbnail/320x300'}">
						<img src="/resources/Detail/img/user.png" width="150" height="150">				
					</c:when>
			    	<c:otherwise>
			        	<img src="${artist.src }" width="150" height="150">          
			        </c:otherwise>
	         	</c:choose>
			</a>
			<h5>${artist.aname }</h5>
      </span>
   </c:forEach>

	<hr>
	<c:choose>
		<c:when test="${empty AuthInfoId && empty sessionId }">
			<h1>�α��� �ϼ��� ~</h1>
			<a href="${pageContext.request.contextPath }/login"><button>�α���</button></a>
		</c:when>
		<c:when test="${sessionId != null}">
			<h1>���</h1>
			<form id="comments">
					<h3 id="id">${sessionName }</h3>
					<br> content : <input type="text"
					placeholder="����� �Է��ϼ���" name="content" id="content" />
			</form>
			<input id="btn" type="button" onclick="insertComment()" value="���">
		</c:when>
		<c:otherwise>
			<h1>���</h1>
			<form id="comments">
					<h3 id="id">${AuthInfoId }</h3>
					<br> content : <input
					type="text" placeholder="����� �Է��ϼ���" name="content" id="content" />
			</form>
			<input id="btn" type="button" onclick="insertComment()" value="���">
		</c:otherwise>
	</c:choose>
	<br>
	<hr>

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
		<div id="paging">
			<ul id="pagination">

			</ul>
		</div>
	</div>

</body>
</html>