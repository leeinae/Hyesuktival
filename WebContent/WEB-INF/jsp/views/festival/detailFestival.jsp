<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>HYESUKTIVAL</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- Custom fonts for this theme -->
<link href="/resources/Detail/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Theme CSS -->
<link href="/resources/Detail/resources/css/freelancer.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="/resources/main/css/style.css" rel="stylesheet" type="text/css">
<script>
	$(document).ready(function() {
		getComments("1");
	});

	function deleteComment(no) {
		if (confirm("정말 삭제하시겠습니까?") == true) {
			$.ajax({
				url : "${pageContext.request.contextPath}/festival/comments/delete/"
						+ no,
				type : "post",
				success : function(data) {
					alert("삭제 완료!");
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
			alert("댓글을 입력하세요");
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
		var content = $('#comment' + no + '> #commentContent').text()
		var writer = $('#comment' + no + '> #commentWriter').text();
		var editForm = '';
		editForm += "<td>" + writer + "</td>";
		editForm += "<td><input type='text' placeholder='댓글을 입력하세요' value='"+content+"' name='content' id='content'></td>";
		editForm += "<td>" + date + "</td>";
		editForm += "<td><input id='btn' type='button' onclick='updateComment("
				+ no + ")' value='수정'>";
		editForm += "<input id='btn' type='button' onclick='getComments("
				+ replyPage + ")' value='취소'></td>";

		$('#comment' + no).html(editForm);
	}

	   function insertComment() {
		      var content = $("#content").val().trim();
		      var writer = $("#nickname").text().trim();
		      
		      if (content === "") {
		         alert("댓글을 입력하세요");
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

	var printPaging = function(pageMaker, target) {
		var str = "";
		if (pageMaker.curPage > 1) {
			str += str += "<li style='display: inline-block;margin: 10px;font-size: larger;'><a href='javascript:getComments(1)'> [이전] </a></li>";
		}

		for (var i = pageMaker.blockBegin; i <= pageMaker.blockEnd; i++) {
			var strClass = pageMaker.curPage == i ? 'class=active' : '';
			str += "<li "+"style='display: inline-block;margin: 10px;'"+strClass+"><a href='javascript:getComments(" + i
					+ ")'>" + i + "</a></li>";
		}

		if (pageMaker.curBlock < pageMaker.blockEnd) {
			str += "<li style='display: inline-block;margin: 10px;'><a href='javascript:getComments(" + pageMaker.blockEnd
					+ ")'> [다음] </a></li>";
		}
		target.html(str);
	}
	
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
					output += "<td style='text-align: center;' id='commentDate'>"
							+ data.list[i].regDate + "</td>";
					output += "<td>";
					if ("${sessionScope.sessionName}" == data.list[i].writer
							|| "${sessionScope.AuthInfoId }" == data.list[i].writer) {
						output += "<button class='btn btn-danger' id='btnDelete' onclick='deleteComment("
								+ data.list[i].no + ")'>삭제</button>";
						output += "<button class='btn btn-warning' id='btnUpdate' onclick='editComment("
								+ data.list[i].no
								+ ",\""
								+ data.list[i].content
								+ "\")'>수정</button>";
					}
					output += "</td>";
					output += "</tr>";
				}
				$("#commentsList").html(output);
			}
		});
	}

</script>
</head>
<body id="page-top">
	<!-- nav-start -->
	<nav class="main-nav-outer" id="test"style="font-family: Summer Festival;">
		<div class="container" style="margin-top: -10px;">
			<ul class="main-nav" >						
				<li class="small-logo"><a href="/"><h2 style="font-family: Summer Festival;
				color:white;"><strong>HYESUKTIVAL</strong></h2></a></li>
				
				<li><a href="#service" class="container-1" style="width: 300px;vertical-align: middle;white-space: nowrap; position: relative;">				
				<span class="icon"style="position: absolute;margin-left: -26%;margin-top: 4%;z-index: 1;color: #4f5b66;"><i class="fa fa-search"></i></span>				 	
				<form action="/search" method="get" >
				<input type="text" name="search" placeholder="Search..." 
					  style=" width: 190px;  height: 40px; margin-left: 55px; border: none;
					  font-size: 10pt;
					  float: left;
					  padding-left: 45px;
					  -webkit-border-radius: 5px;
					  -moz-border-radius: 5px;
					  border-radius: 5px;
					  opacity: 0.6;
					  -webkit-transition: background .55s ease;
					  -moz-transition: background .55s ease;
					  -ms-transition: background .55s ease;
					  -o-transition: background .55s ease;
					  transition: background .55s ease;	"/>		
					  		
				</form>	
				</a></li>							
				<c:catch>
					<c:choose>
						<c:when test="${sessionId != null}">
							<li style="font-family:lottemartdream;">${sessionName}님 반갑습니다</li>
							<li style="font-family:lottemartdream;"><a href="/myPage"><i class="mypage"></i> 마이페이지</a></li>
							<li style="font-family:lottemartdream;"><a href="/logout"><i class="logout"></i> 로그아웃</a></li>							
						</c:when>
						<c:when test="${empty AuthInfoId && empty sessionId}">
							<li><a href="/signup" style="font-size: 24px;font-family: Summer Festival;" >Sign Up</a></li>
							<li><a href="/login" style="font-size: 24px;font-family: Summer Festival;">Login</a></li>
						</c:when>
						
						<c:otherwise>
							<li style="font-family:lottemartdream;">${AuthInfoNickname }님,반갑습니다!</li>							
							<li><a href="/myPage" style="font-family:lottemartdream;"><i class="mypage"></i> 마이페이지</a></li>
							<li style="margin-right: -60px;"><a href="/logout" style="font-family:lottemartdream;"><i class="logout"></i> 로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</c:catch>
			</ul>
			<a class="res-nav_click" href="#"><i class="fa fa-bars"></i></a>
		</div>
	</nav>
 	<!-- nav end -->
  
	<!-- slide-info -->
	<header class="masthead bg-primary text-white text-center">
	
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	    <ol class="carousel-indicators">
	      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	    </ol>
	    <div class="carousel-inner" role="listbox"  style=" font-family: 'S-CoreDream-8Heavy', sans-serif;">
	      <!-- Slide One - Set the background image for this slide in the line below -->
					<div class="container" style="background-color: dark; z-index:10000;"></div>
					<div class="carousel-item active"
						style="background-image: url('/resources/Detail/img/music.jpg');">	
					<div class="carousel-caption d-none d-md-block" style="top: 5em;">
						<img src="${requestScope.festival.src}" style="width:200px;height: 250px;"/>
						<h2 class="display-4" style="color:white;margin-top: 1em;">${requestScope.festival.fname}</h2>
					</div>
		</div>
					
		<!-- Slide Two - Set the background image for this slide in the line below -->
	      <div class="carousel-item" style="background-image: url('/resources/Detail/img/aud.jpg')">
	        <div class="carousel-caption d-none d-md-block">          
	          <h2 class="display-4" style="color:black;font-size: 4rem;"><strong>공연기간</strong></h2><br>	
	          <p class="lead" style="color:black;">${requestScope.festival.startDate}&nbsp;~&nbsp;${requestScope.festival.endDate}</p>
	        </div>
	      </div>
	      
	      <!-- Slide Three - Set the background image for this slide in the line below -->
	      <div class="carousel-item" style="background-image: url('/resources/Detail/img/ff2.jpg')">
	        <div class="carousel-caption d-none d-md-block">
	          <h2 class="display-4"style="color:white;font-size: 4rem;">공연장</h2><br>
	          <p class="lead">${requestScope.festival.floc}</p>
	        </div>
	      </div>
	    </div>
	    
	    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	          <span class="sr-only">Previous</span>
	        </a>
	    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	          <span class="carousel-control-next-icon" aria-hidden="true"></span>
	          <span class="sr-only">Next</span>
	        </a>
	  </div>
				
	</header>
	<!-- slide-info end-->

	<!-- lineup Section -->
	<section class="page-section portfolio" id="portfolio" style="background:black;">
		<div class="container">

			<!-- Portfolio Section Heading -->
			<h2
				class="page-section-heading text-center text-uppercase mb-0"style="font-family: 'S-CoreDream-8Heavy', sans-serif;color:white;">라인업</h2>

			<!-- Icon Divider -->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				
			</div>
			
			
			<!-- Portfolio Grid Items -->
			<div class="row">				
			
			<c:forEach items="${requestScope.artistList }" var="artist">
				<div class="col-md-6 col-lg-3">		
		      	<div class="portfolio-item mx-auto" data-toggle="modal"
						data-target="#portfolioModal3">
		         <c:choose>
		            <c:when test="${artist.src == 'https://cdnticket.melon.co.kr/melon/thumbnail/320x300'}">
		               <a href="${pageContext.request.contextPath}/artist/${artist.aid }">
		                  <img class="img-fluid"src="/resources/Detail/img/mic11.png" width="190" height="190">
		               </a>   
		            </c:when>
		            <c:otherwise>
		               <a href="${pageContext.request.contextPath}/artist/${artist.aid }">
		                  <img class="img-fluid"src="${artist.src }" width="190" height="190">
		               </a>            
		            </c:otherwise>
		         </c:choose>
		         <h5 style="text-align: center;padding-top: .5em;color:white;font-family: 'S-CoreDream-8Heavy', sans-serif;">${artist.aname }</h5>
		      </div>
		      </div>
		   </c:forEach>
					
			
			
			</div>		
		</div>
	</section>
	<!-- lineup Section end-->
	
	<!-- Contact Section -->
	<section class="page-section mb-0" id="contact" style="margin-top: 2em;background: gainsboro;">
			<div class="container">
	
				<!-- Contact Section Heading -->
				<h2	class="page-section-heading text-center text-uppercase mb-0 f11"
					style="font-family: 'S-CoreDream-8Heavy', sans-serif;">공연 후기</h2>
					<div class="divider-custom">
					<div class="divider-custom-line"></div>
					
					</div>
				<br>	
		
					<!-- review table -->
					
					<!-- 댓글등록 시작 -->
					
					<c:choose>
						
						<c:when test="${empty AuthInfoId && empty sessionId }">
							<!-- <h6>로그인 후 댓글을 남길 수 있습니다.</h6> -->
							<textarea class="form-control" rows="3" cols="30" 
						                style="width: 100%; resize:none;"
						                  name="content" placeholder="로그인 후 댓글을 남길 수 있습니다."></textarea>	
							<a href="${pageContext.request.contextPath }/login">
							<button class="btn btn-success">로그인</button></a>
						</c:when>
						
						
						<c:when test="${sessionId != null}">						
							
								<form id="comments">
						            <h6>ID:<span id="nickname">${sessionName }</span></h6>
						            <div>
						                <textarea class="form-control" rows="3" cols="30" 
						                style="width: 100%; resize:none;"
						                 id="content" name="content" placeholder="댓글을 입력하세요"></textarea>			                           							           			            							            			        						              
							    	</div>
							    </form>
		                        <input id="btn" type="button" onclick="insertComment()" style="float: right;"
		                        class="btn pull-right btn-success" value="등록" >		                         
						</c:when>
						
						<c:otherwise>
							
							<form id="comments"> 							        			          
							            <h6>ID:<span id="nickname">${AuthInfoId  }</span></h6>		          							          
							            <div>
							                <textarea class="form-control"  rows="3" cols="30" 
							                id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
							            </div>		        
							    </form>
				                <input id="btn" type="button" onclick="insertComment()"  style="float: right;"
				                class="btn pull-right btn-success" value="등록">
				                        
						</c:otherwise>	
					</c:choose>	
				<!-- 댓글등록 끝 -->					
					<br> 
					<br>
					<br>
					
				<!-- 댓글리스트 -->
					<hr>
					<div>
						<table border="1" class="table table-bordered table-hover" style="table-layout: fixed;font-family: lottemartdream;">
							<thead style="text-align: center;">
								<tr>
									<th style="width: 30;width: 120px;">작성자
									<th>댓글
									<th style="text-align: center; width: 150px;">작성일
									<th style="width: 150px;">
								</tr>
							</thead>
							<tbody id="commentsList">
							</tbody>
						</table>
						<div id="paging" align="center">
							<ul id="pagination" style="list-style:none;">
				
							</ul>
						</div>
					</div>
					
					
			</div>
	</section>
	
	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<h2 style="font-family: Summer Festival;color:white;">HYESUKTIVAL</h2>
			<span class="copyright">&copy; Knight Theme. All Rights Reserved</span>
			<div class="credits">
			
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-to-top d-lg-none position-fixed ">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"> <i class="fa fa-chevron-up"></i>
		</a>
	</div>

	
	<!-- Bootstrap core JavaScript -->
	<script src="/resources/Detail/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/Detail/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="/resources/Detail/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="/resources/Detail/resources/js/jqBootstrapValidation.js"></script>
	<script src="/resources/Detail/resources/js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="/resources/Detail/resources/js/freelancer.min.js"></script>
	
</body>
</html>