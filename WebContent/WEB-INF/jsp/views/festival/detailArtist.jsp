<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
#video {
	width: 300px;
}

#renore {
	width: 100px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function urlValidation() {
		var youtubeUrl = document.getElementById("youtubeUrl").value;
		var youtubeUrlArray = String(youtubeUrl.split('/')[3]);
		youtubeUrlArray = String(youtubeUrlArray.split('=')[1]);
		var realUrl = '<iframe width="560" height="315" src="https://www.youtube.com/embed/'+youtubeUrlArray+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
		var reple = document.getElementById("reple").value;
		var check = 'www.youtube.com';
		if (youtubeUrl.indexOf(check) != -1) {
			alert('��ϵǾ����ϴ�!');
			var table = document.getElementById("zickcamUrl");
			var row = table.insertRow(table.rows.length);
			var cell1 = row.insertCell();
			var cell2 = row.insertCell();
			var cell3 = row.insertCell();
			var cell4 = row.insertCell();
			cell1.innerHTML = "<td>" + realUrl + "</td>"
			cell2.innerHTML = "<td>" + reple + "</td>"
			cell3.innerHTML = "<td><input type='button' value='��õ'></td>"
			cell4.innerHTML = "<td><input type='button' value='����õ'></td>"
			document.getElementById("youtubeUrl").value = "";
			document.getElementById("reple").value = "";
		} else {
			alert('�ùٸ� Youtube URL�� �Է��� �ּ���!');
			document.getElementById("youtubeUrl").val("").focus();
		}
	}
</script>
</head>
<body>
	<h1>�� ��Ƽ��Ʈ ������</h1>
	<br>
	<h1>${requestScope.artist.aname }</h1>
	<img alt="" src="${requestScope.artist.src }">

	<table border="1">
		<thead>
            <tr>
               <td colspan="2">�� ��</td>
               <td>�ٹ� ��</td>
               <td>��ǥ��</td>
            </tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.musicList }" var="music">
				<tr>
					<td><img alt="" src="${music.src }" width="200px"></td>
					<td>${music.mname }</td>
					<td>${music.album }</td>
					<td>${music.mCnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a>�α��� �Ͻø� ����� �� �� �ֽ��ϴ�.</a>
	<br>
	<form>
		<input type="text" id="youtubeUrl" placeholder="��Ʃ�� ��ũ�� �Է��ϼ���" /><br>
		<input type="text" id="reple" placeholder="����� �Է��ϼ���" /><br> <input
			type="button" onclick="urlValidation()" value="���" />
	</form>
	<br>
	<table border id="zickcamUrl" width=1500px>
		<tr>
			<td id="video">����</td>
			<td id="rep">���</td>
			<td colspan="2" id="renore">��õ/����õ</td>
		</tr>
	</table>

</body>
</html>