<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<title>HYESUKTIVAL</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, maximum-scale=1">
	
	<link rel="icon" href="favicon.png" type="image/png">
	<link rel="shortcut icon" href="favicon.ico" type="img/x-icon">

	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,800italic,700italic,600italic,400italic,300italic,800,700,600' rel='stylesheet' type='text/css'>

	<link href="/resources/main/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="/resources/main/css/style.css" rel="stylesheet" type="text/css">
	
	<link href="/resources/main/css/responsive.css" rel="stylesheet" type="text/css">
	<link href="/resources/main/css/magnific-popup.css" rel="stylesheet" type="text/css">
	<link href="/resources/main/css/animate.css" rel="stylesheet" type="text/css">

	<script type="text/javascript" src="/resources/main/js/jquery.1.8.3.min.js"></script>
	<script type="text/javascript" src="/resources/main/js/bootstrap.js"></script>
	<script type="text/javascript" src="/resources/main/js/jquery-scrolltofixed.js"></script>
	<script type="text/javascript" src="/resources/main/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="/resources/main/js/jquery.isotope.js"></script>
	<script type="text/javascript" src="/resources/main/js/wow.js"></script>
	<script type="text/javascript" src="/resources/main/js/classie.js"></script>
	<script type="text/javascript" src="/resources/main/js/magnific-popup.js"></script>
	<script src="/resources/main/contactform/contactform.js"></script>

	<!-- =======================================================
    Theme Name: Knight
    Theme URL: https://bootstrapmade.com/knight-free-bootstrap-theme/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
	======================================================= -->
	
	<!-- calendar.css -->
	<link href='/resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
	<link href='/resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
	<script src='/resources/fullcalendar/packages/core/main.js'></script>
	<style type="text/css">
		#container1{
				max-width: 1140px;
			    text-align: center;
			    height: 1000px;
			    width: 100%;
			    padding-right: 15px;
			    padding-left: 15px;
			    margin-right: auto;
			    margin-left: auto;
		
		}
		#searchdiv{  
			    flex: 0 0 25%;
			    max-width: 20%;
			    max-width: 40%;
			    */: ;
			    border: 2px solid black;
			    width: :200px;
			    /* height: 300px; */
			    cursor: pointer;
			    position: relative;
			    display: block;
			    max-width: 20%;
			    margin-bottom: 30px;
			    border-radius: 0.5rem;
			    overflow: hidden;
		}
		
		#div0{
				    display: -webkit-box;
				    display: -ms-flexbox;
				    display: flex;
				    -ms-flex-wrap: wrap;
				    flex-wrap: wrap;
				    margin-right: -15px;
				    margin-left: -15px;
		}
	</style>
	

</head>

