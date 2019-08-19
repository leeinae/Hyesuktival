<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<<<<<<< HEAD
=======
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<script>
	function vote(mid) {
		var text = $('#voteBtn'+mid).val();
		if(text == "¡Ù"){
			$('#voteBtn'+mid).val("¡Ú");
			$.ajax({
				url: "${pageContext.request.contextPath}/artist/${artist.aid}/"+mid+"/up",
				type : "POST",
				success : function(data) {
					$('#mCnt'+mid).html(data);
				},
				error : function(){
					alert('½ÇÆÐ');
				}
			});
		}
		else if(text == "¡Ú"){
			$('#voteBtn'+mid).val("¡Ù");
			$.ajax({
				url: "${pageContext.request.contextPath}/artist/${artist.aid}/"+mid+"/down",
				type : "POST",
				success : function(data) {
					$('#mCnt'+mid).html(data);
				},
				error : function(){
					alert('½ÇÆÐ');
				}
			});
		}
	}
</script>
<script>
	function urlValidation() {
		var youtubeUrl = document.getElementById("youtubeUrl").value;
		var youtubeUrlArray = String(youtubeUrl.split('/')[3]);
		youtubeUrlArray = String(youtubeUrlArray.split('=')[1]);
		var realUrl = '<iframe width="560" height="315" src="https://www.youtube.com/embed/'+youtubeUrlArray+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
		var reple = document.getElementById("reple").value;
		var check = 'www.youtube.com';
		if (youtubeUrl.indexOf(check) != -1) {
			alert('µî·ÏµÇ¾ú½À´Ï´Ù!');
			var table = document.getElementById("zickcamUrl");
			var row = table.insertRow(table.rows.length);
			var cell1 = row.insertCell();
			var cell2 = row.insertCell();
			var cell3 = row.insertCell();
			var cell4 = row.insertCell();
			cell1.innerHTML = "<td>" + realUrl + "</td>"
			cell2.innerHTML = "<td>" + reple + "</td>"
			cell3.innerHTML = "<td><input type='button' value='ÃßÃµ'></td>"
			cell4.innerHTML = "<td><input type='button' value='ºñÃßÃµ'></td>"
			document.getElementById("youtubeUrl").value = "";
			document.getElementById("reple").value = "";
		} else {
			alert('¿Ã¹Ù¸¥ Youtube URLÀ» ÀÔ·ÂÇØ ÁÖ¼¼¿ä!');
			document.getElementById("youtubeUrl").focus();
		}
	}
</script>
>>>>>>> origin/Vote
<style>
#video {
	width: 300px;
}

#renore {
	width: 100px;
}
</style>
<<<<<<< HEAD
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
			alert('ï¿½ï¿½ÏµÇ¾ï¿½ï¿½ï¿½ï¿½Ï´ï¿½!');
			var table = document.getElementById("zickcamUrl");
			var row = table.insertRow(table.rows.length);
			var cell1 = row.insertCell();
			var cell2 = row.insertCell();
			var cell3 = row.insertCell();
			var cell4 = row.insertCell();
			cell1.innerHTML = "<td>" + realUrl + "</td>"
			cell2.innerHTML = "<td>" + reple + "</td>"
			cell3.innerHTML = "<td><input type='button' value='ï¿½ï¿½Ãµ'></td>"
			cell4.innerHTML = "<td><input type='button' value='ï¿½ï¿½ï¿½ï¿½Ãµ'></td>"
			document.getElementById("youtubeUrl").value = "";
			document.getElementById("reple").value = "";
		} else {
			alert('ï¿½Ã¹Ù¸ï¿½ Youtube URLï¿½ï¿½ ï¿½Ô·ï¿½ï¿½ï¿½ ï¿½Ö¼ï¿½ï¿½ï¿½!');
			document.getElementById("youtubeUrl").val("").focus();
		}
	}
</script>
=======
>>>>>>> origin/Vote
</head>
<body>
	<h1>ï¿½ï¿½ ï¿½ï¿½Æ¼ï¿½ï¿½Æ® ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½</h1>
	<br>
	<h1>${requestScope.artist.aname }</h1>
	<img alt="" src="${requestScope.artist.src }">

	<table border="1">
		<thead>
<<<<<<< HEAD
            <tr>
               <td colspan="2">ï¿½ï¿½ ï¿½ï¿½</td>
               <td>ï¿½Ù¹ï¿½ ï¿½ï¿½</td>
               <td>ï¿½ï¿½Ç¥ï¿½ï¿½</td>
            </tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.musicList }" var="music">
				<tr>
					<td><img alt="" src="${music.src }" width="200px"></td>
					<td>${music.mname }</td>
					<td>${music.album }</td>
					<td>${music.mCnt }</td>
=======
			<tr>
				<td>mid</td>
				<td colspan="2">°î ¸í</td>
				<td>¾Ù¹ü ¸í</td>
				<td>ÅõÇ¥¼ö</td>
				<td>ÅõÇ¥</td>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${requestScope.musicList }" var="music">
				<tr>
					<td id="mid">${music.mid }</td>
					<td><img alt="" src="${music.src }" width="200px"></td>
					<td>${music.mname }</td>
					<td>${music.album }</td>
					<td id="mCnt${music.mid}">${music.mCnt }</td>
					<td><input type="button" id="voteBtn${music.mid}"
						onclick="vote(${music.mid})" value="¡Ù" /></td>
>>>>>>> origin/Vote
				</tr>
			</c:forEach>
		</tbody>
	</table>
<<<<<<< HEAD
	<a>ï¿½Î±ï¿½ï¿½ï¿½ ï¿½Ï½Ã¸ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ ï¿½ï¿½ ï¿½Ö½ï¿½ï¿½Ï´ï¿½.</a>
	<br>
	<form>
		<input type="text" id="youtubeUrl" placeholder="ï¿½ï¿½Æ©ï¿½ï¿½ ï¿½ï¿½Å©ï¿½ï¿½ ï¿½Ô·ï¿½ï¿½Ï¼ï¿½ï¿½ï¿½" /><br>
		<input type="text" id="reple" placeholder="ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ô·ï¿½ï¿½Ï¼ï¿½ï¿½ï¿½" /><br> <input
			type="button" onclick="urlValidation()" value="ï¿½ï¿½ï¿½" />
=======
	<a>·Î±×ÀÎ ÇÏ½Ã¸é ´ñ±ÛÀ» ¾µ ¼ö ÀÖ½À´Ï´Ù.</a>
	<br>
	<form>
		<input type="text" id="youtubeUrl" placeholder="À¯Æ©ºê ¸µÅ©¸¦ ÀÔ·ÂÇÏ¼¼¿ä" /><br>
		<input type="text" id="reple" placeholder="´ñ±ÛÀ» ÀÔ·ÂÇÏ¼¼¿ä" /> <br> <input
			type="button" onclick="urlValidation()" value="µî·Ï" />
>>>>>>> origin/Vote
	</form>
	<br>
	<table border id="zickcamUrl" width=1500px>
		<tr>
<<<<<<< HEAD
			<td id="video">ï¿½ï¿½ï¿½ï¿½</td>
			<td id="rep">ï¿½ï¿½ï¿½</td>
			<td colspan="2" id="renore">ï¿½ï¿½Ãµ/ï¿½ï¿½ï¿½ï¿½Ãµ</td>
		</tr>
	</table>

=======
			<td id="video">¿µ»ó</td>
			<td id="rep">´ñ±Û</td>
			<td colspan="2" id="renore">ÃßÃµ/ºñÃßÃµ</td>
		</tr>
	</table>
>>>>>>> origin/Vote
</body>
</html>