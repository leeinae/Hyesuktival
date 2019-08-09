<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset='utf-8' />
<link href='/resources/fullcalendar/packages/core/main.css'
	rel='stylesheet' />
<link href='/resources/fullcalendar/packages/daygrid/main.css'
	rel='stylesheet' />
<script src='/resources/fullcalendar/packages/core/main.js'></script>
<script src='/resources/fullcalendar/packages/interaction/main.js'></script>
<script src='/resources/fullcalendar/packages/daygrid/main.js'></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var form = {
    		title : "title",
    		start : "2010-01-01",
    		end : "2011-01-01"
    }
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [${requestScope.festivalList}]
    });
    calendar.render();
  });
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>Calendar Page</h1>
	<div id="topMenu" align="right">
		<c:catch>
			<c:choose>
				<c:when
					test="${empty AuthInfo && empty naverSessionId && empty googleSessionId}">
					<li><a href="/login"><i class="login"></i>로그인</a></li>
					<li><a href="/signup"><i class="signup"></i>회원가입</a></li>
				</c:when>
				<c:when test="${naverSessionId != null}">
					<li>${naverSessionId}님,반갑습니다!</li>
					<li><a href="/logout"><i class="logout"></i> 로그아웃</a></li>
				</c:when>
				<c:when test="${googleSessionId != null}">
					<li>${googleSessionId}님,반갑습니다!</li>
					<li><a href="/logout"><i class="logout"></i> 로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li>${AuthInfo.nickname }님,반갑습니다!</li>
					<li><a href="/logout"><i class="logout"></i> 로그아웃</a></li>
				</c:otherwise>
			</c:choose>
		</c:catch>
	</div>
	<br>
	<form action="/search" method="get">
		<input type="text" name="search">
		<button type="submit">검색!</button>
	</form>

	<div id="calendar"></div>
</body>
</html>