<body>	
	<!-- nav start -->	
	<nav class="main-nav-outer" id="test"style="font-family: Summer Festival;">
		<div class="container" style="margin-top: -10px;margin-bottom: -10px;">
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
	<!--nav end-->
			
	<!--searchlist start-->
	<section class="wow" id="service"
	style="height: 1400px;background:url('/resources/Detail/img/mic2.jpg');margin-top: -20px;">
	 <div id="container1">  
		  	<br>
			<h1 style="font-family: LotteMartDream;"><strong>페스티벌 검색결과</strong></h1>
			<hr>
			<c:choose>
				<c:when test="${empty requestScope.searchList }">
				<h2>페스티벌 검색 결과가 없습니다</h2>
				</c:when>
				
				<c:otherwise>
					<c:forEach items="${requestScope.searchList }" var="result">
						<h4><a href="${pageContext.request.contextPath }/festival/${result.fid}"
						 style="color:white;font-family:'Eoe_Zno_L';">${result.fname }</a></h4>
					</c:forEach>
				</c:otherwise>			
			</c:choose>
			<br>
			<br>			
			<h1 style="font-family: LotteMartDream;"><strong>아티스트 검색결과</strong></h1>	
			<hr>
			<div id="div0">
				<c:choose>
					<c:when test="${empty requestScope.searchArtistList }" > 
					 <h2>아티스트 검색 결과가 없습니다</h2>
					</c:when>
					<c:otherwise>
						<c:forEach items="${requestScope.searchArtistList }" var="result2">
											
						<div id="searchdiv">
							<div>
								<img alt="" src="${result2.src }" width="150px">
							</div>
							<div>
								<c:forEach items="${ resultMap }" var="map">
								<c:if test="${ map.key == result2.aid }">
									<c:forEach items="${ map.value }" var="mapvalue">
									<h5><a href="${pageContext.request.contextPath }/festival/${mapvalue.fid}">${ mapvalue.fname }</a><br></h5>
									</c:forEach>
								</c:if>
								</c:forEach>						
								<h5><a>${result2.aname }</a></h5>
							</div>							
															
						</div>
						</c:forEach>	
					</c:otherwise>
				</c:choose>
				
		 	 </div>
	  </div>
 		 	
	</section>
	<!--searchlist end-->
		
	<footer class="footer">
		<div class="container">
			<h2 style="font-family: Summer Festival;color:white;">HYESUKTIVAL</h2>
			<span class="copyright">&copy; Knight Theme. All Rights Reserved</span>
			<div class="credits">
			
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>


	<script type="text/javascript">
		$(document).ready(function(e) {

			$('#test').scrollToFixed();
			$('.res-nav_click').click(function() {
				$('.main-nav').slideToggle();
				return false

			});

      $('.Portfolio-box').magnificPopup({
        delegate: 'a',
        type: 'image'
      });

		});
	</script>

	<script>
		wow = new WOW({
			animateClass: 'animated',
			offset: 100
		});
		wow.init();
	</script>


	<script type="text/javascript">
		$(window).load(function() {

			$('.main-nav li a, .servicelink').bind('click', function(event) {
				var $anchor = $(this);

				$('html, body').stop().animate({
					scrollTop: $($anchor.attr('href')).offset().top - 102
				}, 1500, 'easeInOutExpo');
				/*
				if you don't want to use the easing effects:
				$('html, body').stop().animate({
					scrollTop: $($anchor.attr('href')).offset().top
				}, 1000);
				*/
				if ($(window).width() < 768) {
					$('.main-nav').hide();
				}
				event.preventDefault();
			});
		})
	</script>

	<script type="text/javascript">
		$(window).load(function() {


			var $container = $('.portfolioContainer'),
				$body = $('body'),
				colW = 375,
				columns = null;


			$container.isotope({
				// disable window resizing
				resizable: true,
				masonry: {
					columnWidth: colW
				}
			});

			$(window).smartresize(function() {
				// check if columns has changed
				var currentColumns = Math.floor(($body.width() - 30) / colW);
				if (currentColumns !== columns) {
					// set new column count
					columns = currentColumns;
					// apply width to container manually, then trigger relayout
					$container.width(columns * colW)
						.isotope('reLayout');
				}

			}).smartresize(); // trigger resize to set container width
			$('.portfolioFilter a').click(function() {
				$('.portfolioFilter .current').removeClass('current');
				$(this).addClass('current');

				var selector = $(this).attr('data-filter');
				$container.isotope({

					filter: selector,
				});
				return false;
			});

		});
	</script>

 <!-- Bootstrap core JavaScript -->
<!--   <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  Plugin JavaScript
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  Contact Form JavaScript
  <script src="../js/jqBootstrapValidation.js"></script>
  <script src="../js/contact_me.js"></script>

  Custom scripts for this template
  <script src="../js/freelancer.min.js"></script>
  
  <script src='/resources/fullcalendar/packages/interaction/main.js'></script>
  <script src='/resources/fullcalendar/packages/daygrid/main.js'></script> -->

</body>

</html>

