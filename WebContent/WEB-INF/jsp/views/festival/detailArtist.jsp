<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
<meta content="" name="description">
<meta content="" name="author">

<title>Freelancer - Start Bootstrap Theme</title>

<!-- Custom fonts for this theme -->
<link href="/resources/Detail/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> 
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
      type="text/css">

<!-- Theme CSS -->
<link href="/resources/Detail/css/artist.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="/resources/main/css/style.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	type="text/javascript"></script>
<script>
function vote(mid) {
	if("${AuthInfoId }" == "" && "${sessionName }" == "") {
		alert("로그인 후 투표하세요!");
	} else {
		$.ajax({
			url : "${pageContext.request.contextPath}/artist/${artist.aid}/"
					+ mid + "/up",
			type : "POST",
			success : function(data) {
				$('#mCnt' + mid).html(data);
				$('#voteBtn' + mid).val("투표 완료");
				$('#voteBtn' + mid).attr("disabled","disabled");
			},
			error : function() {
				alert('실패');
			}
		});
	}
}

function recom(no){
	if("${AuthInfoId }" == "" && "${sessionName }" == "") {
		alert("로그인 후 추천하세요!");
	} else {
		$.ajax({
			url : "${pageContext.request.contextPath}/artist/${artist.aid}/"
					+ no + "/yup",
			type : "POST",
			success : function(data) {
				getComments(replyPage);
			},
			error : function(request,status , error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
}
</script>
<script>
	
	$(document).ready(function(){
	    getComments("1");
	 });
	 
	 function deleteComment(no) {
	    if(confirm("정말 삭제하시겠습니까?")==true) {
	        $.ajax({
	          url : "${pageContext.request.contextPath}/artist/comments/delete/" +no,
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
	     var content = $('#comment'+no+' #content').val().trim();
	     if (content ==="") {
	       alert("댓글을 입력하세요");
	       $('#comment'+no+' #content').focus();
	     } else {
	       $.ajax({
	          url : "${pageContext.request.contextPath}/artist/comments/update/"+no,
	          type: "post",
	          data : {
	             'content' : content,
	             'no' : no
	          },
	          success : function(data) {
	             getComments(replyPage);
	          },
	           error:function(request,status,error){
	               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	       });   
	     }
	 }
	 
	 function editComment(no, content){
	     var date = $('#comment'+no+ '> #commentDate').text();
	     var content = $('#comment' + no + '> #commentContent').text()
	     var writer = $('#comment'+no+ '> #commentWriter').text();
	     var editForm ='';
	     editForm += "<td>"+writer+"</td>";
	     editForm += "<td>"+url+"</td>";
	     editForm += "<td><input type='text' placeholder='댓글을 입력하세요' value='"+content+"' name='content' id='content'></td>";
	     editForm += "<td>"+date+"</td>";       
	     editForm += "<td><input id='btn' type='button' onclick='updateComment("+no+")' value='수정'>";
	     editForm += "<input id='btn' type='button' onclick='getComments("
				+ replyPage + ")' value='취소'></td>";
	     
	     $('#comment'+no).html(editForm);
	 }
	 
	 function insertComment() {
		    var content = $("#content").val().trim();
		    var url = $("#url").val();
			var writer = $("#id").text().trim();
		    var check = 'www.youtube.com';
		    
		    if(content ==="") {
		       alert("댓글을 입력하세요");
		       $("#content").focus();
		    } else if(url.indexOf(check) < 0){
		  	  alert("올바른 youtube Url을 입력해주세요!")
		  	  $("#url").focus();
		    } else {
		       $.ajax({
		          url: "${pageContext.request.contextPath}/artist/comments/${requestScope.artist.aid}",
		          type : "POST",
		          data : {
						"content" : content,
						"writer" : writer,
						"url" : url
		          },
		          success: function(data) {
		             $("#url").val("");
		             $("#content").val("");
		             getComments("1");
		          },
		             error:function(request,status,error){
		                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                 }
		          });
		    }
		 }
	 
	 var replyPage = 1;
	
	
	 function getComments(pageInfo) {
		    $.ajax({
		       type: "post",
		       url : "${pageContext.request.contextPath}/artist/comments/${requestScope.artist.aid}/"+pageInfo,
		       success: function(data) {
		          printPaging(data.paging, $("#pagination"));
		          console.log(data);
		          replyPage = pageInfo;
		          var output = "";
		          for(var i in data.list) {
		          	var youtubeUrl = data.list[i].url;
		          	var youtubeUrlArray = String(youtubeUrl.split('/')[3]);
		              youtubeUrlArray = String(youtubeUrlArray.split('=')[1]);
		              var realUrl = '<iframe width="560" height="315" src="https://www.youtube.com/embed/'+youtubeUrlArray+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
		             output += "<tr id='comment"+data.list[i].no+"'>";
		             output += "<td style='vertical-align: middle;'id='commentWriter'>"+data.list[i].writer +"</td>";
		             output += "<td style='vertical-align: middle;'id='youtubeUrl'>"+realUrl +"</td>";
		             output += "<td style='vertical-align: middle;'id='commentContent'>"+data.list[i].content +"</td>";
		             output += "<td style='vertical-align: middle;'id='commentDate'>"+data.list[i].regDate +"</td>";
		             output += "<td>";
		             if(data.list[i].like==true) {
			             output += "<input type='button' class='btn btn-primary btn-sm' style='vertical-align: middle;' value='추천 완료' disabled></button>";	            	 		            	 
		             } else {
			             output += "<input type='button' class='btn btn-primary btn-sm' style='vertical-align: middle;' id='recomBtn"+data.list[i].no+"' value='추천' onclick='recom("+data.list[i].no+")'></button>";	            	 
		             } 
		             output += "</td>";
		             output += "<td style='vertical-align: middle;'>"+data.list[i].cnt+"</td>"
		             output += "<td>";
		             if ("${sessionScope.sessionName}" == data.list[i].writer
								|| "${sessionScope.AuthInfoId}" == data.list[i].writer) {
							output += "<button class='btn btn-danger' type='button' id='btnDelete' onclick='deleteComment("
									+ data.list[i].no + ")'>삭제</button>";
							output += "<button class='btn btn-warning' type='button' id='btnUpdate' onclick='editComment("
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

	var printPaging= function(pageMaker, target) {
	    var str ="";
	    if (pageMaker.curPage > 1 ) {
	       str += str += "<li style='display: inline-block;margin: 10px;'><a href='javascript:getComments(1)'> [이전] </a></li>";
	    }

	    for (var i = pageMaker.blockBegin; i <= pageMaker.blockEnd; i++) {
	       var strClass = pageMaker.curPage == i ? 'class=active' : '';
	       str += "<li "+"style='color:black;display: inline-block;margin: 10px;'"+strClass+"><a href='javascript:getComments("+i+")'>"+i+"</a></li>";
	    }

	    if (pageMaker.curBlock < pageMaker.blockEnd ) {
	       str += "<li style='color:black;display: inline-block;margin: 10px;'><a href='javascript:getComments("+pageMaker.blockEnd+")'> [다음] </a></li>";
	    }
	    target.html(str);
	 }
	
	
	function urlValidation() {
		var youtubeUrl = document.getElementById("youtubeUrl").value;
		var youtubeUrlArray = String(youtubeUrl.split('/')[3]);
		youtubeUrlArray = String(youtubeUrlArray.split('=')[1]);
		var realUrl = '<iframe width="560" height="315" src="https://www.youtube.com/embed/'+youtubeUrlArray+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
		var reple = document.getElementById("reple").value;
		var check = 'www.youtube.com';
		if (youtubeUrl.indexOf(check) != -1) {
			var table = document.getElementById("zickcamUrl");
			var row = table.insertRow(table.rows.length);
			var cell1 = row.insertCell();
			var cell2 = row.insertCell();
			var cell3 = row.insertCell();
			var cell4 = row.insertCell();
			cell1.innerHTML = "<td>" + realUrl + "</td>"
			cell2.innerHTML = "<td>" + reple + "</td>"
			cell3.innerHTML = "<td><input type='button' value='추천'></td>"
			cell4.innerHTML = "<td><input type='button' value='비추천'></td>"
			document.getElementById("youtubeUrl").value = "";
			document.getElementById("reple").value = "";
		} else {
			alert('올바른 Youtube URL을 입력해 주세요!');
			document.getElementById("youtubeUrl").focus();
		}
	} 
</script>

<title>Insert title here</title>
</head>

<body id="page-top">
	<!-- navbar -->
	 <nav class="main-nav-outer" id="test"style="font-family: Summer Festival;">		
		<div class="container">
			<ul class="main-nav" >						
				<li class="small-logo"><a href="/"><h2 style="font-family: Summer Festival;
				color:white;"><strong>HYESUKTIVAL</strong></h2></a></li>
				
				<li><a href="#service" class="container-1">				
				 <span class="icon"><i class="fa fa-search"></i></span>				 	
				<form action="/search" method="get">
				<input type="text" name="search" id="search" placeholder="Search..." />				
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
							<li>${AuthInfoNickname }님,반갑습니다!</li>							
							<li><a href="/myPage"><i class="mypage"></i> 마이페이지</a></li>
							<li style="margin-right: -60px;"><a href="/logout"><i class="logout"></i> 로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</c:catch>
			</ul>
			<a class="res-nav_click" href="#"><i class="fa fa-bars"></i></a>
		</div>
	</nav>
	
  <!-- nav end -->
	
	<!-- Masthead -->
	<header class="masthead  text-center"
		style="background:black;">
	<div class="container d-flex align-items-center flex-column">

		<div class='box2'>

			<img alt="" class="masthead-avatar" src="${requestScope.artist.src }"
				style="z-index: 50; margin-bottom: 7rem;">

			<div class='wave -one'></div>
			<div class='wave -two'></div>
			<div class='wave -three'></div>


			<h1 class="masthead-heading text-uppercase mb-0"
				style="font-family: 'S-CoreDream-8Heavy', sans-serif;color: white;">${requestScope.artist.aname }</h1>
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
			</div>


		</div>

	</div>

	</header>

	<!-- Portfolio Section -->
	<section class="page-section" id="portfolio">
	<div class="container">

		<!-- Portfolio Section Heading -->
		<div>
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0"
				style="font-family: 'S-CoreDream-8Heavy', sans-serif; word-spacing: 43rem; padding-left: 30px">인기곡
				랭킹투표</h2>
		</div>


		<!-- Icon Divider -->
		<div class="divider-custom">
			<div class="divider-custom-line"></div>
			<div class="divider-custom-line"
				style="max-width: 44rem; height: 0.25rem; background-color: transparent; margin-left: 10px;"></div>
			<div class="divider-custom-line"></div>
		</div>

		<div class="MList">
			<div class="recomList table-responsive">

				<a class="song" style="text-align: center"></a>
				<table class="table table-hover table-bordered" align="center"
					style="table-layout: fixed;">
					<thead>
						<tr>
							<td style="width: 70px;">순위</td>
							<td colspan="2" style="text-align: center" width="250px">곡</td>
							<td style="width: 90px;">앨범</td>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.musicAll }" begin="1" end="5"
							var="musicAll" varStatus="status">
							<tr>
								<td>${ status.count }</td>
								<td><img src="${musicAll.src }" width="90" height="90"></td>
								<td><h6>${musicAll.mname }</h6></td>
								<td><h6>${musicAll.album }</h6></td>

							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

			<div class="userRecomList table-responsive">
				
					 <table class="table table-bordered" style="table-layout: fixed;">
                  <!-- word-break:break-all; -->

                  <tr>
                     <c:forEach items="${requestScope.musicList }" begin="0" end="2"
                        var="music" varStatus="status">
                        <td colspan="4">
                           <div>
                              <a id="mid" style="display: none">${music.mid }</a> <img
                                 src="${music.src }" width="90px" height="90px">
                              <h6 style="text-align: center;">${status.count}위
                                 <c:set var="m" value="${music.mname }" />
                                 <c:choose>
                                    <c:when test="${fn:length(m) > 14}">
                                       <marquee direction="left">${music.mname }</marquee>
                                    </c:when>
                                    <c:otherwise>
                                       <br>${music.mname }</c:otherwise>
                                 </c:choose>
                              </h6>
                              <h6 style="text-align: center; color: red;"
                                 id="mCnt${music.mid}">${music.mCnt }</h6>
                              <div>
                              	<c:choose>
                              		<c:when test="${music.like == true}">
                              			<input class="btn btn-primary btn-sm" type="button"
	                                    style="width: 100px" disabled="disabled" value="투표 완료">
                              		</c:when>
                              		<c:otherwise>
		                                 <input class="btn btn-primary btn-sm" type="button"
		                                    style="width: 100px" id="voteBtn${music.mid}"
		                                    onclick="vote(${music.mid})" value="투표">
                              		</c:otherwise>
                              	</c:choose>
                              </div>

                           </div>
                        </td>
                     </c:forEach>
                  </tr>

                  <tr>
                     <c:forEach items="${requestScope.musicList }" begin="3" end="5"
                        var="music" varStatus="status">
                        <td colspan="4">
                           <div>
                              <a id="mid" style="display: none">${music.mid }</a> <img
                                 src="${music.src }" width="90px" height="90px">
                              <h6 style="text-align: center;">${status.count+3}위
                                 <c:set var="m" value="${music.mname }" />
                                 <c:choose>
                                    <c:when test="${fn:length(m) > 20}">
                                       <marquee direction="left">${music.mname }</marquee>
                                    </c:when>
                                    <c:otherwise>
                                       <br>${music.mname }</c:otherwise>
                                 </c:choose>
                              </h6>
                              <h6 style="text-align: center; color: red;"
                                 id="mCnt${music.mid}">${music.mCnt }</h6>
                              <div>
                              	<c:choose>
                              		<c:when test="${music.like == true}">
                              			<input class="btn btn-primary btn-sm" type="button"
	                                    style="width: 100px" disabled="disabled" value="투표 완료">
                              		</c:when>
                              		<c:otherwise>
		                                 <input class="btn btn-primary btn-sm" type="button"
		                                    style="width: 100px" id="voteBtn${music.mid}"
		                                    onclick="vote(${music.mid})" value="투표">
                              		</c:otherwise>
                              	</c:choose>
                              </div>
                           </div>
                        </td>
                     </c:forEach>
                  </tr>

                  <tr>
                     <c:forEach items="${requestScope.musicList }" begin="6" end="9"
                        var="music" varStatus="status">
                        <td colspan="3">
                           <div>
                              <a id="mid" style="display: none">${music.mid }</a> <img
                                 src="${music.src }" width="90px" height="90px">
                              <h6 style="text-align: center;">${status.count+6}위
                                 <c:set var="m" value="${music.mname }" />
                                 <c:choose>
                                    <c:when test="${fn:length(m) > 20}">
                                       <marquee direction="left">${music.mname }</marquee>
                                    </c:when>
                                    <c:otherwise>
                                       <br>${music.mname }</c:otherwise>
                                 </c:choose>
                              </h6>
                              <h6 style="text-align: center; color: red;"
                                 id="mCnt${music.mid}">${music.mCnt }</h6>
                              <div>
                              	<c:choose>
                              		<c:when test="${music.like == true}">
                              			<input class="btn btn-primary btn-sm" type="button"
	                                    style="width: 100px" disabled="disabled" value="투표 완료">
                              		</c:when>
                              		<c:otherwise>
		                                 <input class="btn btn-primary btn-sm" type="button"
		                                    style="width: 100px" id="voteBtn${music.mid}"
		                                    onclick="vote(${music.mid})" value="투표">
                              		</c:otherwise>
                              	</c:choose>
                              </div>
                           </div>

                        </td>
                     </c:forEach>
                  </tr>

               </table>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>


	</section>
	<section class="page-section portfolio bg-primary mb-0" id="portfolio">
	<div class="container">
		<!-- Portfolio Section Heading -->
		<h2
			class="page-section-heading text-center text-uppercase text-secondary mb-0"
			style="font-family: 'S-CoreDream-8Heavy', sans-serif;">꼭 봐야 하는 영상</h2>

		<!-- Icon Divider -->
		<div class="divider-custom">
			<!--  <div class="divider-custom-line"></div> -->
		</div>

		<c:choose>
			<c:when test="${empty AuthInfoId && empty sessionId }">
				<h6>로그인 후 댓글을 남길 수 있습니다.</h6>
				<a href="${pageContext.request.contextPath }/login"><button>로그인</button></a>
			</c:when>
			<c:otherwise>
				<form id="comments">
				<c:choose>
					<c:when test="${sessionId != null}">
						<h6>
							ID: <span id="id">${sessionName }</span>
						</h6>
					</c:when>
					<c:otherwise>
						<h6>
							ID: <span id="id">${AuthInfoId }</span>
						</h6>
					</c:otherwise>
				</c:choose>
				<input type="text" id="url"	name="url" class="form-control"
						placeholder="https://www.youtube.com/...">
				<textarea id="content" name="content" class="form-control"
				style="width: 100%; resize:none;" rows="3" cols="30"
				placeholder="댓글을 입력하세요"></textarea>		
				</form>
				<input type="button" class="btn pull-right btn-success" id="btn"
					onclick="insertComment()" style="float: right;" value="등록" />			
			</c:otherwise>
		</c:choose>


		<!--Comment-->
		<br> <br> <br>
		<div class="comments" style="font-family: Eoe_Zno_L">
			<table class="table table-bordered table-hover" style="table-layout: fixed;font-family: lottemartdream;" >
				<thead>
					<!-- <tr>
						<td colspan="3"><br></td>
					</tr> -->
					<td style="text-align: center;"><strong>작성자</strong></td>
					<td style="text-align: center;"><strong>영상</strong></td>
					<td style="width: 600px;text-align: center;"><strong>댓글</strong></td>
					<td style="text-align: center;"><strong>작성일</strong></td>
					<td style="text-align: center;"><strong>추천하기</strong></td>
					<td style="text-align: center;"><strong>추천수</strong></td>
					<td></td>
				</thead>
				<tbody id="commentsList">
				</tbody>
			</table>
			<div id="paging">
				<ul id="pagination">

				</ul>
			</div>

				
			</table>
			<div id="pageForm" align="center">
				<ul id="pagination" style="list-style:none;">
				
				</ul>
			</div>
		</div>
	</div>
	</section>



	<!-- Footer -->


	<!-- Copyright Section -->
	<section class="copyright py-4 text-center text-white">
	<div class="container">
		<small>Copyright &copy; Your Website 2019</small>
	</div>
	</section>

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-to-top d-lg-none position-fixed ">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"> <i class="fa fa-chevron-up"></i>
		</a>
	</div>
	
	<!-- Bootstrap core JavaScript -->
	<script src="/resources/Detail/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/Detail/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="/resources/Detail/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="/resources/Detail/resources/js/jqBootstrapValidation.js"></script>
	<script src="/resources/Detail/resources/js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="/resources/Detail/resources/js/freelancer.min.js"></script>

</body>
</html>